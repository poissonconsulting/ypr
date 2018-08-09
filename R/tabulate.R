#' Population Parameters
#'
#' @inheritParams ypr_schedule
#' @return A table of population parameters
#' @export
#' @examples
#' ypr_tabulate_parameters(ypr_population())
ypr_tabulate_parameters <- function(population) {
  check_population(population)

  parameters <- data.frame(Parameter = names(population),
                     Value = unname(unlist(population)),
                     stringsAsFactors = FALSE)

  pattern <- "(\\\\item[{])([^}]+)([}])([{])([^}]+)([}])"
  rd <- tools::Rd_db("ypr")$ypr_population.Rd
  rd <- paste0(as.character(rd), collapse = "")
  gp <- gregexpr(pattern, rd)
  rd <- regmatches(rd, gp)[[1]]

  data <- data.frame(Parameter = sub(pattern, "\\2", rd),
                     Description = sub(pattern, "\\5", rd),
                     stringsAsFactors = FALSE)

  parameters <- merge(parameters, data, by = "Parameter", sort = FALSE)

  if(requireNamespace("tibble", quietly = TRUE))
    parameters <- tibble::as_tibble(parameters)
  parameters
}

#' Stock-Recruitment Parameters
#'
#' @inheritParams ypr_schedule
#' @inheritParams ypr_yield
#' @return A table of stock-recruitment parameters.
#' @export
#' @examples
#' ypr_tabulate_sr(ypr_population()) # Beverton-Holt
#' ypr_tabulate_sr(ypr_population(BH = 0L)) # Ricker
ypr_tabulate_sr <- function(population, Ly = 0, harvest = FALSE, biomass = FALSE) {
  sr <- ypr_sr(population)
  sr$BH <- population$BH

  population$pi <- ypr_optimise(population, Ly = Ly, harvest = harvest, biomass = biomass)
  optimal_sr <- ypr_sr(population)

  table <- with(sr, {
    data <- data.frame(
      Type = c("unfished", "actual", "optimal"),
      Eggs = c(phi * R0, phiF * R0F, optimal_sr$phiF * optimal_sr$R0F),
      stringsAsFactors = FALSE
    )
    fun <- if(BH == 1L) bh else ri
    data$Recruits <- fun(data$Eggs, alpha, beta)
    data
  })

  attr(table, "alpha") <- sr$alpha
  attr(table, "beta") <- sr$beta
  attr(table, "Ly") <- Ly
  attr(table, "harvest") <- harvest
  attr(table, "biomass") <- biomass

  if(requireNamespace("tibble", quietly = TRUE))
    table <- tibble::as_tibble(table)
  table
}

#' Tabulate Yield
#'
#'
#' @inheritParams ypr_schedule
#' @inheritParams ypr_yield
#' @return A data frame.
#' @seealso \code{\link{ypr_population}} and \code{\link{ypr_yield}}
#' @export
#' @examples
#' ypr_tabulate_yield(ypr_population())
ypr_tabulate_yield <- function(population, Ly = 0, harvest = FALSE, biomass = FALSE) {

  actual_pi <- population$pi

  optimal_pi <- ypr_optimize(population, Ly = Ly, harvest = harvest,
                             biomass = biomass)

  actual_yield <- ypr_yield(population, Ly = Ly, harvest = harvest,
                            biomass = biomass)

  optimal_yield <- ypr_yields(population, pi = optimal_pi, Ly = Ly, harvest = harvest,
                              biomass = biomass)

  yield <- data.frame(Type = c("actual", "optimal"),
                      pi = c(actual_pi, optimal_pi),
                      Yield = c(actual_yield, optimal_yield),
                      stringsAsFactors = FALSE)

  attr(yield, "Ly") <- Ly
  attr(yield, "harvest") <- harvest
  attr(yield, "biomass") <- biomass

  if(requireNamespace("tibble", quietly = TRUE))
    yield <- tibble::as_tibble(yield)
  yield
}

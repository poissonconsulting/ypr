#' Population Parameters
#'
#' @inheritParams ypr_schedule
#' @return A table of population parameters
#' @seealso \code{\link{ypr_population}}
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

#' Import Parameters
#'
#' @param x A data frame with columns Parameter and Value specifying
#' one or more parameters and their values.
#' @return An object of class \code{\link{ypr_population}}
#' @seealso \code{\link{ypr_population}}
#' @export
#' @examples
#' ypr_import_parameters(ypr_tabulate_parameters(ypr_population()))
ypr_import_parameters <- function(x) {
  check_data(
    x,
    values = list(Parameter = .parameters$Parameter,
                  Value = c(min(.parameters$Lower), max(.parameters$Upper))),
    key = "Parameter")

  x <- merge(x, .parameters[c("Parameter", "Integer")], by = "Parameter", sort = FALSE)

  parameters <- as.list(x$Value)
  names(parameters) <- x$Parameter

  parameters <- mapply(function(x, y) if(y == 1) as.integer(x) else x,
                       parameters, x$Integer, SIMPLIFY = FALSE)

  population <- do.call("ypr_population", parameters)
  population
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
    data$Spawners = c(S0, S0F, optimal_sr$S0F)
    data$Fecundity <- data$Eggs / data$Spawners
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
#' @param optimal A flag indicating whether to include the optimal yield.
#' @return A data frame.
#' @seealso \code{\link{ypr_population}} and \code{\link{ypr_yield}}
#' @export
#' @examples
#' ypr_tabulate_yield(ypr_population())
ypr_tabulate_yield <- function(population, Ly = 0, harvest = FALSE, biomass = FALSE,
                               optimal = TRUE) {

  check_flag(optimal)

  actual_pi <- population$pi

  actual_yield <- ypr_yield(population, Ly = Ly, harvest = harvest,
                            biomass = biomass)

  if(optimal) {
    optimal_pi <- ypr_optimize(population, Ly = Ly, harvest = harvest,
                               biomass = biomass)

    population <- ypr_population_update(population, pi = optimal_pi)

    optimal_yield <- ypr_yield(population, Ly = Ly, harvest = harvest,
                               biomass = biomass)
    yield <- data.frame(Type = c("actual", "optimal"),
                        pi = c(actual_pi, optimal_pi),
                        Yield = c(actual_yield, optimal_yield),
                        Age = c(attr(actual_yield, "Age"), attr(optimal_yield, "Age")),
                        Length = c(attr(actual_yield, "Length"), attr(optimal_yield, "Length")),
                        Weight = c(attr(actual_yield, "Weight"), attr(optimal_yield, "Weight")),
                        stringsAsFactors = FALSE)
  } else {
    yield <- data.frame(Type = "actual",
                        pi = actual_pi,
                        Yield = actual_yield,
                        Age = attr(actual_yield, "Age"),
                        Length = attr(actual_yield, "Length"),
                        Weight = attr(actual_yield, "Weight"),
                        stringsAsFactors = FALSE)
  }

  attr(yield, "Ly") <- Ly
  attr(yield, "harvest") <- harvest
  attr(yield, "biomass") <- biomass

  if(requireNamespace("tibble", quietly = TRUE))
    yield <- tibble::as_tibble(yield)
  yield
}

tabulate_yield_pi <- function(pi, population, Ly, harvest, biomass) {
  population$pi <- pi
  yield <- ypr_tabulate_yield(population = population, Ly = Ly,
                              harvest = harvest, biomass = biomass,
                              optimal = FALSE)
  yield$Type <- NULL
  yield
}

#' Tabulate Yields
#'
#'
#' @inheritParams ypr_schedule
#' @inheritParams ypr_yields
#' @inheritParams ypr_yield
#' @return A data frame.
#' @seealso \code{\link{ypr_population}} and \code{\link{ypr_yields}}
#' @export
#' @examples
#' ypr_tabulate_yields(ypr_population())
ypr_tabulate_yields <- function(population, pi = seq(0, 1, length.out = 100),
                                Ly = 0, harvest = FALSE, biomass = FALSE) {

  check_vector(pi, c(0, 1), length = TRUE)

  yields <- lapply(pi, tabulate_yield_pi, population = population, Ly = Ly,
                   harvest = harvest, biomass = biomass)

  yields <- do.call(rbind, yields)

  attr(yield, "Ly") <- Ly
  attr(yield, "harvest") <- harvest
  attr(yield, "biomass") <- biomass

  if(requireNamespace("tibble", quietly = TRUE))
    yields <- tibble::as_tibble(yields)
  yields
}

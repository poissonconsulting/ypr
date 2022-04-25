#' Tabulate Stock-Recruitment Parameters
#'
#' @inheritParams params
#' @return A data.frame of stock-recruitment parameters.
#' @family tabulate
#' @family populations
#' @family sr
#' @export
#' @examples
#' ypr_tabulate_sr(ypr_population()) # Beverton-Holt
#' ypr_tabulate_sr(ypr_population(BH = 0L)) # Ricker
#' ypr_tabulate_sr(ypr_populations(Rk = c(2.5, 4.6)))
ypr_tabulate_sr <- function(object, ...) {
  UseMethod("ypr_tabulate_sr")
}

#' @describeIn ypr_tabulate_sr Tabulate Stock-Recruitment Parameters
#' @export
ypr_tabulate_sr.ypr_population <- function(object, Ly = 0, harvest = TRUE,
                                           biomass = FALSE, all = FALSE, ...) {
  sr <- ypr_sr(object)
  sr$BH <- object$BH

  pi <- object$pi
  object$pi <- ypr_optimise(
    object,
    Ly = Ly,
    harvest = harvest,
    biomass = biomass
  )
  optimal_sr <- ypr_sr(object)

  table <- with(sr, {
    data <- data.frame(
      Type = c("unfished", "actual", "optimal"),
      pi = c(0, pi, object$pi),
      u = ypr_exploitation(object, c(0, pi, object$pi)),
      Eggs = c(phi * R0, phiF * R0F, optimal_sr$phiF * optimal_sr$R0F),
      stringsAsFactors = FALSE
    )
    fun <- if (BH == 1L) bh else ri
    data$Recruits <- fun(data$Eggs, alpha, beta)
    data$Spawners <- c(S0, S0F, optimal_sr$S0F)
    data$Fecundity <- data$Eggs / data$Spawners * 2
    data
  })

  if (all) table <- add_parameters(table, object)

  as_tibble(table)
}

#' @describeIn ypr_tabulate_sr Tabulate Stock-Recruitment Parameters
#' @export
ypr_tabulate_sr.ypr_populations <- function(object,
                                            Ly = 0,
                                            harvest = TRUE,
                                            biomass = FALSE,
                                            all = FALSE, ...) {
  chk_flag(all)

  sr <- lapply(object, ypr_tabulate_sr,
               Ly = Ly, harvest = harvest,
               biomass = biomass, all = TRUE, ...
  )

  sr <- do.call("rbind", sr)

  if (!all) sr <- drop_constant_parameters(sr)

  as_tibble(sr)
}

#' @describeIn ypr_tabulate_sr Tabulate Stock-Recruitment Parameters
#' @export
ypr_tabulate_sr.ypr_ecotypes <- function(object,
                                         Ly = 0,
                                         harvest = TRUE,
                                         biomass = FALSE,
                                         all = FALSE, ...) {
  chk_flag(all)

  sr <- lapply(object, ypr_tabulate_sr,
               Ly = Ly, harvest = harvest,
               biomass = biomass, all = TRUE, ...
  )

  proportions <- get_prop(object)
  eco_names <- names(object)

  sr <- mapply(function(sr, proportions, eco_names) {
    sr[["Ecotype"]] <- eco_names
    sr[["Proportion"]] <- proportions
    sr

  }, sr, proportions, eco_names, SIMPLIFY = FALSE)

  sr <- do.call("rbind", sr)
  if (!all) sr <- drop_constant_parameters(sr)
  as_tibble(sr)
}

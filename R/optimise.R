#' Optimize Capture
#'
#' Calculates the optimal yield for the population based on alternative
#' capture rates.
#'
#' @inheritParams ypr_population
#' @inheritParams ypr_schedule
#' @inheritParams ypr_yield
#' @aliases ypr_optimise
#' @export ypr_optimize ypr_optimise
#' @examples
#' ypr_optimize(ypr_population())
ypr_optimize <- function(population,
                         Ly = 0, harvest = TRUE, biomass = TRUE) {
  check_population(population)
  check_scalar(Ly, c(0, Inf))
  check_flag(biomass)
  check_flag(harvest)

  yield <- stats::optimize(yield_mu, c(0, 1), population = population,
                           Ly = Ly, harvest = harvest, biomass = biomass,
                           maximum = TRUE)$objective
  sanitize(yield)
}

ypr_optimise <- ypr_optimize

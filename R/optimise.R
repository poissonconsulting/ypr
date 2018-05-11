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
#' ypr_optimize()
ypr_optimize <- function(population = ypr_population(),
                         Ly = 0, harvest = TRUE, biomass = TRUE,
                         check = TRUE) {
  check_flag(check)
  check_population(population)

  yield <- stats::optimize(yield, c(0, 1), population = population,
           Ly = Ly, harvest = harvest, biomass = biomass, check = check,
           maximum = TRUE)$objective
  sanitize(yield)
}

ypr_optimise <- ypr_optimize

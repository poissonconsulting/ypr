yield <- function(mu, population = population, Ly = Ly, harvest = harvest, biomass = biomass,
                  check = check) {
  population$mu <- mu
  schedule <- ypr_schedule(population, check = check)
  ypr_yield(schedule, Ly = Ly, harvest = harvest, biomass = biomass, check = check)
}

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
                         check = FALSE) {
  check_flag(check)
  check_population(population)

  stats::optimize(yield, c(0, 1), population = population,
           Ly = Ly, harvest = harvest, biomass = biomass, check = check,
           maximum = TRUE)$objective
}

ypr_optimise <- ypr_optimize

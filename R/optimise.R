optimize_pi <- function(population, Ly, harvest, biomass) {
  stats::optimize(yield_pi, c(0, 1), population = population,
                           Ly = Ly, harvest = harvest, biomass = biomass,
                           maximum = TRUE)$maximum
}

#' Optimize Capture
#'
#' Finds the capture rate that maximises the yield for a given population.
#'
#' @inheritParams ypr_population
#' @inheritParams ypr_schedule
#' @inheritParams ypr_yield
#' @aliases ypr_optimise
#' @seealso \code{\link{ypr_population}} and \code{\link{ypr_yields}}
#' @export
#' @examples
#' ypr_optimize(ypr_population())
ypr_optimize <- function(population,
                         Ly = 0, harvest = FALSE, biomass = FALSE) {
  check_population(population)
  check_scalar(Ly, c(0, Inf))
  check_flag(biomass)
  check_flag(harvest)

  yield <- optimize_pi(population = population, Ly = Ly,
                       harvest = harvest, biomass = biomass)
  sanitize(yield)
}

#' @export
ypr_optimise <- ypr_optimize

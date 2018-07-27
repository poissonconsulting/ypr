#' Yield with Uncertainty
#'
#' Calculates a yield with lower and upper limits.
#' The uncertainty in each population parameter is assumed to be a uniform distribution between the value in population and the value in population2.
#' The parameters are assumed to be uncorrelated and there is no requirement
#' for the value in population to be less than the value in population2
#' The parameters \code{tmax} and \code{Rk} must not vary.
#'
#' @inheritParams ypr_yield
#' @param population2 A second list of population life-history parameters.
#' @param n A numeric of the number of iterations.
#' @param level A probability of the interval.
#' @param mc.cores The number of cores to use, i.e. at most how many child processes will be run simultaneously.
#' The option is initialized from environment variable MC_CORES if set.
#' Must be at least one, and parallelization requires at least two cores.
#' @return A double vector of the yield and its lower and upper limits.
#' @seealso \code{\link{ypr_population}} and \code{\link{ypr_yield}}
#' @export
#' @examples
#' population <- ypr_population()
#' ypr_yield_uncertainty(ypr_population_update(population, Rk = 10), ypr_population())
ypr_yield_uncertainty <- function(population, population2, Ly = 0,
                                  harvest = TRUE, biomass = TRUE, n = 10^4,
                                  level = 0.95, mc.cores = getOption("mc.cores", 2L)) {
  check_population(population)
  check_population(population2)
  check_scalar(Ly, c(0, Inf))
  check_flag(harvest)
  check_flag(biomass)
  check_probability(level)

  populations <- sample_population(population, population2, n = n)
  yields <- parallel::mclapply(populations, FUN = ypr_yield,
                               Ly = Ly, harvest = harvest, biomass = biomass,
                               sanitize = TRUE, check = FALSE, mc.cores = mc.cores,
                               mc.allow.recursive = FALSE)
  quantiles(yields, level = level)
}

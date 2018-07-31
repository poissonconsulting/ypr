#' Optimize Capture with Uncertainty
#'
#' Finds the capture rate that maximises the yield for a given population with uncertainty.
#' The uncertainty in each population parameter is assumed to be a uniform distribution between the value in population and the value in population2.
#' The parameters are assumed to be uncorrelated and there is no requirement
#' for the value in population to be less than the value in population2
#' The parameters \code{tmax} and \code{Rk} must not vary.
#'
#' @inheritParams ypr_population
#' @inheritParams ypr_schedule
#' @inheritParams ypr_yield
#' @inheritParams ypr_yield_uncertainty
#' @param population2 A second list of population life-history parameters.
#' @aliases ypr_optimise_uncertainty
#' @seealso \code{\link{ypr_population}}, \code{\link{ypr_yields}} and
#' \code{\link{ypr_optimize}}
#' @export
#' @examples
#' population <- ypr_population()
#' population$Rk <- 10
#' ypr_optimize_uncertainty(population, ypr_population(), n = 10)
ypr_optimize_uncertainty <- function(
  population, population2,
  Ly = 0, harvest = FALSE, biomass = FALSE, n = 10^4,
  level = 0.95, mc.cores = getOption("mc.cores", 2L)) {
  check_population(population)
  check_population(population2)
  check_scalar(Ly, c(0, Inf))
  check_flag(biomass)
  check_flag(harvest)
  check_probability(level)

  population <- sample_population(population, population2, n = n)

  yields <- lapply(population, FUN = optimize_pi, Ly = Ly,
                   harvest = harvest, biomass = biomass)
  quantiles(yields, level = level)
}

#' @export
ypr_optimise_uncertainty <- ypr_optimize_uncertainty

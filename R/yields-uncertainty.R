#' Yields
#'
#' Calculates the yield(s) for a population based on one or more capture rates.
#'
#' @param mu A vector of probabilities of capture to calculate the yield for.
#' @inheritParams ypr_schedule
#' @inheritParams ypr_yield
#' @inheritParams ypr_yield_uncertainty
#' @seealso \code{\link{ypr_population}} and
#' \code{\link{ypr_yields}}
#' @return A double vector of the yields.
#' @export
#' @examples
#' population <- ypr_population_update(ypr_population(), Rk = 10)
#' ypr_yields_uncertainty(ypr_population(), population, n = 10)
ypr_yields_uncertainty <- function(population, population2,
                                   mu = seq(0, 1, length.out = 100),
                                   Ly = 0, harvest = TRUE, biomass = TRUE,
                                   n = 10^4, level = 0.95,
                                   mc.cores = getOption("mc.cores", 2L)) {

  check_population(population)
  check_population(population2)
  check_vector(mu, c(0, 1), length = TRUE)
  check_scalar(Ly, c(0, Inf))
  check_flag(biomass)
  check_flag(harvest)
  check_probability(level)

  populations <- sample_population(population, population2, n = n)

  yields <- parallel::mclapply(populations, FUN = ypr_yields, mu = mu,
                               Ly = Ly, harvest = harvest,
                               biomass = biomass, check = FALSE,
                               mc.cores = mc.cores,
                               mc.allow.recursive = FALSE)


  yields <- simplify2array(yields)
  yields <- apply(yields, 1, quantiles, level = level)
  yields <- t(yields)
  yields
}

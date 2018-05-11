#' Population Parameters
#'
#' Generates a list of the life-history parameters
#' for a fish population.
#' The default parameters are for a hypothetical population that
#' lives to 20 years of age,
#' grows to a mean maximum length of 100 with a k of 0.15,
#' undergoes allometric growth and fecundity and matures at a length of 50
#' has a natural mortality rate of 20% from age 1
#' and has a capture rate of 20% from a length of 50 onwards with no catch and release.
#'
#' @param tmax The maximum age.
#' @param k The growth coefficient.
#' @param Linf The mean maximum length.
#' @param t0 The age at length 0.
#' @param a The condition factor.
#' @param b The scaling exponent.
#' @param Lm The length at maturity.
#' @param fa The fecundity factor.
#' @param fb The fecundity scaling exponent.
#' @param Rt The recruitment age for the stock recruitment relationship.
#' @param nu The annual probability of dying due to natural causes.
#' @param Lv The length at which vulnerable to harvest.
#' @param Llo The lower harvest length.
#' @param Lup The upper harvest length.
#' @param mu The annual probability of being captured.
#' @param rho The release probability.
#' @param eta The hooking mortality probability.
#' @param Rk The numbers of spawners per spawner at low density.
#' @return A list of the life-history parameters for a particular population.
#' @seealso \code{\link{ypr_schedule}}, \code{\link{plot.ypr_population}},
#' \code{\link{ypr_yield}}, \code{\link{ypr_plot}}
#' and \code{\link{ypr_optimize}}
#' @export
#' @examples
#' ypr_population()
ypr_population <- function(tmax = 20L, k = 0.15, Linf = 100, t0 = 0, a = 1e-05, b = 3,
                Lm = Linf/2, fa = 1, fb = 1,
                Rt = 1L, nu = 0.2,
                Lv = Linf/2, Llo = 0, Lup = Linf,
                mu = 0.2, rho = 0, eta = 0, Rk = 5) {
  population <- as.list(environment())
  class(population) <- c("ypr_population")
  check_population(population)
}

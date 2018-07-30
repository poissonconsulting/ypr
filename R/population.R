#' Population Parameters
#'
#' Generates a list of the life-history parameters
#' for a fish population.
#'
#' The default parameters are for a hypothetical population that
#' allometrically grows to a mean maximum length of 100 with a k of 0.15,
#' and both matures and becomes vulnerable to harvest at a length of 50.
#'
#' @param tmax The maximum age.
#' @param k The growth coefficient.
#' @param Linf The mean maximum length.
#' @param t0 The extrapolated age at length 0.
#' @param b The condition scaling exponent.
#' @param Lm The length at maturity.
#' @param fb The fecundity scaling exponent.
#' @param Rt The recruitment age for the stock recruitment relationship.
#' @param nu The conditional annual probability of dying due to natural causes.
#' @param Lv The length at which 50\% vulnerable to harvest.
#' @param Vp The vulnerability to harvest power.
#' @param Llo The lower harvest slot length.
#' @param Lup The upper harvest slot length.
#' @param Nc The slot limits non-compliance probability.
#' @param mu The conditional annual probability of being captured.
#' @param rho The release probability.
#' @param eta The hooking mortality probability.
#' @param Rk The numbers of spawners per spawner at low density.
#' @param R0 The number of recruits at the carrying capacity.
#' @param Wa The weight of a unit length individual.
#' @param fa The (extrapolated) fecundity of a unit weight female.
#' @return An object of class \code{ypr_population}.
#' @seealso \code{\link{plot.ypr_population}} and \code{\link{ypr_population_update}}.
#' @export
#' @examples
#' ypr_population()
ypr_population <- function(tmax = 20L, k = 0.15, Linf = 100, t0 = 0,
                           b = 3, Lm = Linf/2, fb = 1,
                           Rt = 1L, nu = 1-exp(-1.5 * k),
                           Lv = Linf/2, Vp = 100,
                           Llo = 0, Lup = Linf, Nc = 0,
                           mu = 0.2, rho = 0, eta = 0, Rk = 5,
                           R0 = 1, Wa = 1, fa = 1) {
  population <- as.list(environment())
  class(population) <- c("ypr_population")
  check_population(population)
}

#' Update Population Parameters
#'
#' Updates a list of the life-history parameters for a fish population.
#'
#' @param population An object of class \code{ypr_population}
#' @param ... One or more of the arguments from \code{ypr_population()}.
#' @return An object of class \code{ypr_population}.
#' @seealso \code{\link{ypr_population}}
#' @export
#' @examples
#' ypr_population_update(ypr_population(), Rk = 2.5)
ypr_population_update <- function(population, ...) {
  check_population(population)
  parameters <- eval(substitute(alist(...)))
  population[names(parameters)] <- unname(parameters)
  check_population(population)
}

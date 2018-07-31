#' Population Parameters
#'
#' Generates a list of the life-history parameters
#' for a fish population.
#'
#' The default parameters are for a hypothetical population that
#' isometrically grows to a mean maximum length of 100 cm with a k of 0.15,
#' and both matures and becomes vulnerable to harvest at a length of 50.
#'
#' @param tmax The maximum age (yr).
#' @param k The VB growth coefficient (per yr).
#' @param Linf The VB mean maximum length (cm).
#' @param t0 The (theoretical) age at zero length (yr).
#' @param Wb The weight (as a function of length) scaling exponent.
#' @param Lm The length at maturity (cm).
#' @param fb The fecundity (as a function of weight) scaling exponent.
#' @param tR The age from which survival is density-independent (yr).
#' @param Rk The numbers of spawners per spawner at low density.
#' @param M The instantaneous mortality rate (per yr).
#' @param Mb The instantaneous mortality rate (as a function of length) scaling exponent.
#' @param Lv The length at which 50\% vulnerable to harvest (cm).
#' @param Vp The vulnerability to harvest (as function of length) power.
#' @param Llo The lower harvest slot length (cm).
#' @param Lup The upper harvest slot length (cm).
#' @param Nc The slot limits non-compliance probability.
#' @param pi The annual capture probability.
#' @param rho The release probability.
#' @param Hm The hooking mortality.
#' @param R0 The number of recruits at the carrying capacity (ind).
#' @param Wa The (extrapolated) weight of a 1 cm individual (g).
#' @param fa The (theoretical) fecundity of a 1 g female (eggs).
#' @return An object of class \code{ypr_population}.
#' @seealso \code{\link{plot.ypr_population}} and \code{\link{ypr_population_update}}.
#' @export
#' @examples
#' ypr_population()
ypr_population <- function(tmax = 20L, k = 0.15, Linf = 100, t0 = 0,
                           Wb = 3, Lm = Linf/2, fb = 1,
                           tR = 1L, M = 0.2, Mb = 0,
                           Lv = Linf/2, Vp = 100,
                           Llo = 0, Lup = Linf, Nc = 0,
                           pi = 0.2, rho = 0, Hm = 0, Rk = 3,
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

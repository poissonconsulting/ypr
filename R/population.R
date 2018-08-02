#' Population Parameters
#'
#' Generates an object of class \code{ypr_population}.
#'
#' @param tmax The maximum age (yr).
#' @param k The VB growth coefficient (per yr).
#' @param Linf The VB mean maximum length (cm).
#' @param t0 The (theoretical) age at zero length (yr).
#' @param Wb The weight (as a function of length) scaling exponent.
#' @param Ls The length at which 50\% spawning (cm).
#' @param Sp The spawning (as a function of length) power.
#' @param es The annual probability of a mature fish spawning.
#' @param Sm The spawning mortality probability.
#' @param fb The fecundity (as a function of weight) scaling exponent.
#' @param tR The age from which survival is density-independent (yr).
#' @param BH Recruitment follows a Beverton-Holt (1) or Ricker (0) relationship.
#' @param Rk The numbers of spawners per spawner at low density.
#' @param M The instantaneous mortality rate (per yr).
#' @param Mb The instantaneous mortality rate (as a function of length) scaling exponent.
#' @param Lv The length at which 50\% vulnerable to harvest (cm).
#' @param Vp The vulnerability to harvest (as a function of length) power.
#' @param Llo The lower harvest slot length (cm).
#' @param Lup The upper harvest slot length (cm).
#' @param Nc The slot limits non-compliance probability.
#' @param pi The annual capture probability.
#' @param rho The release probability.
#' @param Hm The hooking mortality probability.
#' @param R0 The number of recruits at the unfished equilibrium (ind).
#' @param Wa The (extrapolated) weight of a 1 cm individual (g).
#' @param fa The (theoretical) fecundity of a 1 g female (eggs).
#' @return An object of class \code{ypr_population}.
#' @seealso \code{\link{ypr_population_update}}, \code{\link{ypr_schedule}},
#' \code{\link{ypr_yield}} and \code{\link{ypr_optimize}}.
#' @export
#' @examples
#' ypr_population(k = 0.1, Linf = 90)
ypr_population <- function(tmax = 20L, k = 0.15, Linf = 100, t0 = 0,
                           Wb = 3, Ls = Linf/2, Sp = 100, es = 1, Sm = 0,
                           fb = 1,
                           tR = 1L, BH = 1L, Rk = 3, M = 0.2, Mb = 0,
                           Lv = Linf/2, Vp = 100,
                           Llo = 0, Lup = Linf, Nc = 0,
                           pi = 0.2, rho = 0, Hm = 0,
                           R0 = 1, Wa = 1, fa = 1) {
  population <- as.list(environment())
  class(population) <- c("ypr_population")
  check_population(population)
}

#' Update Population Parameters
#'
#' Updates an object of class \code{\link{ypr_population}}.
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
  print(parameters)
  population[names(parameters)] <- unname(parameters)
  check_population(population)
}

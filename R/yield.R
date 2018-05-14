yield_mu <- function(mu, population, Ly, harvest, biomass) {
  population$mu <- mu
  yield <- ypr_yield(population, Ly = Ly, harvest = harvest, biomass = biomass,
                     sanitize = FALSE, check = FALSE)
}

#' Yield
#'
#' Calculates the yield for a population in terms of the proportion of the unfished population abundance or biomass.
#'
#' @param x A list of population life-history parameters or a data frame of the complete life-history schedule.
#' @param Ly The minimum length fish to consider.
#' @param harvest A flag indicating whether to calculate the yield over harvested versus captured fish.
#' @param biomass A flag indicating whether to calculate the yield in terms of the biomass versus number of individual fish.
#' @param sanitize A flag indicating whether to replace negative or NaNs with 0.
#' @param check A flag indicating whether to check the arguments.
#' @seealso \code{\link{ypr_population}}, \code{\link{ypr_optimize}},
#' \code{\link{ypr_yields}} and \code{\link{ypr_plot}}
#' @export
#' @examples
#' ypr_yield(ypr_population())
ypr_yield <- function(x, Ly = 0, harvest = TRUE, biomass = TRUE,
                      sanitize = TRUE, check = TRUE) {
  check_flag(check)

  if(check) {
    check_flag(sanitize)
    checkor(check_population(x), check_schedule(x, complete = TRUE))
    check_scalar(Ly, c(0, Inf))
    check_flag(biomass)
    check_flag(harvest)
  }

  if(!is.data.frame(x)) x <- ypr_schedule(x, complete = TRUE, check = check)

  yield <- with(x, {
    # spawners per spawner at low density (at equilibrium must be 1 spawner per spawner)
    Rk <- Productivity[1]

    # number of recruits as proportion of unfished population
    R0 <- 1 / sum(Survivorship)

    # eggs per recruit at the unfished equilibrium
    phi <- sum(Fecundity * Survivorship)
    # eggs per recruit at the fished equilibrium
    phiF <- sum(Fecundity * FishedSurvivorship)

    # recruits per egg (1/phi) at equilibrium (1 spawner per spawner) times
    # spawner per spawner at low density
    # gives recruits per egg at low density
    alpha <-  Rk / phi

    # density dependence term
    beta <- (Rk - 1) / (R0 * phi)
    # number of recruits when fished as proportion of unfished population
    R0F <- (alpha * phiF - 1) / (beta * phiF)

    yield <- R0F * FishedSurvivorship * Capture
    if(harvest) yield <- yield * (1 - Release)
    if(biomass)
      yield <- yield * Weight / (R0 * Survivorship * Weight)
    yield <- yield[Length >= Ly]
    yield <- sum(yield)
    yield
  })
  if(sanitize) yield <- sanitize(yield)
  yield
}

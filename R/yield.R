yield <- function(mu, population, Ly, harvest, biomass, check) {
  population$mu <- mu
  yield <- ypr_yield(population, Ly = Ly, harvest = harvest, biomass = biomass,
                     sanitize = FALSE, check = check)
}

#' Yield
#'
#' @param population A list of population life-history parameters.
#' @param Ly The minimum length fish to consider.
#' @param harvest A flag indicating whether to calculate the yield over harvested versus captured fish.
#' @param biomass A flag indicating whether to calculate the yield in terms of the biomass versus number of individual fish.
#' @param sanitize A flag indicating whether to replace negative or NaNs with 0.
#' @param check A flag indicating whether to check the arguments.
#' @export
#' @examples
#' ypr_yield(ypr_population())
ypr_yield <- function(population, Ly = 0, harvest = TRUE, biomass = TRUE,
                      sanitize = TRUE, check = TRUE) {
  check_flag(check)

  if(check) {
    check_flag(sanitize)
    check_population(population)
    check_scalar(Ly, c(0, Inf))
    check_flag(biomass)
    check_flag(harvest)
  }
  schedule <- ypr_schedule(population, check = check)

  yield <- with(schedule, {
    S <- cumprod(1 - NaturalMortality)
    S <- c(1, S[-length(S)])
    SF <- cumprod((1 - NaturalMortality) * (1 - FishingMortality))

    phi <- sum(Fecundity * S)
    phiF <- sum(Fecundity * SF)

    Rk <- Productivity[1]
    R0 <- 1 / sum(S)
    alpha <-  Rk * 1 / phi
    beta <- (Rk - 1) / (R0 * phi)
    R0F <- (alpha * phiF - 1) / (beta * phiF)

    yield <- R0F * SF * Capture
    if(harvest) yield <- yield * (1 - Release)
    if(biomass) yield <- yield * Weight
    yield <- yield[Length >= Ly]
    yield <- sum(yield)
    yield
  })
  if(sanitize) yield <- sanitize(yield)
  yield
}

#' Yield
#'
#' @param schedule A data frame of the life history schedule.
#' @param Ly The minimum length fish to consider.
#' @param harvest A flag indicating whether to calculate the yield over harvested versus captured fish.
#' @param biomass A flag indicating whether to calculate the yield in terms of the biomass versus number of individual fish.
#' @param check A flag indicating whether to check the arguments.
#' @export
#' @examples
#' ypr_yield()
ypr_yield <- function(schedule = ypr_schedule(), Ly = 0, harvest = TRUE, biomass = TRUE, check = TRUE) {
  check_flag(check)

  if(check) {
    check_schedule(schedule)
    check_scalar(Ly, c(0, Inf))
    check_flag(biomass)
    check_flag(harvest)
  }

  with(schedule, {
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
}

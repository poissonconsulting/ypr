#' Yield
#'
#' @param schedule A data frame of the life history schedule.
#' @param Rk The numbers of spawners per spawner at low density.
#' @param Ly The minimum length fish to consider.
#' @param harvest A flag indicating whether to calculate the yield over harvested versus captured fish.
#' @param biomass A flag indicating whether to calculate the yield in terms of the biomass versus number of individual fish.
#' @export
#' @examples
#' ypr_yield(ypr_schedule())
ypr_yield <- function(schedule, Rk = 5, Ly = 0, harvest = TRUE, biomass = TRUE) {
  check_schedule(schedule)

  check_scalar(Rk, c(1, 10))
  check_scalar(Ly, c(0, Inf))
  check_flag(biomass)
  check_flag(harvest)

  S <- cumprod(1 - schedule$NaturalMortality)
  S <- c(1, S[-length(S)])
  SF <- cumprod((1 - schedule$NaturalMortality) * (1 - schedule$FishingMortality))

  phi <- sum(schedule$Fecundity * S)
  phiF <- sum(schedule$Fecundity * SF)

  R0 <- 1 / sum(S)
  alpha <-  Rk * 1 / phi
  beta <- (Rk - 1) / (R0 * phi)
  R0F <- (alpha * phiF - 1) / (beta * phiF)

  yield <- R0F * SF * schedule$Capture
  if(harvest) yield <- yield * (1 - schedule$Release)
  if(biomass) yield <- yield * schedule$Weight
  yield <- yield[schedule$Length >= Ly]
  yield <- sum(yield)
  yield
}

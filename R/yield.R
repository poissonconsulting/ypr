yield_mu <- function(mu, population, Ly, harvest, biomass) {
  population$mu <- mu
  yield <- ypr_yield(population, Ly = Ly, harvest = harvest, biomass = biomass,
                     sanitize = FALSE, check = FALSE)
}

#' Yield
#'
#' Calculates the yield for a population based on the actual capture rate.
#'
#' @param population A list of population life-history parameters.
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
  schedule <- ypr_schedule(population, complete = TRUE, check = check)

  yield <- with(schedule, {
    phi <- sum(Fecundity * Survivorship)
    phiF <- sum(Fecundity * FishedSurvivorship)

    Rk <- Productivity[1]
    R0 <- 1 / sum(Survivorship)
    alpha <-  Rk * 1 / phi
    beta <- (Rk - 1) / (R0 * phi)
    R0F <- (alpha * phiF - 1) / (beta * phiF)

    yield <- R0F * FishedSurvivorship * Capture
    if(harvest) yield <- yield * (1 - Release)
    if(biomass) yield <- yield * Weight
    yield <- yield[Length >= Ly]
    yield <- sum(yield)
    yield
  })
  if(sanitize) yield <- sanitize(yield)
  yield
}

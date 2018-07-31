yield_pi <- function(pi, population, Ly, harvest, biomass) {
  population$pi <- pi
  yield <- ypr_yield(population, Ly = Ly, harvest = harvest, biomass = biomass,
                     sanitize = FALSE, check = FALSE)
}

#' Yield
#'
#' Calculates the yield for a population in terms of the proportion of the unfished population abundance or biomass.
#'
#' @param population A list of population life-history parameters (or a data frame of the complete life-history schedule).
#' @param Ly The minimum length fish to consider when calculating the yield.
#' @param harvest A flag indicating whether to calculate the yield over harvested versus captured fish.
#' @param biomass A flag indicating whether to calculate the yield in terms of the biomass versus number of individual fish.
#' @param sanitize A flag indicating whether to replace negative or NaNs with 0.
#' @param check A flag indicating whether to check the arguments.
#' @return A double of the yield.
#' @seealso \code{\link{ypr_population}}, \code{\link{ypr_optimize}},
#' \code{\link{ypr_yields}} and \code{\link{ypr_plot}}
#' @export
#' @examples
#' ypr_yield(ypr_population())
ypr_yield <- function(population, Ly = 0, harvest = FALSE, biomass = FALSE,
                      sanitize = TRUE, check = TRUE) {
  check_flag(check)

  if(check) {
    check_yield_parameters(population = population, Ly = Ly, harvest = harvest,
                           biomass = biomass, sanitize = sanitize)
  }

  if(!is.data.frame(population))
    population <- ypr_schedule(population, complete = TRUE, check = check)

  population <- as.list(population)
  population$Rk <- attr(population, "Rk")
  population$R0 <- attr(population, "R0")
  population$pi <- attr(population, "pi")

  yield <- with(population, {
    # eggs per recruit at the unfished equilibrium
    phi <- sum(Fecundity * Survivorship)

    # eggs per recruit at the fished equilibrium
    phiF <- sum(Fecundity * FishedSurvivorship)

    # by definition Rk = alpha * phi (where alpha is recruits per egg
    alpha <-  Rk / phi

    # from standard definition of the beverton-holt relationship
    # R0 = (alpha * phi) / (beta * phi + 1)
    # beta * phi + 1 = (alpha * phi) / R0
    # beta * phi = (alpha * phi - 1) / R0
    # beta = (alpha * phi - 1) / R0 * phi
    # beta = (Rk - 1) / (R0 * phi)
    beta <- (Rk - 1) / (R0 * phi)

    # number of recruits when fished as proportion of unfished population
    # at equilibrium
    # R0F = (alpha * phi * R0F) / (beta * phi * R0F + 1)
    # (beta * phi * R0F + 1)  = (alpha * phi * R0F) / R0F
    # beta * phi * ROF + 1 = alpha * phi
    # beta * phi * ROF = alpha * phi - 1
    # ROF = (alpha * phi - 1) / (beta * phi)
    R0F <- (alpha * phiF - 1) / (beta * phiF)

    yield <- R0F * FishedSurvivorship * Vulnerability * pi
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

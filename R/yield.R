yield_pi <- function(pi, population, Ly, harvest, biomass) {
  population$pi <- pi
  yield <- ypr_yield(population, Ly = Ly, harvest = harvest, biomass = biomass,
                     sanitize = FALSE, check = FALSE)
}

#' Yield
#'
#' Calculates the yield for a population.
#'
#' If the yield is given in terms of the number of captured individuals then the scaling depends on the value of \code{R0}.
#' By default, with \code{R0 = 1} the number is as a proportion of the recruits at the unfished equilibrium.
#' If the yield is given in terms of the biomass then the scaling depends on the values of \code{Wa} and \code{R0}.
#'
#' @param population A list of population life-history parameters (or a data frame of the complete life-history schedule).
#' @param Ly The minimum length (trophy) fish to consider when calculating the yield.
#' @param harvest A flag indicating whether to calculate the yield over just harvested versus harvested and released fish.
#' @param biomass A flag indicating whether to calculate the yield in terms of the biomass (kg) versus number of captured individuals.
#' @param sanitize A flag indicating whether to replace negative or NaNs with 0 (internal use only).
#' @param check A flag indicating whether to check the arguments (internal use only).
#' @return The yield as number of fish or biomass (kg).
#' @seealso \code{\link{ypr_population}} and \code{\link{ypr_optimize}}
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
  population$tau <- attr(population, "tau")
  population$BH <- attr(population, "BH")
  population$Rk <- attr(population, "Rk")
  population$R0 <- attr(population, "R0")
  population$pi <- attr(population, "pi")

  yield <- with(population, {
    phi <- sum(Fecundity * tau * 0.5 * Survivorship)

    phiF <- sum(Fecundity * tau * 0.5 * FishedSurvivorship)

    alpha <-  Rk / phi

    if(BH) {
      beta <- (Rk - 1) / (R0 * phi)
      R0F <- (alpha * phiF - 1) / (beta * phiF)
    } else {
      beta <- log(Rk) / (R0 * phi)
      R0F <- log(alpha * phiF) / (beta * phiF)
    }

    yield <- R0F * FishedSurvivorship * Vulnerability * pi
    if(harvest) yield <- yield * (1 - Release)
    if(biomass)
      yield <- yield * Weight / 1000
    yield <- yield[Length >= Ly]
    yield <- sum(yield)
    yield
  })
  if(sanitize) yield <- sanitize(yield)
  yield
}

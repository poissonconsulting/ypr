yield <- function(schedule, Ly = 0, harvest = FALSE, biomass = FALSE) {
  schedule <- as.list(schedule)
  schedule$pi <- attr(schedule, "pi")
  schedule <- c(schedule, as.list(sr(schedule)))

  with(schedule, {
    yield <- R0F * FishedSurvivorship * Vulnerability * pi
    if(harvest) yield <- yield * Retention
    if(biomass)
      yield <- yield * Weight / 1000
    yield <- yield[Length >= Ly]
    yield <- sum(yield)
    yield
  })
}

yield_pi <- function(pi, population, Ly, harvest, biomass) {
  population$pi <- pi
  schedule <- ypr_schedule(population)
  yield(schedule, Ly = Ly, harvest = harvest, biomass = biomass)
}

#' Yield
#'
#' Calculates the yield for a population.
#'
#' By default, with \code{R0 = 1} the number of individuals is the proportion of the recruits at the unfished equilibrium.
#' If the yield is given in terms of the biomass (kg) then the scaling also depends on the value of \code{Wa} (g).
#'
#' @inheritParams ypr_schedule
#' @param Ly The minimum length (trophy) fish to consider when calculating the yield.
#' @param harvest A flag indicating whether to calculate the yield for just harvested fish or the total number of captures.
#' @param biomass A flag indicating whether to calculate the yield in terms of the biomass versus number of individuals.
#' @return The yield as number of fish or biomass.
#' @seealso \code{\link{ypr_population}} and \code{\link{ypr_optimize}}
#' @export
#' @examples
#' ypr_yield(ypr_population())
ypr_yield <- function(population, Ly = 0, harvest = FALSE, biomass = FALSE) {

  check_yield_parameters(population = population, Ly = Ly, harvest = harvest,
                         biomass = biomass)

  schedule <- ypr_schedule(population)

  yield <- yield(schedule, Ly = Ly, harvest = harvest, biomass = biomass)

  sanitize(yield)
}

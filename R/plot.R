#' Plot Population
#'
#' @param x The population to plot.
#'
#' @inheritParams ypr_schedule
#' @inheritParams graphics::plot.default
#' @param ... Additional arguments passed to graphics::plot.formula functions.
#' @return An invisible copy of the original object.
#' @export
#' @examples
#' \dontrun{
#' plot(ypr_population())
#' }
plot.ypr_population <- function(x, complete = TRUE, type = "b", ...) {
  check_population(x)
  schedule <- ypr_schedule(population = x, complete = complete)

  with(schedule, {
    plot(Length ~ Age, xlim = c(0, max(Age)), ylim = c(0, max(Length)),
         type = type, ...)
    plot(Weight ~ Length, xlim = c(0, max(Length)), ylim = c(0, max(Weight)),
         type = type, ...)
    plot(Fecundity ~ Weight, xlim = c(0, max(Weight)), ylim = c(0, max(Fecundity)),
         type = type, ...)
    plot(NaturalMortality ~ Length, xlim = c(0, max(Length)), ylim = c(0,1),
         type = type, ...)
    plot(FishingMortality ~ Length, xlim = c(0, max(Length)), ylim = c(0,1),
         type = type, ...)
    if(complete) {
      plot(TotalMortality ~ Length, xlim = c(0, max(Length)), ylim = c(0,1),
           type = type, ...)
      plot(Survivorship ~ Age, xlim = c(0, max(Age)), ylim = c(0,1),
           type = type, ...)
      plot(FishedSurvivorship ~ Age, xlim = c(0, max(Age)), ylim = c(0,1),
           type = type, ...)
    }
  })
  invisible(x)
}

#' Plot Yields by Capture Probabilities
#'
#' @inheritParams ypr_yield
#' @inheritParams ypr_yields
#' @export
#'
#' @examples
#' \dontrun{
#' ypr_plot(ypr_population())
#' }
ypr_plot <- function(population, mu = seq(0, 0.5, length.out = 30),
                     Ly = 0, harvest = TRUE, biomass = TRUE) {

  check_population(population)
  actual <- population$mu
  optimal <- ypr_optimize(population, Ly = Ly, harvest = harvest,
                          biomass = biomass)
  mu <- sort(c(mu, actual, optimal))

  yields <- ypr_yields(population, mu = mu, Ly = Ly, harvest = harvest,
                       biomass = biomass)
  actual_yield <- ypr_yield(population, Ly = Ly, harvest = harvest,
                     biomass = biomass)
  optimal_yield <- ypr_yields(population, mu = optimal, Ly = Ly, harvest = harvest,
                     biomass = biomass)

  graphics::plot(x = mu, y = yields, xlab = "Capture Probability", ylab = "Yield",
       type = "l")
  graphics::lines(x = c(actual, actual), y = c(0, actual_yield), lty = 4)
  graphics::lines(x = c(optimal, optimal), y = c(0, optimal_yield), lty = 3)
  invisible(population)
}

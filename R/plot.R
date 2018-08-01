#' Plot Population Schedule
#'
#' @param x The population to plot.
#' @inheritParams graphics::plot.default
#' @param ... Additional arguments passed to graphics::plot.formula functions.
#' @return An invisible copy of the original object.
#' @seealso \code{\link{ypr_population}} and \code{\link{ypr_schedule}}
#' @export
#' @examples
#' \dontrun{
#' plot(ypr_population())
#' }
plot.ypr_population <- function(x, type = "b", ...) {
  check_population(x)

  schedule <- ypr_schedule(x)

  with(schedule, {
    plot(Length ~ Age, xlim = c(0, max(Age)), ylim = c(0, max(Length)),
         type = type, ...)
    plot(Weight ~ Length, xlim = c(0, max(Length)), ylim = c(0, max(Weight)),
         type = type, ...)
    plot(Fecundity ~ Length, xlim = c(0, max(Length)), ylim = c(0, max(Fecundity)),
         type = type, ...)
    plot(Spawning ~ Length, xlim = c(0, max(Length)), ylim = c(0, 1),
         type = type, ...)
    plot(Vulnerability ~ Length, xlim = c(0, max(Length)), ylim = c(0, 1),
         type = type, ...)
    plot(NaturalMortality ~ Length, xlim = c(0, max(Length)), ylim = c(0,1),
         type = type, ...)
    plot(FishingMortality ~ Length, xlim = c(0, max(Length)), ylim = c(0,1),
         type = type, ...)
    plot(Survivorship ~ Age, xlim = c(0, max(Age)), ylim = c(0,1),
         type = type, ...)
    plot(FishedSurvivorship ~ Age, xlim = c(0, max(Age)), ylim = c(0,1),
         type = type, ...)
  })
  invisible(x)
}

#' Plot Population Schedule Terms
#'
#' Produces a bivariate line plot of two schedule terms.
#'
#' @inheritParams ypr_schedule
#' @param x A string of the term on the x-axis.
#' @param y A string of the term on the y-axis.
#' @return A ggplot2 object.
#' @seealso \code{\link{ypr_population}} and \code{\link{ypr_schedule}}
#' @export
#' @examples
#' ypr_plot_schedule(ypr_population())
ypr_plot_schedule <- function(population, x = "Age", y = "Length") {
  check_population(population)

  schedule <- ypr_schedule(population = population)

  check_scalar(x, values = colnames(schedule))
  check_scalar(y, values = colnames(schedule))

  ggplot2::ggplot(data = schedule, ggplot2::aes_string(x = x, y = y)) +
    ggplot2::geom_line() +
    ggplot2::expand_limits(x = 0, y = 0)
}

#' Plot Yield by Capture
#'
#' Plots the population yield by the annual interval capture probability.
#'
#' @inheritParams ypr_schedule
#' @inheritParams ypr_yield
#' @inheritParams ypr_yields
#' @return A ggplot2 object.
#' @seealso \code{\link{ypr_population}} and \code{\link{ypr_yields}}
#' @export
#' @examples
#' ypr_plot_yield(ypr_population())
ypr_plot_yield <- function(population, pi = seq(0, 1, length.out = 100),
                           Ly = 0, harvest = FALSE, biomass = FALSE) {

  yield <- ypr_yields(population, pi = pi, Ly = Ly, harvest = harvest,
                       biomass = biomass)

  data <- data.frame(pi = pi, Yield = yield)

  actual_pi <- population$pi

  optimal_pi <- ypr_optimize(population, Ly = Ly, harvest = harvest,
                           biomass = biomass)

  actual_yield <- ypr_yield(population, Ly = Ly, harvest = harvest,
                            biomass = biomass)

  optimal_yield <- ypr_yields(population, pi = optimal_pi, Ly = Ly, harvest = harvest,
                              biomass = biomass)

  data2 <- data.frame(pi = c(rep(actual_pi,2), rep(optimal_pi, 2)),
                      Yield = c(0, actual_yield, 0, optimal_yield),
                      Type = c(rep("actual",2), rep("optimal", 2)))

 gp <- ggplot2::ggplot(data = data, ggplot2::aes_string(x = "pi", y = "Yield")) +
    ggplot2::geom_line(data = data2, ggplot2::aes_string(group = "Type", color = "Type"), linetype = "dotted") +
    ggplot2::geom_line() +
    ggplot2::expand_limits(x = 0) +
    ggplot2::scale_x_continuous("Capture Probability (%)", labels = scales::percent) +
    ggplot2::scale_color_manual(values = c("red", "blue")) +
    ggplot2::ylab(if(biomass) "Yield (kg)" else "Yield (fish)") +
    NULL
  gp
}

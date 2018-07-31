#' Plot Population Schedule
#'
#' @param x The population to plot.
#'
#' @inheritParams ypr_schedule
#' @inheritParams graphics::plot.default
#' @param ... Additional arguments passed to graphics::plot.formula functions.
#' @return An invisible copy of the original object.
#' @seealso \code{\link{ypr_population}} and \code{\link{ypr_schedule}}
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
    plot(Fecundity ~ Length, xlim = c(0, max(Length)), ylim = c(0, max(Fecundity)),
         type = type, ...)
    plot(Vulnerability ~ Length, xlim = c(0, max(Length)), ylim = c(0, 1),
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

#' Bivariate Plot of Schedule Terms
#'
#' Produces a ggplot2 bivariate line plot of two schedule terms.
#'
#' @inheritParams ypr_schedule
#' @param x A string of the term on the x-axis.
#' @param y A string of the term on the y-axis.
#' @return A ggplot2 object.
#' @export
#' @examples
#' ypr_ggplot2(ypr_population())
ypr_ggplot2 <- function(population, x = "Age", y = "Length") {
  check_population(population)
  schedule <- ypr_schedule(population = population, complete = TRUE)
  check_scalar(x, values = colnames(schedule))
  check_scalar(y, values = colnames(schedule))

  if(!requireNamespace("ggplot2", quietly = TRUE))
    stop("package 'ggplot2' must be installed")

  ggplot2::ggplot(data = schedule, ggplot2::aes_string(x = x, y = y)) +
    ggplot2::geom_line() +
    ggplot2::expand_limits(x = 0, y = 0)
}

#' Plot Population Yields by Capture Probabilities
#'
#' Plots the population yield by the capture probabilities (pi).
#' The actual and optimal capture probabilities are indicated by
#' blue dashed and red dotted lines, respectively.
#'
#' @inheritParams ypr_yield
#' @inheritParams ypr_yields
#' @seealso \code{\link{ypr_population}}, \code{\link{ypr_yields}}
#' and \code{\link{ypr_optimize}}
#' @export
#' @examples
#' \dontrun{
#' ypr_plot(ypr_population())
#' }
ypr_plot <- function(population, pi = seq(0, 1, length.out = 100),
                     Ly = 0, harvest = TRUE, biomass = TRUE) {

  check_population(population)
  actual <- population$pi
  optimal <- ypr_optimize(population, Ly = Ly, harvest = harvest,
                          biomass = biomass)
  pi <- sort(c(pi, actual, optimal))

  yields <- ypr_yields(population, pi = pi, Ly = Ly, harvest = harvest,
                       biomass = biomass)
  actual_yield <- ypr_yield(population, Ly = Ly, harvest = harvest,
                            biomass = biomass)
  optimal_yield <- ypr_yields(population, pi = optimal, Ly = Ly, harvest = harvest,
                              biomass = biomass)

  graphics::plot(x = pi, y = yields, xlab = "Capture Probability", ylab = "Yield",
                 type = "l")
  graphics::lines(x = c(actual, actual), y = c(0, actual_yield),
                  col = "blue", lty = 2)
  graphics::lines(x = c(optimal, optimal), y = c(0, optimal_yield),
                  col = "red", lty = 3)
  invisible(population)
}

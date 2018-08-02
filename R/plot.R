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
  schedule <- ypr_schedule(population = population)

  check_scalar(x, values = colnames(schedule))
  check_scalar(y, values = colnames(schedule))

  ggplot(data = schedule, aes_string(x = x, y = y)) +
    geom_line() +
    expand_limits(x = 0, y = 0)
}

#' Plot Stock-Recruitment Curve
#'
#' @inheritParams ypr_schedule
#' @return A ggplot2 object.
#' @seealso \code{\link{ypr_population}} and \code{\link{ypr_sr}}
#' @export
#' @examples
#' ypr_plot_sr(ypr_population(Rk = 10))
#' ypr_plot_sr(ypr_population(Rk = 10, BH = 0L))
ypr_plot_sr <- function(population) {
  schedule <- ypr_schedule(population)

  schedule <- as.list(schedule)
  schedule$BH <- attr(schedule, "BH")
  schedule <- c(schedule, as.list(sr(schedule)))

  data <- with(schedule, {
    data <- data.frame(Eggs = seq(0, to = sum(Fecundity * Spawning * Survivorship), length.out = 100))
    if(BH == 1L) {
      data$Recruits <- alpha * data$Eggs / (1 + (beta * data$Eggs))
    } else {
      data$Recruits <- alpha * data$Eggs * exp(-beta * data$Eggs)
    }
    data
  })

  ggplot(data = data, aes_string(x = "Eggs", y = "Recruits")) +
    geom_line() +
    expand_limits(x = 0, y = 0) +
    scale_x_continuous(labels = scales::comma) +
    scale_y_continuous(labels = scales::comma) +
    NULL
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

  ggplot(data = data, aes_string(x = "pi", y = "Yield")) +
    geom_line(data = data2, aes_string(group = "Type", color = "Type"), linetype = "dotted") +
    geom_line() +
    expand_limits(x = 0) +
    scale_x_continuous("Capture Probability (%)", labels = scales::percent) +
    scale_color_manual(values = c("red", "blue")) +
    ylab(if(biomass) "Yield (kg)" else "Yield (fish)") +
    NULL
}

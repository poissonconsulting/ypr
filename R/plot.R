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
  schedule$R0 <- attr(schedule, "R0")
  schedule <- c(schedule, sr(schedule))

  data <- with(schedule, {
    data <- data.frame(Eggs = seq(0, to = phi * R0 * 2, length.out = 100))
    fun <- if(BH == 1L) bh else ri
    data$Recruits <- fun(data$Eggs, alpha, beta)
    data
  })

  population$pi <- ypr_optimise(population)
  optimal_sr <- ypr_sr(population)

  data2 <- with(schedule, {
    data <- data.frame(
      Eggs = c(phi * R0, phiF * R0F, optimal_sr$phiF * optimal_sr$R0F)
    )
    fun <- if(BH == 1L) bh else ri
    data$Recruits <- fun(data$Eggs, alpha, beta)
    data$Type <- factor(c("unfished", "actual", "optimal"),
                        levels = c("actual", "optimal", "unfished"))
    data <- rbind(data, data, data)
    data$Recruits[1:3] <- 0
    data$Eggs[7:9] <- 0
    data
  })

  ggplot(data = data, aes_string(x = "Eggs", y = "Recruits")) +
    geom_path(data = data2, aes_string(group = "Type", color = "Type"), linetype = "dotted") +
    geom_line() +
    expand_limits(x = 0, y = 0) +
    scale_x_continuous(labels = scales::comma) +
    scale_y_continuous(labels = scales::comma) +
    scale_color_manual(values = c("red", "blue", "black")) +
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

  yields <- ypr_yields(population, pi = pi, Ly = Ly, harvest = harvest,
                      biomass = biomass)

  data <- data.frame(pi = pi, Yield = yields)

  data2 <- ypr_tabulate_yield(population, Ly = Ly, harvest = harvest, biomass = biomass)

  data2 <- rbind(data2, data2, data2, stringsAsFactors = FALSE)

  data2$pi[5:6] <- 0
  data2$Yield[1:2] <- 0

  ggplot(data = data, aes_string(x = "pi", y = "Yield")) +
    geom_path(data = data2, aes_string(group = "Type", color = "Type"), linetype = "dotted") +
    geom_line() +
    expand_limits(x = 0) +
    scale_x_continuous("Capture Probability (%)", labels = scales::percent) +
    scale_color_manual(values = c("red", "blue")) +
    ylab(if(biomass) "Yield (kg)" else "Yield (fish)") +
    NULL
}

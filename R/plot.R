#' Plot Population Schedule
#'
#' @param x The population to plot.
#' @param type A string specifying the plot type.
#' Possible values include 'b', 'p' and 'l'.
#' @param ... Additional arguments passed to [graphics::plot] function.
#' @return An invisible copy of the original object.
#' @seealso [graphics::plot]
#' @export
#' @examples
#' \dontrun{
#' plot(ypr_population())
#' }
plot.ypr_population <- function(x, type = "b", ...) {
  check_population(x)

  schedule <- ypr_tabulate_schedule(x)

  with(schedule, {
    plot(Length ~ Age,
         xlim = c(0, max(Age)), ylim = c(0, max(Length)),
         type = type, ...
    )
    plot(Weight ~ Length,
         xlim = c(0, max(Length)), ylim = c(0, max(Weight)),
         type = type, ...
    )
    plot(Fecundity ~ Length,
         xlim = c(0, max(Length)), ylim = c(0, max(Fecundity)),
         type = type, ...
    )
    plot(Spawning ~ Length,
         xlim = c(0, max(Length)), ylim = c(0, 1),
         type = type, ...
    )
    plot(Vulnerability ~ Length,
         xlim = c(0, max(Length)), ylim = c(0, 1),
         type = type, ...
    )
    plot(NaturalMortality ~ Length,
         xlim = c(0, max(Length)), ylim = c(0, 1),
         type = type, ...
    )
    plot(FishingMortality ~ Length,
         xlim = c(0, max(Length)), ylim = c(0, 1),
         type = type, ...
    )
    plot(Survivorship ~ Age,
         xlim = c(0, max(Age)), ylim = c(0, 1),
         type = type, ...
    )
    plot(FishedSurvivorship ~ Age,
         xlim = c(0, max(Age)), ylim = c(0, 1),
         type = type, ...
    )
  })
  invisible(x)
}

#' Plot Yield by Capture
#'
#' Plots the 'Yield', 'Age', 'Length', 'Weight', 'Effort', or 'YPUE' by the
#' annual interval capture/exploitation probability.
#'
#' @inheritParams params
#' @inheritParams ypr_plot_schedule
#' @return A ggplot2 object.
#' @family populations
#' @family yield
#' @family plot
#' @examples
#' \dontrun{
#' ypr_plot_yield(ypr_populations(
#'   Rk = c(2.5, 4.6),
#'   Llo = c(0, 60)
#' ),
#' plot_values = FALSE
#' ) +
#'   ggplot2::facet_wrap(~Llo) +
#'   ggplot2::aes_string(group = "Rk", color = "Rk") +
#'   ggplot2::scale_color_manual(values = c("black", "blue"))
#'
#' ypr_plot_yield(ypr_populations(Rk = c(2.5, 4.6), Llo = c(0, 60))) +
#'   ggplot2::facet_grid(Rk ~ Llo)
#' }
#'
#' ypr_plot_yield(ypr_population())
#' @export
#'
ypr_plot_yield <- function(object, ...) {
  UseMethod("ypr_plot_yield")
}

#' Plot Biomass
#'
#' Produces a frequency histogram of the total fish 'Biomass' or 'Eggs'
#' deposition by 'Age' class.
#'
#' @inheritParams params
#' @inheritParams ypr_plot_schedule
#' @return A ggplot2 object.
#' @seealso [ggplot2::geom_histogram()]
#' @family biomass
#' @family plot
#' @export
#' @examples
#' ypr_plot_biomass(ypr_population(), color = "white")
ypr_plot_biomass <- function(population, y = "Biomass", color = NULL) {
  if (!requireNamespace("ggplot2")) err("Package 'ggplot2' must be installed.")
  if (!requireNamespace("scales")) err("Package 'scales' must be installed.")
  chk_string(y)
  chk_subset(y, c("Biomass", "Eggs"))

  biomass <- ypr_tabulate_biomass(population)

  labels <- if (sum(biomass[[y]]) >= 1000) {
    scales::comma
  } else {
    ggplot2::waiver()
  }

  ggplot2::ggplot(data = biomass, ggplot2::aes_string(x = "Age", weight = y)) +
    (if (is.null(color)) {
      ggplot2::geom_bar(width = 1)
    } else {
      ggplot2::geom_bar(width = 1, color = color)
    }) +
    ggplot2::scale_y_continuous(y, labels = labels) +
    ggplot2::expand_limits(x = 0, y = 0)
}

#' @describeIn ypr_plot_yield Plot Yield by Capture
#' @export
ypr_plot_yield.ypr_population <- function(object,
                                          y = "Yield",
                                          pi = seq(0, 1, length.out = 100),
                                          Ly = 0,
                                          harvest = TRUE,
                                          biomass = FALSE,
                                          u = harvest,
                                          plot_values = TRUE,
                                          ...) {
  if (!requireNamespace("ggplot2")) err("Package 'ggplot2' must be installed.")
  if (!requireNamespace("scales")) err("Package 'scales' must be installed.")
  check_population(object)
  chk_number(Ly)
  chk_gte(Ly)
  chk_flag(biomass)
  chk_flag(harvest)

  chk_string(y)
  chk_subset(y, c("Yield", "Age", "Length", "Weight", "Effort", "YPUE"))
  chk_flag(u)

  data <- ypr_tabulate_yields(
    object,
    pi = pi,
    Ly = Ly,
    harvest = harvest,
    biomass = biomass
  )

  data2 <- ypr_tabulate_yield(
    object = object,
    Ly = Ly,
    harvest = harvest,
    biomass = biomass
  )

  data$YPUE <- data$Yield / data$Effort
  data2$YPUE <- data2$Yield / data2$Effort

  data1 <- data2
  data3 <- data2

  data1[c("Yield", "Age", "Length", "Weight", "Effort", "YPUE")] <- 0
  data3[c("pi", "u")] <- 0

  data2 <- rbind(data1, data2, data3, stringsAsFactors = FALSE)

  xlab <- if (u) "Exploitation Probability (%)" else "Capture Probability (%)"
  x <- if (u) "u" else "pi"

  ggplot2::ggplot(data = data, ggplot2::aes_string(x = x, y = y)) +
    (
      if (plot_values) {
        list(
          ggplot2::geom_path(
            data = data2,
            ggplot2::aes_string(
              group = "Type",
              color = "Type"
            ),
            linetype = "dotted"
          ),
          ggplot2::scale_color_manual(values = c("red", "blue"))
        )
      } else {
        NULL
      }) +
    ggplot2::geom_line() +
    ggplot2::expand_limits(x = 0) +
    ggplot2::scale_x_continuous(xlab, labels = scales::percent) +
    NULL
}


#' @describeIn ypr_plot_yield Plot Yield by Capture
#' @export
ypr_plot_yield.ypr_populations <- function(object,
                                           y = "Yield",
                                           pi = seq(0, 1, length.out = 100),
                                           Ly = 0,
                                           harvest = TRUE,
                                           biomass = FALSE,
                                           u = harvest,
                                           plot_values = TRUE,
                                           ...) {
  if (!requireNamespace("ggplot2")) err("Package 'ggplot2' must be installed.")
  if (!requireNamespace("scales")) err("Package 'scales' must be installed.")
  chk_string(y)
  chk_subset(y, c("Yield", "Age", "Length", "Weight", "Effort", "YPUE"))
  chk_flag(u)

  data <- ypr_tabulate_yields(object,
    pi = pi, Ly = Ly, harvest = harvest,
    biomass = biomass
  )

  data2 <- ypr_tabulate_yield(
    object = object,
    Ly = Ly,
    harvest = harvest,
    biomass = biomass
  )

  data$YPUE <- data$Yield / data$Effort
  data2$YPUE <- data2$Yield / data2$Effort

  parameters <- setdiff(intersect(colnames(data), .parameters$Parameter), "pi")

  for (parameter in parameters) {
    data[[parameter]] <- factor(
      paste0(parameter, ": ", data[[parameter]]),
      levels = unique(paste0(parameter, ": ", sort(data[[parameter]])))
    )
    data2[[parameter]] <- factor(
      paste0(parameter, ": ", data2[[parameter]]),
      levels = unique(paste0(parameter, ": ", sort(data2[[parameter]])))
    )
  }

  data1 <- data2
  data3 <- data2

  data1[c("Yield", "Age", "Length", "Weight", "Effort", "YPUE")] <- 0
  data3[c("pi", "u")] <- 0

  data2 <- rbind(data1, data2, data3, stringsAsFactors = FALSE)

  xlab <- if (u) "Exploitation Probability (%)" else "Capture Probability (%)"
  x <- if (u) "u" else "pi"

  ggplot2::ggplot(data = data, ggplot2::aes_string(x = x, y = y)) +
    (
      if (plot_values) {
        list(
          ggplot2::geom_path(
            data = data2,
            ggplot2::aes_string(
              group = "Type",
              color = "Type"
            ),
            linetype = "dotted"
          ),
          ggplot2::scale_color_manual(values = c("red", "blue"))
        )
      } else {
        NULL
      }) +
    ggplot2::geom_line() +
    ggplot2::expand_limits(x = 0) +
    ggplot2::scale_x_continuous(xlab, labels = scales::percent) +
    NULL
}

#' @describeIn ypr_plot_yield Plot Yield by Capture
#' @export
ypr_plot_yield.ypr_ecotypes <- function(object,
                                        y = "Yield",
                                        pi = seq(0, 1, length.out = 100),
                                        Ly = 0,
                                        harvest = TRUE,
                                        biomass = FALSE,
                                        u = harvest,
                                        plot_values = TRUE,
                                        ...) {
  if (!requireNamespace("ggplot2")) err("Package 'ggplot2' must be installed.")
  if (!requireNamespace("scales")) err("Package 'scales' must be installed.")
  chk_string(y)
  chk_subset(y, c("Yield", "Age", "Length", "Weight", "Effort", "YPUE"))
  chk_flag(u)

  data <- ypr_tabulate_yields(object,
                              pi = pi, Ly = Ly, harvest = harvest,
                              biomass = biomass
  )

  data2 <- ypr_tabulate_yield(
    object = object,
    Ly = Ly,
    harvest = harvest,
    biomass = biomass
  )

  data$YPUE <- data$Yield / data$Effort
  data2$YPUE <- data2$Yield / data2$Effort

  parameters <- setdiff(intersect(colnames(data), .parameters$Parameter), "pi")

  for (parameter in parameters) {
    data[[parameter]] <- factor(
      paste0(parameter, ": ", data[[parameter]]),
      levels = unique(paste0(parameter, ": ", sort(data[[parameter]])))
    )
    data2[[parameter]] <- factor(
      paste0(parameter, ": ", data2[[parameter]]),
      levels = unique(paste0(parameter, ": ", sort(data2[[parameter]])))
    )
  }

  data1 <- data2
  data3 <- data2

  data1[c("Yield", "Age", "Length", "Weight", "Effort", "YPUE")] <- 0
  data3[c("pi", "u")] <- 0

  data2 <- rbind(data1, data2, data3, stringsAsFactors = FALSE)

  xlab <- if (u) "Exploitation Probability (%)" else "Capture Probability (%)"
  x <- if (u) "u" else "pi"

  ggplot2::ggplot(data = data, ggplot2::aes_string(x = x, y = y)) +
    (
      if (plot_values) {
        list(
          ggplot2::geom_path(
            data = data2,
            ggplot2::aes_string(
              group = "Type",
              color = "Type"
            ),
            linetype = "dotted"
          ),
          ggplot2::scale_color_manual(values = c("red", "blue"))
        )
      } else {
        NULL
      }) +
    ggplot2::geom_line() +
    ggplot2::expand_limits(x = 0) +
    ggplot2::scale_x_continuous(xlab, labels = scales::percent) +
    NULL
}

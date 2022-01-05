#' Plot Population or Ecotypes Schedule Terms
#'
#' Produces a bivariate line plot of two schedule terms.
#'
#' @inheritParams params
#' @param x A string of the term on the x-axis.
#' @param y A string of the term on the y-axis.
#' @return A ggplot2 object.
#' @family schedule
#' @family plot
#' @export
#' @examples
#' ypr_plot_schedule(ypr_population())
ypr_plot_schedule <- function(population, x = "Age", y = "Length") {
  if (!requireNamespace("ggplot2")) err("Package 'ggplot2' must be installed.")
  if (!requireNamespace("scales")) err("Package 'scales' must be installed.")

  schedule <- ypr_tabulate_schedule(object = population)

  chk_string(x)
  chk_subset(x, values = colnames(schedule))

  chk_string(y)
  chk_subset(y, values = colnames(schedule))

  labels <- if (sum(schedule[[y]]) >= 1000) scales::comma else ggplot2::waiver()
  group <- if("Ecotype" %in% names(schedule)) "Ecotype" else NULL

  ggplot2::ggplot(data = schedule, ggplot2::aes_string(x = x, y = y, group = group)) +
    ggplot2::geom_line() +
    ggplot2::scale_y_continuous(y, labels = labels) +
    ggplot2::expand_limits(x = 0, y = 0)
}

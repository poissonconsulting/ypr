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
  rlang::check_installed("ggplot2")
  rlang::check_installed("scales")
  chk_string(y)
  chk_subset(y, c("Biomass", "Eggs"))

  biomass <- ypr_tabulate_biomass(population)

  labels <- if (sum(biomass[[y]]) >= 1000) {
    scales::comma
  } else {
    ggplot2::waiver()
  }

  ggplot2::ggplot(data = biomass, ggplot2::aes(x = Age, weight = .data[[y]])) +
    (if (is.null(color)) {
      ggplot2::geom_bar(width = 1)
    } else {
      ggplot2::geom_bar(width = 1, color = color)
    }) +
    ggplot2::scale_y_continuous(y, labels = labels) +
    ggplot2::expand_limits(x = 0, y = 0)
}

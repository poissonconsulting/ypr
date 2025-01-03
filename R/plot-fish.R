#' Plot Fish
#'
#' Produces a frequency histogram of the number of fish in the 'Survivors',
#' 'Spawners', 'Caught', 'Harvested' or 'Released' categories by 'Length', 'Age'
#' or 'Weight' class.
#'
#' @inheritParams params
#' @inheritParams ypr_plot_schedule
#' @return A ggplot2 object.
#' @seealso [ggplot2::geom_histogram()]
#' @family fish
#' @family plot
#' @export
#' @examples
#' ypr_plot_fish(ypr_population(), color = "white")
ypr_plot_fish <- function(population, x = "Age", y = "Survivors",
                          percent = FALSE,
                          binwidth = 1L, color = NULL) {
  rlang::check_installed("ggplot2")
  rlang::check_installed("scales")
  chk_string(y)
  chk_subset(y, c(
    "Survivors", "Spawners", "Caught", "Harvested",
    "Released", "HandlingMortalities"
  ))
  chk_flag(percent)

  fish <- ypr_tabulate_fish(population, x = x, binwidth = binwidth)

  if (percent) fish[[y]] <- fish[[y]] / sum(fish[[y]])
  labels <- if (percent) {
    scales::percent
  } else if (sum(fish[[y]]) >= 1000) {
    scales::comma
  } else {
    ggplot2::waiver()
  }

  ggplot2::ggplot(data = fish) +
    (if (length(unique(fish$Ecotype)) == 1) {
      ggplot2::aes(x = .data[[x]], weight = .data[[y]])
    } else {
      ggplot2::aes(x = .data[[x]], weight = .data[[y]], fill = .data$Ecotype)
    }) +
    (if (is.null(color)) {
      ggplot2::geom_bar(width = binwidth)
    } else {
      ggplot2::geom_bar(width = binwidth, color = color)
    }) +
    ggplot2::scale_y_continuous(y, labels = labels) +
    ggplot2::expand_limits(x = 0, y = 0)
}

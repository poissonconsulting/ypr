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
  chk_population(x)

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

#' @export
unique.ypr_populations <- function(x, ...) {
  x <- as.data.frame(x)
  x <- unique(x)
  as_ypr_populations(x)
}

#' @describeIn ypr_population_update Update Population Parameters
#' @export
update.ypr_population <- function(object, ...) {
  ypr_population_update(object, ...)
}

#' @describeIn ypr_populations_update Update Populations Parameters
#' @export
update.ypr_populations <- function(object, ...) {
  ypr_population_update(object, ...)
}

#' @describeIn ypr_ecotypes_update Update Ecotypes Parameters
#' @export
update.ypr_ecotypes <- function(object, ...) {
  ypr_population_update(object, ...)
}

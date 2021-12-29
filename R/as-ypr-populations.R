#' Coerce to a Populations Object
#'
#' Creates an object of class ypr_population from a data frame of populations parameters.
#'
#' @inheritParams params
#' @family populations
#' @export
#' @examples
#' as_ypr_populations(as.data.frame(ypr_populations(Rk = c(3, 4))))
as_ypr_populations <- function(x) {
  chk_data(x)
  x <- split(x, seq_len(nrow(x)))
  x <- lapply(x, as_ypr_population)
  class(x) <- "ypr_populations"
  names(x) <- ypr_population_names(x)
  x
}

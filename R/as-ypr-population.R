#' Coerce to a Population Object
#'
#' Creates an object of class ypr_population from a data frame of population parameters.
#'
#' @inheritParams params
#' @export
#' @examples
#' as_ypr_population(as.data.frame(ypr_population()))
as_ypr_population <- function(x) {
  chk_data(x)
  do.call("ypr_population", x)
}

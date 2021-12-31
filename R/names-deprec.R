#' @describeIn ypr_names `r lifecycle::badge('deprecated')`
#'
#' @inheritParams params
#'
#' @export
ypr_population_names <- function(populations) {
  lifecycle::deprecate_soft("0.5.3", "ypr_population_names()", "ypr_names()")
  ypr_names(populations)
}

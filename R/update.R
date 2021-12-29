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
  ypr_ecotypes_update(object, ...)
}

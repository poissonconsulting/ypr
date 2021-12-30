set_parameter <- function(x, value, parameter) {
  UseMethod("set_parameter")
}

#' @export
set_parameter.ypr_population <- function(x, value, parameter) {
  chk_string(parameter)
  chk_subset(parameter, .parameters$Parameter)
  chk_number(value)

  purrr::pluck(x, parameter) <- value
  check_population(x)
  x
}

set_parameter.ypr_populations <- function(x, value, parameter) {
  x <- purrr::map2(x, value, set_parameter, parameter)
  class(x) <- "ypr_populations"
  check_populations(x)
  x
}

set_parameter.ypr_ecotypes <- function(x, value, parameter) {
  purrr::map2(x, value, set_parameter, parameter)
  class(x) <- "ypr_ecotypes"
  check_ecotypes(x)
  x
}

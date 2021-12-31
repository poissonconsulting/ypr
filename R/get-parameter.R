get_parameter <- function(x, parameter) {
  UseMethod("get_parameter")
}

get_parameter_ypr_population <- function(x, parameter) {
  chk_string(parameter)
  chk_subset(parameter, .parameters$Parameter)

  purrr::pluck(x, parameter)
}

get_parameter.ypr_population <- function(x, parameter) {
  get_parameter_ypr_population(x, parameter)
}

get_parameter.ypr_populations <- function(x, parameter) {
  purrr::map_dbl(x, get_parameter_ypr_population, parameter)
}

get_parameter.ypr_ecotypes <- function(x, parameter) {
  purrr::map_dbl(x, get_parameter_ypr_population, parameter)
}

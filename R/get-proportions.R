get_proportions <- function(x) {
  UseMethod("get_proportions")
}

get_proportions_ypr_population <- function(x) {
  purrr::pluck(x, "RPR")
}

get_proportions.ypr_population <- function(x) {
  1
}

get_proportions.ypr_populations <- function(x) {
  x <- purrr::map_dbl(x, get_proportions_ypr_population)
  x / sum(x)
}

get_proportions.ypr_ecotypes <- function(x, parameter) {
  x <- purrr::map_dbl(x, get_proportions_ypr_population)
  x / sum(x)
}

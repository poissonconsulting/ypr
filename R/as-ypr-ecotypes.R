#' Coerce to an Ecotypes Object
#'
#' Creates an object of class ypr_ecotypes from a list of ypr_populations.
#'
#' @param populations A list with each element providing the population
#' parameters for each ecotype.
#' @param weights A numeric vector giving the relative proportion of recruits belonging
#' to each ecotype.
#' @param names An optional character vector providing names for each ecotype.
#' @family ecotypes
#' @examples
#' as_ypr_ecotypes()
#' as_ypr_ecotypes(ypr_populations(Ls = c(10, 15, 20)), c(1, 2, 1), c("river", "deep", "shallow"))
#' @export
as_ypr_ecotypes <- function(populations = ypr_populations(Linf = c(100, 1000)),
                            weights = c(0.5, 0.5),
                            names = NULL) {
  check_populations(populations)
  chk::check_dim(populations, values = TRUE)

  chk::chk_numeric(weights)
  chk::chk_not_any_na(weights)
  chk::chk_gt(weights, value = 0)

  if (!chk::vld_equal(length(populations), length(weights))) {
    chk::abort_chk(paste0("Length of ", deparse(substitute(populations)),
                          " and ", deparse(substitute(weights)),
                          " do not match. ", length(populations), " != ",
                          length(weights)))
  }

  chk::chk_null_or(names, vld = chk::vld_character)
  if (!is.null(names)) {
    if (!chk::vld_equal(length(populations), length(names))) {
      chk::abort_chk(paste0("Length of ", deparse(substitute(populations)),
                            " and ", deparse(substitute(names)),
                            " do not match. ", length(populations), " != ",
                            length(names)))
    }
  }

  weights <- weights / sum(weights)
  ecotype <- populations

  class(ecotype) <- c("ypr_ecotypes")
  attr(ecotype, "proportions") <- weights

  if (!is.null(names)) {
    names(ecotype) <- names
  }
  check_ecotypes(ecotype)
  ecotype
}

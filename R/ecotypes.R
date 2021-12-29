#' Create Ecotypes Object
#'
#' Creates an object of class ecotypes.
#'
#' @inheritParams params
#' @return A list of [ypr_ecotypes()] objects
#' @family ecotypes
#' @export
#' @examples
#' ypr_ecotypes(Linf = c(1, 2), weights = c(1, 1))
#' ypr_ecotypes(Linf = c(1, 2), t0 = c(0, 0.5), weights = c(1, 1))
ypr_ecotypes <- function(..., weights = NULL, names = NULL) {

  chk::chk_null_or(weights, vld = vld_numeric)
  chk::chk_null_or(names, vld = vld_character)

  ecotypes <- ypr_populations(..., expand = FALSE)

  class(ecotypes) <- "ypr_ecotypes"
  names(ecotypes) <- ypr_population_names(ecotypes)

  if(is.null(weights)) {
    weights <- rep(1/length(ecotypes), length(ecotypes))
  }
  chk::chk_not_any_na(weights)
  chk::chk_gt(weights)

  if (!chk::vld_equal(length(ecotypes), length(weights))) {
    chk::abort_chk(paste0("Length of parameters and weights do not match. ",
                          length(ecotypes), " != ",
                          length(weights)))
  }
  # convert weights into percents
  weights <- weights / sum(weights)
  attr(ecotypes, "proportions") <- weights

  if (!is.null(names)) {
    chk::chk_not_any_na(names)
    chk::chk_unique(names)
    if (!chk::vld_equal(length(ecotypes), length(names))) {
      chk::abort_chk(paste0("Length of parameters and names do not match. ",
                            length(ecotypes), " != ",
                            length(names)))
    }
    names(ecotype) <- names
  }

  ecotypes
}

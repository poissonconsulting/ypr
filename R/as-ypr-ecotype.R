#' Ecotype Parameters
#'
#' Creates an object of class ecotype.
#'
#' @param populations A list with all parameters for each ecotype in the
#'   population
#' @param weights A numeric vector giving the weighting for how much it
#'   contributes to the overall population
#' @export
as_ypr_ecotypes <- function(populations, weights) {

  chk::chk_s3_class(populations, "ypr_populations")
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
  # convert weights into percents
  weights <- weights / sum(weights)
  ecotype <- populations

  class(ecotype) <- c("ypr_ecotype")
  attr(ecotype, "weights") <- weights
  ecotype
}

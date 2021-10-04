#' Ecotype Parameters
#'
#'
#' @inheritParams params
#' @param populations A list with all your population parameters per
#' @param ratios A vector or list containing the ratio for ecotype
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





}

# testing
a <- ypr::chilliwack_bt_05

a <- ypr::ypr_populations(Hm = c(0.2, 0.05))

ypr_ecotypes(a, c(1, 4, 3))




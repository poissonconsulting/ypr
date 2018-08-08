sanitize <- function(x) {
  x[is.nan(x)] <- 0
  x[x < 0] <- 0
  x
}

quantiles <- function(x, level) {
  x <- unlist(x)
  x <- stats::quantile(x, c(0.5, (1-level)/2, (1-level)/2 + level))
  setNames(x, c("estimate", "lower", "upper"))
}


#' Instantaneous to Interval Mortality
#'
#' @param x A numeric vector of instantaneous mortality rates.
#' @return A numeric vector of corresponding interval mortality rates.
#' @export
#' @examples
#' ypr_inst2inter(c(0,0.2,3))
ypr_inst2inter <- function(x) {
  check_vector(x, c(0, Inf, NA))
  1-exp(-x)
}

#' Interval to Instantaneous Mortality
#'
#' @param x A numeric vector of interval mortality rates.
#' @return A numeric vector of corresponding instantaneous mortality rates.
#' @export
#' @examples
#' ypr_inter2inst(c(0,0.5,0.99,1))
ypr_inter2inst <- function(x) {
  check_vector(x, c(0, 1, NA))
  x <- -log(1-x)
}

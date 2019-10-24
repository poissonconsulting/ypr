#' Instantaneous to Interval Mortality
#'
#' @param x A numeric vector of instantaneous mortality rates.
#' @return A numeric vector of corresponding interval mortality rates.
#' @export
#' @examples
#' ypr_inst2inter(c(0, 0.2, 3))
ypr_inst2inter <- function(x) {
  1 - exp(-x)
}

#' Interval to Instantaneous Mortality
#'
#' @param x A numeric vector of interval mortality rates.
#' @return A numeric vector of corresponding instantaneous mortality rates.
#' @export
#' @examples
#' ypr_inter2inst(c(0, 0.5, 0.99, 1))
ypr_inter2inst <- function(x) {
  -log(1 - x)
}

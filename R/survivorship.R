#' Calculate Survivorship
#'
#' Calculates the expected survivorship to age t.
#'
#' @param t The age.
#' @param mu The annual interval mortality rate.
#'
#' @return The expected survivorship.
#' @export
#' @examples
#' plot(0:10, ypr_survivorship(0:10), type = "l")
ypr_survivorship <- function(t, mu = 0.2) {
  check_scalar(mu, c(0, 1))
  (1-mu)^t
}

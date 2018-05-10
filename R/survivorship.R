#' Calculate Survivorship
#'
#' Calculates the expected survivorship to age t.
#'
#' @param t The age.
#' @param nu The annual interval natural mortality rate.
#' @param Rt A count of the recruitment age for the stock recruitment relationship.
#'
#' @return The expected survivorship.
#' @export
#' @examples
#' plot(0:10, ypr_survivorship(0:10), type = "l")
ypr_survivorship <- function(t, nu = 0.2, Rt = 1L) {
  check_scalar(nu, c(0, 1))
  check_count(Rt)
  (1-nu)^(t-Rt)
}

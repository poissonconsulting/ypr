#' Calculate Weight
#'
#' Calculates the expected weight for an individual of length L based on
#' the allometric equation.
#'
#' @param L The length.
#' @param a The condition factor.
#' @param b The scaling exponent.
#'
#' @return The expected weight for an individual of length L.
#' @export
#' @examples
#' plot(0:100, ypr_weight(0:100), type = "l")
ypr_weight <- function(L, a = 1e-05, b = 3) {
  check_scalar(a, c(0, 1))
  check_scalar(b, c(2, 4))

  a * L^{b}
}

#' Calculate Fecundity
#'
#' Calculates the expected fecundity for an individual of length L based on
#' an allometric equation.
#'
#' @param L The length.
#' @param Lm The length at maturity.
#' @param fa The fecundity factor.
#' @param fb The fecundity scaling exponent.
#'
#' @return The expected weight for an individual of length L.
#' @export
#' @examples
#' plot(0:100, ypr_fecundity(0:100), type = "l")
ypr_fecundity <- function(L, Lm = 50,  fa = 1e-05, fb = 3) {
  check_scalar(Lm, c(0, .L_max))
  check_scalar(fa, c(0, 1))
  check_scalar(fb, c(2, 4))

  f <- fa * L^{fb}
  f[L < Lm] <- 0
  f
}

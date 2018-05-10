#' Calculate Fecundity
#'
#' Calculates the expected fecundity for an individual of length L based on
#' an allometric equation.
#'
#' @param L The length.
#' @param Lm The length at maturity.
#' @inheritParams ypr_weight
#' @param fa The fecundity factor.
#' @param fb The fecundity scaling exponent.
#'
#' @return The expected weight for an individual of length L.
#' @export
#' @examples
#' plot(0:100, ypr_fecundity(0:100), type = "l")
ypr_fecundity <- function(L, a = 1e-05, b = 3, Lm = 50, fa = 1e-05, fb = 1) {
  check_scalar(Lm, c(0, .Lmax))
  check_scalar(fa, c(0, 1))
  check_scalar(fb, c(0.5, 2))

  W <- ypr_weight(L, a = a, b = b)

  f <- fa * W^{fb}
  f[L < Lm] <- 0
  f
}

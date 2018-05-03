#' Calculate Length
#'
#' Calculates the expected length for an individual of age t based on the
#' Von Bertalanffy growth equation.
#'
#' @param t The age.
#' @param k The growth coefficient.
#' @param Linf The mean maximum length.
#' @param t0 The age at length 0.
#'
#' @return The expected length for an individual of age t.
#' @export
#' @examples
#' plot(0:10, ypr_length(0:10), type = "l")
ypr_length <- function(t, k = 1/2, Linf = 100, t0 = 0) {
  check_scalar(k, c(0, 10))
  check_scalar(Linf, c(0, .L_max))
  check_scalar(t0, c(-10, 10))

  L <- Linf * (1 - exp(-k * (t-t0)))
  L[L < 0] <- 0
  L
}

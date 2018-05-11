fecundity <- function(L, a = 1e-05, b = 3, Lm = 50, fa = 1e-05, fb = 1) {
  W <- weight(L, a = a, b = b)
  f <- fa * W^{fb}
  f[L < Lm] <- 0
  f
}

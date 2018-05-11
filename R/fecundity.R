fecundity <- function(L, a, b, Lm, fa, fb) {
  W <- weight(L, a = a, b = b)
  f <- fa * W^{fb}
  f[L < Lm] <- 0
  f
}

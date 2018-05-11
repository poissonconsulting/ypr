growth <- function(t, k = 1/2, Linf = 100, t0 = 0) {
  L <- Linf * (1 - exp(-k * (t-t0)))
  L[L < 0] <- 0
  L
}

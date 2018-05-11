growth <- function(t, k, Linf, t0) {
  L <- Linf * (1 - exp(-k * (t-t0)))
  L[L < 0] <- 0
  L
}

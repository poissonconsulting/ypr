sanitize <- function(x) {
  x[is.nan(x)] <- 0
  x[x < 0] <- 0
  x
}

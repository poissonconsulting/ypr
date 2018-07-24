sample_population <- function(x, x2, n = 1) {
  x <- x[.parameters]
  x2 <- x2[.parameters]

  if(!identical(x[c("tmax", "Rt")], x2[c("tmax", "Rt")]))
    stop("The two populations must have the same values for 'tmax' and 'Rt'", call. = FALSE)

  x <- mapply(c, x[.parameters], x2[.parameters], SIMPLIFY = FALSE)
  x <- lapply(x, function(y) stats::runif(n, min(y), max(y)))
  x$FUN <- function(...) {list(...)}
  x$SIMPLIFY <- FALSE
  x <- do.call("mapply", x)
  x <- lapply(x, FUN = function(y) {y[c("tmax", "Rt")] <- x2[c("tmax", "Rt")]; y})
  x
}

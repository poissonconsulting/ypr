sample_population <- function(x, x2, n = 1) {
  x <- x[.parameters$Parameter]
  x2 <- x2[.parameters$Parameter]

  if(!identical(x[c("tmax", "tR", "BH")], x2[c("tmax", "tR", "BH")]))
    stop("The two populations must have the same values for 'tmax', 'tR' and 'BH'", call. = FALSE)

  x <- mapply(c, x[.parameters$Parameter], x2[.parameters$Parameter], SIMPLIFY = FALSE)
  x <- lapply(x, function(y) stats::runif(n, min(y), max(y)))
  x$FUN <- function(...) {list(...)}
  x$SIMPLIFY <- FALSE
  x <- do.call("mapply", x)
  x <- lapply(x, FUN = function(y) {y[c("tmax", "tR", "BH")] <- x2[c("tmax", "tR", "BH")]; y})
  x
}

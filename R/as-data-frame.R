#' @export
as.data.frame.ypr_population <- function(x, ...) {
  x <- unclass(x)
  as_tibble(as.data.frame(x))
}

#' @export
as.data.frame.ypr_populations <- function(x, ...) {
  x <- lapply(x, as.data.frame)
  as_tibble(do.call("rbind", x))
}

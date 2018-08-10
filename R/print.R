#' @export
print.ypr_population <- function(x, ...) {
  check_population(x)
  nchar <- nchar(names(x))
  nchar <- max(nchar) - nchar + 1
  space <- vapply(nchar, function(x) paste0(rep(" ", times = x), collapse = ""), "")
  x <- paste0(names(x), ":", space, x, collapse = "\n")
  cat(x)
  invisible(x)
}

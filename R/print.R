#' @export
print.ypr_population <- function(x, ...) {
  suppressWarnings(chk_population(x))
  nchar <- nchar(names(x))
  nchar <- max(nchar) - nchar + 1
  space <- vapply(nchar, function(x) paste0(rep(" ", times = x), collapse = ""), "")
  x <- paste0(names(x), ":", space, x, collapse = "\n")
  x <- paste0(x, "\n", collapse = "")
  cat(x)
  invisible(x)
}

#' @export
print.ypr_populations <- function(x, ...) {
  suppressWarnings(chk_populations(x))
  if(length(x) == 1) return(print(x[[1]]))
  x$FUN <- c
  x <- do.call("mapply", x)
  x <- as.data.frame(x)
  x <- lapply(x, function(x) if(length(unique(x)) == 1) x[1] else x)

  nchar <- nchar(names(x))
  nchar <- max(nchar) - nchar + 1
  space <- vapply(nchar, function(x) paste0(rep(" ", times = x), collapse = ""), "")
  names <- names(x)
  x <- lapply(x, paste0, collapse = ", ")
  x <- paste0(names, ":", space, x, collapse = "\n")
  x <- paste0(x, "\n", collapse = "")
  cat(x)
  invisible(x)
}

#' Population(s) or Ecotype Names
#'
#' Generates set of unique names based on differences in parameter values.
#'
#' Parameter RPR is ignored because it is irrelevant to population(s) and does not
#' distinguish between ecotypes.
#'
#' @param x An object of class ypr_population, ypr_populations or ypr_ecotypes.
#'
#' @return A character vector of the unique parameter based names.
#' @export
#' @examples
#' ypr_names(ypr_populations(Rk = c(2.5, 3, 2.5)))
ypr_names <- function(x) {
  x <- as_tibble(x)
  x <- x[, vapply(
    x,
    FUN = function(x) length(unique(x)) > 1,
    TRUE
  )]
  if (!ncol(x)) {
    return(paste0("Popn_", seq_len(nrow(x))))
  }
  x <- as.list(x)
  x <- purrr::map(
    x,
    .sub,
    pattern = "[.]",
    replacement = "_"
  )
  x <- purrr::map2(
    x,
    names(x),
    function(x, y) paste(y, x, sep = "_")
  )
  x <- purrr::transpose(x)
  x <- purrr::map(
    x,
    function(x) {
      paste0(unname(unlist(x)),
             collapse = "_"
      )
    }
  )
  names <- unlist(x)
  duplicates <- unique(names[duplicated(names)])
  for (duplicate in duplicates) {
    bol <- names == duplicate
    names[bol] <- paste(names[bol], "Popn", 1:sum(bol), sep = "_")
  }
  names
}

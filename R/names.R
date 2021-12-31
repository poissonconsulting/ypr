#' Population Names
#'
#' @inheritParams params
#'
#' @return A character vector of the unique population names.
#' @family populations
#' @export
#' @examples
#' ypr_population_names(ypr_populations(Rk = c(2.5, 3, 2.5), expand = FALSE))
ypr_population_names <- function(populations) {
  populations <- as_tibble(populations)
  populations <- populations[, vapply(
    populations,
    FUN = function(x) length(unique(x)) > 1,
    TRUE
  )]
  if (!ncol(populations)) {
    return(paste0("Popn_", seq_len(nrow(populations))))
  }
  populations <- as.list(populations)
  populations <- purrr::map(
    populations,
    .sub,
    pattern = "[.]",
    replacement = "_"
  )
  populations <- purrr::map2(
    populations,
    names(populations),
    function(x, y) paste(y, x, sep = "_")
  )
  populations <- purrr::transpose(populations)
  populations <- purrr::map(
    populations,
    function(x) {
      paste0(unname(unlist(x)),
             collapse = "_"
      )
    }
  )
  names <- unlist(populations)
  duplicates <- unique(names[duplicated(names)])
  for (duplicate in duplicates) {
    bol <- names == duplicate
    names[bol] <- paste(names[bol], "Popn", 1:sum(bol), sep = "_")
  }
  names
}

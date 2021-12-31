#' Create Ecotypes Object
#'
#' Creates an ypr_ecotypes object.
#'
#' @inheritParams params
#' @return An [ypr_ecotypes()] objects
#' @family ecotypes
#' @export
#' @examples
#' ypr_ecotypes(Linf = c(1, 2))
#' ypr_ecotypes(Linf = c(1, 2), t0 = c(0, 0.5))
ypr_ecotypes <- function(..., names = NULL) {
  chk_null_or(names, vld = vld_character)
  x <- ypr_populations(..., expand = FALSE)
  x <- as_ypr_ecotypes(x)

  if(!is.null(names)) {
    chk_not_any_na(names)
    chk_unique(names)
    if (!chk::vld_equal(length(x), length(names))) {
      chk::abort_chk(paste0("Number of populations and names do not match. ",
                            length(x), " != ", length(names)))
    }
  } else {
    names <- ypr_names(x)
  }
  names(x) <- names
  x
}

#' Update Ecotypes Parameters
#'
#' Allows updates to a parameter of an object of class [ypr_ecotypes()].
#'
#' @inheritParams params
#' @param ... One or more of the arguments from `ypr_population()`.
#' @return An object of class `ypr_ecotypes`.
#' @family ecotypes
#' @export
#' @examples
#' ypr_ecotypes_update(ypr_ecotypes(Linf = c(2.5, 4)), Linf = 2.5)
ypr_ecotypes_update <- function(ecotypes, ...) {
  ecotypes <- lapply(ecotypes, ypr_population_update, ...)
  class(ecotypes) <- "ypr_ecotypes"
  names(ecotypes) <- ypr_names(ecotypes)
  ecotypes
}

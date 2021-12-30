#' Coerce to an Ecotypes Object
#'
#' @param x The object to coerce.
#' @param ... Additional arguments.
#' @return An object of class ypr_ecotypes.
#' @family ecotypes
#' @export
as_ypr_ecotypes <- function(x, ...) {
  UseMethod("as_ypr_ecotypes")
}

#' @describeIn as_ypr_ecotypes Coerce a Population Object to an Ecotypes Object
#' @export
#' @examples
#' as_ypr_ecotypes(ypr_population())
as_ypr_ecotypes.ypr_population <- function(x, ...) {
  check_population(x)
  chk_unused(...)

  x <- list(x)
  class(x) <- "ypr_populations"
  as_ypr_ecotypes(x)
}

#' @describeIn as_ypr_ecotypes Coerce a Populations Object to an Ecotypes Object
#'
#' @param weights A numeric vector giving the relative proportion of recruits belonging
#' to each ecotype.
#' @param names A character vector providing names for each ecotype.
#' @export
#' @examples
#' as_ypr_ecotypes(ypr_populations(Ls = c(10, 15, 20)), c(1, 2, 1), c("river", "deep", "shallow"))
as_ypr_ecotypes.ypr_populations <- function(x, weights = NULL, names = NULL, ...) {
  check_populations(x)

  chk::chk_null_or(weights, vld = vld_numeric)
  chk::chk_null_or(names, vld = vld_character)
  chk_unused(...)

  chk_gt(length(x))

  if(is.null(weights)) {
    weights <- rep(1/length(x), length(x))
  }
  chk::chk_not_any_na(weights)
  chk::chk_gt(weights)

  if (!chk::vld_equal(length(x), length(weights))) {
    chk::abort_chk(paste0("Length of populations and weights do not match. ",
                          length(x), " != ",
                          length(weights)))
  }
  if(is.null(names)) {
    names <- ypr_population_names(x)
  }

  chk::chk_not_any_na(names)
  chk::chk_unique(names)
  if (!chk::vld_equal(length(x), length(names))) {
    chk::abort_chk(paste0("Length of populations and names do not match. ",
                          length(x), " != ",
                          length(names)))
  }

  class(x) <- c("ypr_ecotypes")
  names(x) <- names
  attr(x, "proportions") <- weights / sum(weights)
  check_ecotypes(x)
  x
}

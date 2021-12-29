#' Populations
#'
#' @inheritParams params
#' @inheritParams ypr_population_update
#'
#' @return A list of [ypr_population()] objects
#' @family populations
#' @export
#' @examples
#' ypr_populations(Rk = c(2.5, 4.6), Hm = c(0.2, 0.05))
ypr_populations <- function(..., expand = TRUE) {
  chk_flag(expand)
  population <- ypr_population()

  parameters <- list(...)

  if (!length(parameters)) {
    populations <- list(population)
    class(populations) <- "ypr_populations"
    return(populations)
  }
  chk_named(parameters, x_name = "`...`")
  chk_subset(names(parameters), .parameters$Parameter, x_name = "`names(...)`")
  chk_unique(names(parameters), x_name = "`names(...)`")

  if (expand) {
    parameters <- lapply(parameters, function(x) sort(unique(x)))
    parameters <- expand.grid(parameters)
  } else {
    lengths <- vapply(parameters, length, FUN.VALUE = 1L)
    lengths <- unique(lengths)
    lengths <- lengths[lengths != 1]
    if (length(lengths) > 1) {
      err(
        "Non-scalar parameter values must all be the same length (not ",
        cc(sort(lengths), conj = " and ", brac = ""), ")"
      )
    }
    parameters <- as.data.frame(parameters)
  }
  populations <- list()
  for (i in seq_len(nrow(parameters))) {
    population <- as.list(parameters[i, , drop = FALSE])
    attr(population, "out.attrs") <- NULL
    populations[[i]] <- do.call("ypr_population", population)
  }
  class(populations) <- "ypr_populations"
  names(populations) <- ypr_population_names(populations)
  populations
}

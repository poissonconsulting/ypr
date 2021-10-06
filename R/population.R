#' Population Parameters
#'
#' Generates an object of class `ypr_population`.
#'
#' @inheritParams params
#' @param pi The annual capture probability.
#' @return An object of class `ypr_population`.
#' @export
#' @examples
#' ypr_population(k = 0.1, Linf = 90)
ypr_population <- function(tmax = 20L, k = 0.15, Linf = 100, t0 = 0,
                           k2 = 0.15, Linf2 = 100, L2 = 1000,
                           Wb = 3, Ls = 50, Sp = 100, es = 1, Sm = 0,
                           fb = 1,
                           tR = 1L, BH = 1L, Rk = 3, n = 0.2, nL = 0.2,
                           Ln = 1000,
                           Lv = 50, Vp = 100,
                           Llo = 0, Lup = 1000, Nc = 0,
                           pi = 0.2, rho = 0, Hm = 0,
                           Rmax = 1, Wa = 0.01, fa = 1,
                           q = 0.1) {
  population <- as.list(environment())
  class(population) <- c("ypr_population")
  chk_population(population)
  population
}

#' Update Population Parameters
#'
#' Updates an object of class [ypr_population()].
#'
#' @inheritParams params
#' @param ... One or more of the arguments from `ypr_population()`.
#' @return An object of class `ypr_population`.
#' @export
#' @examples
#' ypr_population_update(ypr_population(), Rk = 2.5)
ypr_population_update <- function(population, ...) {
  chk_population(population)
  parameters <- list(...)
  population[names(parameters)] <- unname(parameters)
  chk_population(population)
  population
}

#' Update Population Parameters
#'
#' Updates an object of class [ypr_population()].
#'
#' @inheritParams params
#' @param ... One or more of the arguments from `ypr_population()`.
#' @return An object of class `ypr_population`.
#' @family populations
#' @export
#' @examples
#' ypr_populations_update(ypr_populations(Rk = c(2.5, 4)), Rk = 2.5)
ypr_populations_update <- function(populations, ...) {
  populations <- lapply(populations, ypr_population_update, ...)
  class(populations) <- "ypr_populations"
  names(populations) <- ypr_population_names(populations)
  populations
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
#' ypr_ecotypes_update(ypr_ecotypes(Linf = c(2.5, 4), weights = c(1, 1)), Linf = 2.5)
ypr_ecotypes_update <- function(ecotypes, ...) {
  proportions <- attr(ecotypes, "proportions")
  ecotypes <- lapply(ecotypes, ypr_population_update, ...)
  class(ecotypes) <- "ypr_ecotypes"
  names(ecotypes) <- ypr_population_names(ecotypes)
  attr(ecotypes, "proportions") <- proportions
  ecotypes
}

#' Expand Populations
#'
#' An object of class [ypr_population()] of all unique combinations of parameter
#' values.
#'
#' @inheritParams params
#' @return An object of class `ypr_population`.
#' @family populations
#' @export
#' @examples
#' ypr_populations_expand(
#'   ypr_populations(
#'     Rk = c(2.5, 4, 2.5),
#'     Hm = c(0.1, 0.2, 0.1)
#'   )
#' )
ypr_populations_expand <- function(populations) {
  populations <- as.data.frame(populations)
  populations <- unique(populations)
  populations <- as.list(populations)
  populations <- lapply(populations, function(x) sort(unique(x)))
  populations <- expand.grid(populations)
  populations <- unique(populations)
  as_ypr_populations(populations)
}

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

#' Ecotypes
#'
#' @inheritParams params
#' @param weights A numeric vector giving the weighting for how much it
#'   contributes to the overall population
#' @return A list of [ypr_ecotypes()] objects
#' @family ecotypes
#' @export
#' @examples
#' ypr_ecotypes(Linf = c(1, 2), weights = c(1, 1))
#' ypr_ecotypes(Linf = c(1, 2), t0 = c(0, 0.5), weights = c(1, 1))
ypr_ecotypes <- function(..., weights) {

  chk::chk_numeric(weights)
  chk::chk_not_any_na(weights)
  chk::chk_gt(weights, value = 0)

  ecotype <- ypr_population()

  parameters <- list(...)

  if (!length(parameters)) {
    populations <- list(ecotype)
    class(populations) <- "ypr_populations"
    return(ecotypes)
  }
  chk_named(parameters, x_name = "`...`")
  chk_subset(names(parameters), .parameters$Parameter, x_name = "`names(...)`")
  chk_unique(names(parameters), x_name = "`names(...)`")

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
  ecotypes <- list()
  for (i in seq_len(nrow(parameters))) {
    ecotype <- as.list(parameters[i, , drop = FALSE])
    attr(ecotype, "out.attrs") <- NULL
    ecotypes[[i]] <- do.call("ypr_population", ecotype)
  }

  class(ecotypes) <- "ypr_ecotypes"
  names(ecotypes) <- ypr_population_names(ecotypes)
  if (!chk::vld_equal(length(ecotypes), length(weights))) {
    chk::abort_chk(paste0("Length of parameters and weights do not match. ",
                          length(ecotypes), " != ",
                          length(weights)))
  }
  # convert weights into percents
  weights <- weights / sum(weights)
  attr(ecotypes, "proportions") <- weights

  ecotypes
}

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
  populations <- as.data.frame(populations)
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

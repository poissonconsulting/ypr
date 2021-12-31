#' @describeIn ypr_population_update Update Population Parameters
#' @export
update.ypr_population <- function(object, ...) {
  ypr_population_update(object, ...)
}

#' @describeIn ypr_populations_update Update Populations Parameters
#' @export
update.ypr_populations <- function(object, ...) {
  ypr_population_update(object, ...)
}

#' @describeIn ypr_ecotypes_update Update Ecotypes Parameters
#' @export
update.ypr_ecotypes <- function(object, ...) {
  ypr_ecotypes_update(object, ...)
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
  check_population(population)
  parameters <- list(...)
  population[names(parameters)] <- unname(parameters)
  check_population(population)
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
  names(populations) <- ypr_names(populations)
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
#' ypr_ecotypes_update(ypr_ecotypes(Linf = c(2.5, 4)), Linf = 2.5)
ypr_ecotypes_update <- function(ecotypes, ...) {
  ecotypes <- lapply(ecotypes, ypr_population_update, ...)
  class(ecotypes) <- "ypr_ecotypes"
  names(ecotypes) <- ypr_names(ecotypes)
  ecotypes
}



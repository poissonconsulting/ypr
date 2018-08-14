add_parameters <- function(x, object) {
  object <- as.data.frame(unclass(object))
  object$pi <- NULL
  merge(x, object)
}

as_conditional_tibble <- function(x) {
  if(requireNamespace("tibble", quietly = TRUE))
    x <- tibble::as_tibble(x)
  x
}

drop_constant_parameters <- function(x) {
  parameters <- .parameters$Parameter
  parameters <- parameters[parameters != "pi"]
  bol <- vapply(parameters, function(y) length(unique(x[[y]])) == 1, TRUE)
  parameters <- parameters[bol]
  x[parameters] <- NULL
  x
}

quantiles <- function(x, level) {
  x <- unlist(x)
  x <- stats::quantile(x, c(0.5, (1-level)/2, (1-level)/2 + level))
  setNames(x, c("estimate", "lower", "upper"))
}

sanitize <- function(x) {
  x[is.nan(x)] <- 0
  x[x < 0] <- 0
  x
}

tabulate_yield_pi <- function(pi, object, Ly, harvest, biomass, all) {
  object$pi <- pi
  yield <- ypr_tabulate_yield(object = object, Ly = Ly,
                              harvest = harvest, biomass = biomass,
                              type = "actual", all = all)
  yield$Type <- NULL
  yield
}

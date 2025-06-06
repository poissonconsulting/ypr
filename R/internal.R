ask_file <- function(file, ask) {
  if (!ask) {
    return(TRUE)
  }
  if (file.exists(file)) {
    return(yesno("Overwrite file '", file, "'?"))
  }
  yesno("Create file '", file, "'?")
}

bh <- function(stock, alpha, beta) {
  unname(alpha * stock / (1 + (beta * stock)))
}

ri <- function(stock, alpha, beta) {
  unname(alpha * stock * exp(-beta * stock))
}

add_parameters <- function(x, object) {
  object <- as.data.frame(unclass(object))
  object$pi <- NULL
  merge(x, object)
}

drop_constant_parameters <- function(x) {
  parameters <- parameters()
  parameters <- parameters[parameters != "pi"]
  bol <- vapply(parameters, function(y) length(unique(x[[y]])) == 1, TRUE)
  parameters <- parameters[bol]
  x[parameters] <- NULL
  x
}

drop_all_parameters <- function(x) {
  parameters <- parameters()
  parameters <- parameters[parameters != "pi"]
  x[parameters] <- NULL
  x
}

quantiles <- function(x, level) {
  x <- unlist(x)
  x <- stats::quantile(x, c(0.5, (1 - level) / 2, (1 - level) / 2 + level))
  setNames(x, c("estimate", "lower", "upper"))
}

sanitize <- function(x) {
  x[is.nan(x)] <- 0
  x[x < 0] <- 0
  x
}

tabulate_yield_pi <- function(pi, object, Ly, harvest, biomass, all) {
  object <- set_par(object, "pi", pi)
  yield <- ypr_tabulate_yield(
    object = object, Ly = Ly,
    harvest = harvest, biomass = biomass,
    type = "actual", all = all
  )
  yield$Type <- NULL
  yield
}

sum_fish <- function(x) {
  ecotype <- x$Ecotype[1]
  x$Ecotype <- NULL
  x[] <- lapply(x, sum)
  x[[1]] <- x[[1]] / nrow(x)
  x <- x[1, ]
  x$Ecotype <- ecotype
  x
}

.sub <- function(x, pattern, replacement) {
  sub(pattern, replacement, x)
}

.data <- NULL

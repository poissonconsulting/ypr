check_population <- function(x, exclusive = TRUE, order = TRUE, x_name = substitute(x)) {
  x_name <- chk_deparse(x_name)
  check_string(x_name, x_name = "x_name")

  check_inherits(x, "ypr_population", x_name = x_name)

  check_names(x, .parameters$Parameter,
              exclusive = exclusive, unique = TRUE, x_name = x_name)

  parameters <- .parameters

  parameters$Code <- paste0(
    "check_scalar(", parameters$Parameter, ", c(",
    parameters$Lower, ifelse(parameters$Integer == 1, "L", ""), ",",
    parameters$Upper, ifelse(parameters$Integer == 1, "L", ""), "))")

  code <- paste0(parameters$Code, collapse = "\n")
  code <- paste0("with(x, {\n", code, "\n})")

  eval(parse(text = code))

  if(x$Linf < x$Ls) err("'", x_name, "' parameter Linf < Ls")
  if(x$Linf < x$Lv) err("'", x_name, "' parameter Linf < Lv")

  x
}

check_populations <- function(x, exclusive = TRUE, order = TRUE, x_name = substitute(x)) {
  x_name <- chk_deparse(x_name)
  check_string(x_name, x_name = "x_name")

  x_name <- paste("elements of", x_name)

  check_inherits(x, "ypr_populations")

  lapply(x, check_population, exclusive = exclusive, order = order,
         x_name = x_name)

  check_named(x, x_name = x_name, unique = TRUE, error = FALSE)

  x
}

check_ecotypes <- function(x, exclusive = TRUE, order = TRUE, x_name = substitute(x)) {
  x_name <- chk_deparse(x_name)

  x_name <- paste("elements of", x_name)

  check_inherits(x, "ypr_ecotypes")

  lapply(x, check_population, exclusive = exclusive, order = order,
         x_name = x_name)

  shared <- lapply(x, function(x) x[.parameters$Parameter[!.parameters$Ecotype]])
  shared <- lapply(shared, as.data.frame)
  shared <- do.call("rbind", shared)
  shared <- lapply(shared, function(x) length(unique(x)))
  shared <- vapply(shared, function(x) x == 1L, TRUE)
  if(any(!shared)) {
    err(co_and(names(shared[!shared]), p0("the following %n parameter%s must be identical: %c")))
  }

  check_named(x, x_name = x_name, unique = TRUE, error = FALSE)

  x
}

check_yield_parameters <- function(population, Ly, harvest, biomass) {
  check_population(population)
  check_scalar(Ly, c(0, Inf))
  check_flag(biomass)
  check_flag(harvest)
  population
}

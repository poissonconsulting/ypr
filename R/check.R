check_population <- function(x, exclusive = TRUE, order = TRUE, x_name = substitute(x)) {
  x_name <- deparse(x_name)

  check_inherits(x, "ypr_population")

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

  x
}

check_populations <- function(x, exclusive = TRUE, order = TRUE, x_name = substitute(x)) {
  x_name <- deparse(x_name)

  x_name <- paste("elements of", x_name)

  check_inherits(x, "ypr_populations")

  lapply(x, check_population, exclusive = exclusive, order = order,
         x_name = x_name)

  x
}

check_schedule <- function(x, exclusive = TRUE, order = TRUE, x_name = substitute(x)) {
  x_name <- deparse(x_name)

  check_data(
    x,
    values = list(Age = c(0L, 100L),
                  Length = c(0, 1000),
                  Weight = c(0, .Machine$double.xmax),
                  Fecundity = c(0, .Machine$double.xmax),
                  Spawning = c(0, 1),
                  NaturalMortality = c(0, 1),
                  Vulnerability = c(0, 1),
                  Retention = c(0, 1),
                  FishingMortality = c(0, 1),
                  Survivorship = c(0, 1),
                  FishedSurvivorship = c(0, 1)),
    nrow = TRUE,
    exclusive = exclusive,
    order = order,
    x_name = x_name)

  check_attributes(x, values = list(BH = c(0L, 1L, 1L),
                                    Rk = c(0, 100),
                                    Rmax = c(1, 1e+06),
                                    pi = c(0, 1)))

  if(any(diff(x$Age) != 1L))
    stop("Ages in schedule ", x_name, " must be consecutive", call. = FALSE)

  x
}

check_yield_parameters <- function(population, Ly, harvest, biomass) {
  check_population(population)
  check_scalar(Ly, c(0, Inf))
  check_flag(biomass)
  check_flag(harvest)
  population
}

check_tabulated_yield <- function(x, exclusive = TRUE, order = TRUE, x_name = substitute(x)) {
  x_name <- deparse(x_name)

  check_data(
    x,
    values = list(Type = c("actual", "actual", "optimal"),
                  pi = c(0, 1),
                  Yield = c(0, .Machine$double.xmax),
                  Age = c(0, 100),
                  Length = c(0, .Machine$double.xmax),
                  Weight = c(0, .Machine$double.xmax),
                  Effort = c(0, .Machine$double.xmax)
                  ),
    nrow = TRUE,
    exclusive = exclusive,
    order = order,
    x_name = x_name)

  check_attributes(x, values = list(Ly = c(0, 1000),
                                    harvest = TRUE,
                                    biomass = TRUE))

  x
}

check_tabulated_yields <- function(x, exclusive = TRUE, order = TRUE, x_name = substitute(x)) {
  x_name <- deparse(x_name)

  check_data(
    x,
    values = list(pi = c(0, 1),
                  Yield = c(0, .Machine$double.xmax),
                  Age = c(0, 100, NA),
                  Length = c(0, .Machine$double.xmax, NA),
                  Weight = c(0, .Machine$double.xmax, NA),
                  Effort = c(0, .Machine$double.xmax)
                  ),
    nrow = TRUE,
    exclusive = exclusive,
    order = order,
    x_name = x_name)

  check_attributes(x, values = list(Ly = c(0, 1000),
                                    harvest = TRUE,
                                    biomass = TRUE))

  x
}

check_tabulated_sr <- function(x, exclusive = TRUE, order = TRUE, x_name = substitute(x)) {
  x_name <- deparse(x_name)

  check_data(
    x,
    values = list(Type = c("unfished", "actual", "optimal"),
                  pi = c(0, 1),
                  Eggs = c(0, .Machine$double.xmax),
                  Recruits = c(0, .Machine$double.xmax),
                  Spawners = c(0, .Machine$double.xmax),
                  Fecundity = c(0, .Machine$double.xmax)
                  ),
    nrow = TRUE,
    exclusive = exclusive,
    order = order,
    x_name = x_name)

  check_attributes(x, values = list(alpha = c(0, .Machine$double.xmax),
                                    beta = c(0, .Machine$double.xmax),
                                    Ly = c(0, 1000),
                                    harvest = TRUE,
                                    biomass = TRUE))
  x
}

check_tabulated_parameters <- function(x, exclusive = TRUE, order = TRUE, x_name = substitute(x)) {
  x_name <- deparse(x_name)

  check_data(
    x,
    values = list(Parameter = .parameters$Parameter,
                  Value = c(min(.parameters$Lower), max(.parameters$Upper)),
                  Description = ""),
    exclusive = exclusive,
    order = order,
    x_name = x_name,
    nrow = nrow(.parameters),
    key = "Parameter")
  x
}

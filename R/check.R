check_population <- function(x, exclusive = TRUE, order = TRUE, x_name = substitute(x)) {
  x_name <- deparse(x_name)

  check_list(x)
  check_named(x, x_name = x_name)
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

check_schedule <- function(x, complete = FALSE, exclusive = FALSE, order = FALSE, x_name = substitute(x)) {
  x_name <- deparse(x_name)

  values <- list(Age = c(0L, .tmax),
                 Length = c(0, .Lmax),
                 Weight = c(0, .Machine$double.xmax),
                 Fecundity = c(0, .Machine$double.xmax),
                 Spawning = c(0, 1),
                 NaturalMortality = c(0, 1),
                 Vulnerability = c(0, 1),
                 Release = c(0, 1),
                 FishingMortality = c(0, 1))
  if(complete) {
    values <- c(values, list(Survivorship = c(0, 1),
                             FishedSurvivorship = c(0, 1)))
  }

  check_data(x,
             values = values,
             nrow = TRUE,
             exclusive = exclusive,
             order = order,
             x_name = x_name)

  check_attributes(x, values = list(BH = c(0L, 1L),
                                    Rk = c(1, 30),
                                    R0 = c(1, 1e+03),
                                    pi = c(0, 1)))

  if(any(diff(x$Age) != 1L))
    stop("Ages in schedule ", x_name, " must be consecutive", call. = FALSE)

  x
}

check_yield_parameters <- function(population, Ly, harvest,
                           biomass, sanitize) {
  check_flag(sanitize)
  checkor(check_population(population), check_schedule(population, complete = TRUE))
  check_scalar(Ly, c(0, Inf))
  check_flag(biomass)
  check_flag(harvest)
}

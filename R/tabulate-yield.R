#' Tabulate Yield
#'
#' @inheritParams params
#'
#' @return A data frame.
#' @family tabulate
#' @family populations
#' @family yield
#' @export
#' @examples
#' ypr_tabulate_yield(ypr_population())
#' ypr_tabulate_yield(ypr_populations(Rk = c(3, 5)))
ypr_tabulate_yield <- function(object, ...) {
  UseMethod("ypr_tabulate_yield")
}

#' Tabulate Population Parameters
#'
#' @inheritParams params
#' @return A table of population parameters
#' @family tabulate
#' @family parameters
#' @export
#' @examples
#' ypr_tabulate_parameters(ypr_population())
ypr_tabulate_parameters <- function(population) {
  check_population(population)

  parameters <- data.frame(
    Parameter = names(population),
    Value = unname(unlist(population)),
    stringsAsFactors = FALSE
  )

  pattern <- "(\\\\item[{])([^}]+)([}])([{])([^}]+)([}])"
  rd <- tools::Rd_db("ypr")$ypr_population.Rd
  rd <- paste0(as.character(rd), collapse = "")
  gp <- gregexpr(pattern, rd)
  rd <- regmatches(rd, gp)[[1]]

  data <- data.frame(
    Parameter = .sub(rd, pattern, "\\2"),
    Description = .sub(rd, pattern, "\\5"),
    stringsAsFactors = FALSE
  )

  parameters <- merge(parameters, data, by = "Parameter", sort = FALSE)

  as_tibble(parameters)
}

#' @describeIn ypr_tabulate_yield Tabulate Yield
#' @export
ypr_tabulate_yield.ypr_population <- function(object,
                                              Ly = 0,
                                              harvest = TRUE,
                                              biomass = FALSE,
                                              type = "both",
                                              all = FALSE,
                                              ...) {
  chk_string(type)
  chk_subset(type, c("both", "actual", "optimal"))
  actual_pi <- object$pi

  actual_yield <- ypr_yield(object,
    Ly = Ly, harvest = harvest,
    biomass = biomass
  )

  if (type == "actual") {
    yield <- data.frame(
      Type = "actual",
      pi = actual_pi,
      u = ypr_exploitation(object, actual_pi),
      Yield = actual_yield,
      Age = attr(actual_yield, "Age"),
      Length = attr(actual_yield, "Length"),
      Weight = attr(actual_yield, "Weight"),
      Effort = attr(actual_yield, "Effort"),
      stringsAsFactors = FALSE
    )
  } else {
    optimal_pi <- ypr_optimize(object,
      Ly = Ly, harvest = harvest,
      biomass = biomass
    )

    object <- ypr_update(object, pi = optimal_pi)

    optimal_yield <- ypr_yield(object,
      Ly = Ly, harvest = harvest,
      biomass = biomass
    )
    yield <- data.frame(
      Type = c("actual", "optimal"),
      pi = c(actual_pi, optimal_pi),
      u = ypr_exploitation(object, c(actual_pi, optimal_pi)),
      Yield = c(actual_yield, optimal_yield),
      Age = c(attr(actual_yield, "Age"), attr(optimal_yield, "Age")),
      Length = c(attr(actual_yield, "Length"), attr(optimal_yield, "Length")),
      Weight = c(attr(actual_yield, "Weight"), attr(optimal_yield, "Weight")),
      Effort = c(attr(actual_yield, "Effort"), attr(optimal_yield, "Effort")),
      stringsAsFactors = FALSE
    )

    if (type == "optimal") {
      yield <- yield[yield$Type == "optimal", ]
    }
  }

  if (all) yield <- add_parameters(yield, object)

  as_tibble(yield)
}

#' @describeIn ypr_tabulate_yield Tabulate Yield
#' @export
ypr_tabulate_yield.ypr_populations <- function(object,
                                               Ly = 0,
                                               harvest = TRUE,
                                               biomass = FALSE,
                                               type = "both",
                                               all = FALSE,
                                               ...) {
  chk_flag(all)

  yield <- lapply(object, ypr_tabulate_yield,
    Ly = Ly, harvest = harvest,
    biomass = biomass, type = type, all = TRUE, ...
  )

  yield <- do.call("rbind", yield)

  if (!all) yield <- drop_constant_parameters(yield)

  as_tibble(yield)
}

#' @describeIn ypr_tabulate_yield Tabulate Yield
#' @param average A flag to either give each ecotype separately or averaged
#'   based on the proportions
#' @export
#' @examples
#' ypr_tabulate_yield(ypr_ecotypes(Ls = c(40, 50)))
ypr_tabulate_yield.ypr_ecotypes <- function(object,
                                            Ly = 0,
                                            harvest = TRUE,
                                            biomass = FALSE,
                                            type = "both",
                                            all = FALSE,
                                            average = TRUE,
                                            ...) {
  chk::chk_flag(all)
  chk::chk_flag(average)

  yield <- lapply(object, ypr_tabulate_yield,
                  Ly = Ly, harvest = harvest,
                  biomass = biomass, type = type, all = TRUE, ...
  )

  print(yield)
  eco_names <- names(object)

  yield <- mapply(function(yield, eco_names) {
    yield[["Ecotype"]] <- eco_names
    yield

  }, yield, eco_names, SIMPLIFY = FALSE)

  yield <- do.call("rbind", yield)
  if (!all) {
    yield <- drop_all_parameters(yield)
  }
  as_tibble(yield)

  if (!average) {
    return(yield)
  }
  yield
}

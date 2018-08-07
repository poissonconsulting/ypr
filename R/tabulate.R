
#' Tabulate Yield
#'
#'
#' @inheritParams ypr_schedule
#' @inheritParams ypr_yield
#' @return A ggplot2 object.
#' @seealso \code{\link{ypr_population}} and \code{\link{ypr_yield}}
#' @export
#' @examples
#' ypr_tabulate_yield(ypr_population())
ypr_tabulate_yield <- function(population, Ly = 0, harvest = FALSE, biomass = FALSE) {

  actual_pi <- population$pi

  optimal_pi <- ypr_optimize(population, Ly = Ly, harvest = harvest,
                             biomass = biomass)

  actual_yield <- ypr_yield(population, Ly = Ly, harvest = harvest,
                            biomass = biomass)

  optimal_yield <- ypr_yields(population, pi = optimal_pi, Ly = Ly, harvest = harvest,
                              biomass = biomass)

  yield <- data.frame(Type = c("actual", "optimal"),
                      pi = c(actual_pi, optimal_pi),
                      Yield = c(actual_yield, optimal_yield),
                      stringsAsFactors = FALSE)

  attr(yield, "Ly") <- Ly
  attr(yield, "harvest") <- harvest
  attr(yield, "biomass") <- biomass

  if(requireNamespace("tibble", quietly = TRUE))
    yield <- tibble::as_tibble(yield)
  yield
}

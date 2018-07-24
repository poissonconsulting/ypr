#' Yields
#'
#' Calculates the yield(s) for a population based on one or more capture rates.
#'
#' @param mu A vector of probabilities of capture to calculate the yield for.
#' @inheritParams ypr_schedule
#' @inheritParams ypr_yield
#' @seealso \code{\link{ypr_population}}, \code{\link{ypr_optimize}},
#' \code{\link{ypr_yield}} and \code{\link{ypr_plot}}
#' @return A double vector of the yields.
#' @export
#' @examples
#' mu <- seq(0, 1, length.out = 100)
#' plot(mu, ypr_yields(ypr_population(), mu), type = "l")
ypr_yields <- function(population, mu = seq(0, 1, length.out = 100),
                       Ly = 0, harvest = TRUE, biomass = TRUE) {

  check_population(population)
  check_vector(mu, c(0, 1), length = TRUE)
  check_scalar(Ly, c(0, Inf))
  check_flag(biomass)
  check_flag(harvest)

  yields <- vapply(X = mu, FUN = yield_mu, FUN.VALUE = 1, population = population,
                   Ly = Ly, harvest = harvest,
                   biomass = biomass)
  sanitize(yields)
}

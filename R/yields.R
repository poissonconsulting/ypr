#' Yields
#'
#' Calculates yield across full range of capture values.
#'
#' @param mu A vector of probabilities of capture to calculate the yield for.
#' @inheritParams ypr_yield
#' @export
#' @examples
#' mu <- seq(0, 0.5, length.out = 30)
#' plot(mu, ypr_yields(mu = mu), type = "l")
ypr_yields <- function(population = ypr_population(),
                       mu = seq(0, 1, length.out = 30),
                       Ly = 0, harvest = TRUE, biomass = TRUE, check = TRUE) {
  check_flag(check)

  if(check) {
    check_vector(mu, c(0, 1), length = TRUE)
    check_population(population)
    check_scalar(Ly, c(0, Inf))
    check_flag(biomass)
    check_flag(harvest)
  }
  yields <- vapply(X = mu, FUN = yield, FUN.VALUE = 1, population = population,
         Ly = Ly, harvest = harvest,
         biomass = biomass, check = check)
  sanitize(yields)
}

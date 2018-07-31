#' Yields
#'
#' Calculates the yield(s) for a population based on one or more capture rates.
#'
#' @param pi A vector of probabilities of capture to calculate the yield for.
#' @inheritParams ypr_schedule
#' @inheritParams ypr_yield
#' @inheritParams ypr_yield_uncertainty
#' @seealso \code{\link{ypr_population}}, \code{\link{ypr_optimize}},
#' \code{\link{ypr_yield}} and \code{\link{ypr_plot}}
#' @return A double vector of the yields.
#' @export
#' @examples
#' pi <- seq(0, 1, length.out = 100)
#' plot(pi, ypr_yields(ypr_population(), pi), type = "l")
ypr_yields <- function(population, pi = seq(0, 1, length.out = 100),
                       Ly = 0, harvest = TRUE, biomass = TRUE,
                       check = TRUE,
                       mc.cores = getOption("mc.cores", 2L)) {

  check_flag(check)
  if(check) {
    check_population(population)
    check_vector(pi, c(0, 1), length = TRUE)
    check_scalar(Ly, c(0, Inf))
    check_flag(biomass)
    check_flag(harvest)
  }
  yields <- parallel::mclapply(pi, FUN = yield_pi, population = population,
                               Ly = Ly, harvest = harvest,
                               biomass = biomass, mc.cores = mc.cores,
                               mc.allow.recursive = FALSE)
  yields <- unlist(yields)
  sanitize(yields)
}

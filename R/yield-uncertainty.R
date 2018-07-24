#' Yield with Uncertainty
#'
#' Calculates a yield with lower and upper limits.
#' The uncertainty in each population parameter is assumed to be a uniform distribution between the value in x and the value in x2.
#' The parameters are assumed to be uncorrelated and there is no requirement
#' for the value in x to be less than the value in x2
#' The parameters \code{tmax} and \code{Rk} must not vary.
#'
#' @inheritParams ypr_yield
#' @param x A list of population life-history parameters.
#' @param x2 A second list of population life-history parameters.
#' @param n A numeric of the number of iterations.
#' @param level A probability of the interval.
#' @param mc.cores The number of cores to use, i.e. at most how many child processes will be run simultaneously.
#' The option is initialized from environment variable MC_CORES if set.
#' Must be at least one, and parallelization requires at least two cores.
#' @return A double vector of the yield and its lower and upper limits.
#' @seealso \code{\link{ypr_population}} and \code{\link{ypr_yield}}
#' @export
#' @examples
#' population <- ypr_population()
#' population$Rk <- 10
#' ypr_yield_uncertainty(population, ypr_population(), 2)
ypr_yield_uncertainty <- function(x, x2, Ly = 0, harvest = TRUE, biomass = TRUE,
                             sanitize = TRUE, check = TRUE, n = 10^4,
                             level = 0.95, mc.cores = getOption("mc.cores", 2L)) {
  check_flag(check)

  if(check) {
    check_population(x)
    check_population(x2)
    check_scalar(Ly, c(0, Inf))
    check_flag(harvest)
    check_flag(biomass)
    check_flag(sanitize)
    check_probability(level)
    if(!identical(x[c("tmax", "Rt")], x2[c("tmax", "Rt")]))
      stop("populations x and x2 must have the same values for 'tmax' and 'Rt'", call. = FALSE)
  }

  x <- sample_population(x, x2, n = n)
  x <- parallel::mclapply(x, FUN = ypr_yield,
              Ly = Ly, harvest = harvest, biomass = biomass,
              sanitize = sanitize, check = FALSE, mc.cores = mc.cores,
              mc.allow.recursive = FALSE)
  x <- unlist(x)
  x <- stats::quantile(x, c(0.5, (1-level)/2, (1-level)/2 + level))
  setNames(x, c("estimate", "lower", "upper"))
}

complete_schedule <- function(x) {
  x$TotalMortality <- 1 - (1 - x$NaturalMortality) * (1 - x$FishingMortality)
  x$Survivorship <- cumprod(1 - x$NaturalMortality)
  x$Survivorship <- c(1, x$Survivorship[-nrow(x)])
  x$FishedSurvivorship <- cumprod(1 - x$TotalMortality)
  x$FishedSurvivorship <- c(1, x$FishedSurvivorship[-nrow(x)])
  x
}

#' Life-History Schedule
#'
#' Generates a tibble of the life-history schedule by age for a population.
#'
#' @inheritParams ypr_yield
#' @param population A list of population life-history parameters.
#' @param complete A flag indicating whether to generate a complete schedule.
#' @return A tibble of the life-history schedule by age.
#' @seealso \code{\link{ypr_population}} and \code{\link{plot.ypr_population}}.
#' @export
#' @examples
#' ypr_schedule(ypr_population())
ypr_schedule <- function(population, complete = FALSE, check = TRUE) {
  check_flag(check)
  if(check) {
    check_flag(complete)
    check_population(population)
  }
  schedule <- with(population, {
    t <- Rt:tmax
    n <- length(t)
    L <- growth(t, k = k, Linf = Linf, t0 = t0)
    W <- weight(L, a = a, b = b)
    E <- fecundity(L, Lm = Lm, a = a, b = b, fa = fa, fb = fb)
    N <- c(rep(nu, n-1),1)
    V <- L >= Lv
    C <- mu * V
    H <- V & L >= Llo & L <= Lup
    R <- rep(rho, n)
    R[!H] <- 1
    U <- C * (1 - R) + C * R * eta

    tibble::tibble(Age = t, Length = L, Weight = W, Fecundity = E,
                   NaturalMortality = N, Capture = C, Release = R,
                   FishingMortality = U, Productivity = Rk)
  })
  if(complete) schedule <- complete_schedule(schedule)
  schedule
}

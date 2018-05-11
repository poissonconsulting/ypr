#' Life-History Schedule
#'
#' @param population A list of population life-history parameters.
#' @inheritParams ypr_yield
#' @return A tibble of the life-history schedule by age.
#' @export
#' @examples
#' ypr_schedule()
ypr_schedule <- function(population = ypr_population(), check = TRUE) {
  check_flag(check)
  if(check) check_population(population)

  with(population, {
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
}

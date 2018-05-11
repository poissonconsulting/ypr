#' Life-History Schedule
#'
#' @param tmax The maximum age.
#' @inheritParams ypr_length
#' @inheritParams ypr_weight
#' @inheritParams ypr_fecundity
#' @param Rt The recruitment age for the stock recruitment relationship.
#' @param nu The annual probability of dying due to natural causes.
#' @param Lv The length at which vulnerable to harvest.
#' @param Llo The lower harvest length.
#' @param Lup The upper harvest length.
#' @param mu The annual probability of being captured.
#' @param rho The release probability.
#' @param eta The hooking mortality probability.
#' @return A tibble of the life-history schedule by age.
#' @export
#' @examples
#' ypr_schedule()
ypr_schedule <- function(tmax = 20L, k = 0.15, Linf = 100, t0 = 0, a = 1e-05, b = 3,
                Lm = Linf/2, fa = 1, fb = 1,
                Rt = 1L, nu = 0.2,
                Lv = Linf/2, Llo = 0, Lup = Linf,
                mu = 0.1, rho = 0, eta = 0.1) {
  check_scalar(tmax, c(1L, .tmax))
  check_scalar(Linf, c(0, .Lmax))
  check_scalar(Rt, c(0L, tmax - 1L))
  check_probability(nu)
  check_scalar(Lv, c(0, Linf))
  check_scalar(Lup, c(0, Linf))
  check_scalar(Llo, c(0, Lup))
  check_scalar(Lup, c(Llo, Linf))
  check_probability(mu)
  check_probability(rho)
  check_probability(eta)

  t <- Rt:tmax
  n <- length(t)
  L <- ypr_length(t, k = k, Linf = Linf, t0 = t0)
  W <- ypr_weight(L, a = a, b = b)
  E <- ypr_fecundity(L, Lm = Lm, a = a, b = b, fa = fa, fb = fb)
  N <- c(rep(nu, n-1),1)
  V <- L >= Lv
  C <- mu * V
  H <- V & L >= Llo & L <= Lup
  R <- rep(rho, n)
  R[!H] <- 1
  U <- C * (1 - R) + C * R * eta

  tibble::tibble(Age = t, Length = L, Weight = W, Fecundity = E,
                 NaturalMortality = N, Capture = C, Release = R,
                 FishingMortality = U)
}

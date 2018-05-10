#' Yield-Per-Recruit
#'
#' @param tmax The maximum age.
#' @inheritParams ypr_length
#' @inheritParams ypr_weight
#' @inheritParams ypr_fecundity
#' @param Rt A count of the recruitment age for the stock recruitment relationship.
#' @param nu The annual probability of dying due to natural causes.
#' @param Lv The length at which vulnerable to harvest.
#' @param Llo The lower harvest length.
#' @param Lup The upper harvest length.
#' @param mu The annual probability of being captured.
#' @param rho The release probability.
#' @param eta The hooking mortality probability.
#' @export
#' @examples
#' ypr()
ypr <- function(tmax = 20L, k = 0.15, Linf = 100, t0 = 0, a = 1e-05, b = 3,
                Lm = Linf/2, fa = 1, fb = 1,
                Rt = 1L, nu = 0.2,
                Lv = Linf/2, Llo = 0, Lup = Linf,
                mu = 0.1, rho = 0, eta = 0.1
                ) {
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
  L <- ypr_length(t, k = k, Linf = Linf, t0 = t0)
  W <- ypr_weight(L, a = a, b = b)
  E <- ypr_fecundity(L, Lm = Lm, a = a, b = b, fa = fa, fb = fb)
  N <- rep(nu, length(t) - 1)
  S <- cumprod(c(1,1-N))
  N <- c(N,1)
  V <- L >= Lv
  H <- V & L >= Llo & L <= Lup
  U <- N
  U[V & H] <- 1 - (1 - N[V & H]) * (1 - ((mu * rho * eta) + (mu * (1 - rho))))
  U[V & !H] <- 1 - (1 - N[V & !H]) * (1 - mu * eta)
  FS <- cumprod(c(1,1-U))
  FS <- FS[-length(FS)]

  tibble::tibble(Age = t, Length = L, Weight = W, Fecundity = E,
                 Mortality = N, Survivorship = S,
                 Vulnerable = V, Harvest = H,
                 FishedMortality = U, FishedSurvivorship = FS)
}
# need plot of growth, abundance, biomass
# return 1 data frame of Age, Length, Weight, Fecundity, Survivorship, Biomass, FishedSurvivorship, FishedBiomass

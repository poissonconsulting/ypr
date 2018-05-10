#' Yield-Per-Recruit
#'
#' @param tmax The maximum age.
#' @inheritParams ypr_length
#' @inheritParams ypr_weight
#' @inheritParams ypr_vulnerability
#' @inheritParams ypr_survivorship
#' @inheritParams ypr_fecundity
#' @export
#' @examples
#' ypr()
ypr <- function(tmax = 20L, k = 0.15, Linf = 100, t0 = 0, a = 1e-05, b = 3,
                Llo = Linf/2, Lup = Linf, mu = 0.2,
                Lm = Linf/2, fa = a, fb = b, Rt = 1L) {
  check_scalar(tmax, c(1L, .tmax))
  check_scalar(Linf, c(0, 1000))
  check_scalar(Lup, c(0, Linf))
  check_scalar(Llo, c(0, Lup))
  check_scalar(Lup, c(Llo, Linf))
  check_scalar(Rt, c(0L, tmax - 1L))

  t <- Rt:tmax
  L <- ypr_length(t, k = k, Linf = Linf, t0 = t0)
  W <- ypr_weight(L, a = a, b = b)
  V <- ypr_vulnerability(L, Llo = Llo, Lup = Lup)
  S <- ypr_survivorship(t, mu = mu, Rt = Rt)
  f <- ypr_fecundity(L, Lm = Lm, fa = fa, fb = fb)

  tibble::tibble(Age = t, Length = L, Weight = W,
                 Vulnerability = V, Survivorship = S, Fecundity = f)
}
# need plot of growth, abundance, biomass
# return 1 data frame of Age, Length, Weight, Fecundity, Survivorship, Biomass, FishedSurvivorship, FishedBiomass

#' Yield-Per-Recruit
#'
#' @param tmax The maximum age.
#' @inheritParams ypr_length
#' @inheritParams ypr_weight
#' @inheritParams ypr_vulnerability
#' @inheritParams ypr_survivorship
#' @export
#' @examples
#' ypr()
ypr <- function(tmax = 20L, k = 0.1, Linf = 100, t0 = 0, a = 1e-05, b = 3,
                Llo = Linf/2, Lup = Linf, mu = 0.2) {
  check_scalar(tmax, c(1L, .t_max))
  check_scalar(Linf, c(0, 1000))
  check_scalar(Lup, c(0, Linf))
  check_scalar(Llo, c(0, Lup))
  check_scalar(Lup, c(Llo, Linf))

  t <- 0:tmax
  L <- ypr_length(t, k = k, Linf = Linf, t0 = t0)
  W <- ypr_weight(L, a = a, b = b)
  V <- ypr_vulnerability(L, Llo = Llo, Lup = Lup)
  S <- ypr_survivorship(t, mu = mu)

  tibble::tibble(t = t, L = L, W = W, V = V, S = S)
}
# need plot of growth, abundance, biomass
# return 1 data frame of Age, Length, Weight, Fecundity, Survivorship, Biomass, FishedSurvivorship, FishedBiomass

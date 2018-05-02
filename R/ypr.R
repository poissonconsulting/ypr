#' Yield-Per-Recruit
#'
#' @param tmax The maximum age.
#' @inheritParams ypr_length
#' @inheritParams ypr_weight
#' @export
#' @examples
#' ypr()
ypr <- function(tmax = 20L, k = 0.5, Linf = 1000, t0 = 0, a = 1e-05, b = 3) {
  check_scalar(tmax, c(1L, 100L))
  t <- 0:tmax
  L <- ypr_length(t, k = k, Linf = Linf, t0 = t0)
  W <- ypr_weight(L, a = a, b = b)

  tibble::tibble(t = t, L = L, W = W)
}
# need plot of growth, abundance, biomass
# return 1 data frame of Age, Length, Weight, Fecundity, Survivorship, Biomass, FishedSurvivorship, FishedBiomass

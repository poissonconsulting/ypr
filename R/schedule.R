#' Life-History Schedule
#'
#' Generates the life-history schedule by age for a population.
#'
#' @inheritParams params
#' @return A tibble of the life-history schedule by age.
#' @seealso [ypr_population()]
#' @export
#' @examples
#' ypr_schedule(ypr_population())
ypr_schedule <- function(population) {
  chk_population(population)

  schedule <- with(population, {
    t <- tR:tmax
    nt <- length(t)
    L <- Linf * (1 - exp(-k * (t - t0)))
    t2 <- -log(1 - min(L2/Linf, 1)) / k - t0
    if(t2 < tmax) {
      L[t > t2] <- L2 + (Linf2 - L2) * (1 - exp(-k2 * (t[t > t2] - t2)))
    }
    L[L < 0] <- 0
    W <- Wa * L^Wb
    E <- fa * W^fb
    S <- exp(log(L / 1000) * Sp) / (exp(log(Ls / 1000) * Sp) + exp(log(L / 1000) * Sp)) * es
    N <- rep(n, nt)
    N[L >= Ln] <- nL
    N <- 1 - ((1 - N) * (1 - S * Sm))
    V <- exp(log(L / 1000) * Vp) / (exp(log(Lv / 1000) * Vp) + exp(log(L / 1000) * Vp))
    C <- pi * V
    R <- rep(1 - rho, nt)
    R[L < Llo | L > Lup] <- Nc
    U <- C * R + C * (1 - R) * Hm

    TotalMortality <- 1 - (1 - N) * (1 - U)
    Survivorship <- cumprod(1 - N)
    Survivorship <- c(1, Survivorship[-nt])
    FishedSurvivorship <- cumprod(1 - TotalMortality)
    FishedSurvivorship <- c(1, FishedSurvivorship[-nt])

    data.frame(Age = t, Length = L, Weight = W, Fecundity = E, Spawning = S,
               NaturalMortality = N, Vulnerability = V, Retention = R,
               FishingMortality = U, Survivorship = Survivorship,
               FishedSurvivorship = FishedSurvivorship)
  })

  as_tibble(schedule)
}

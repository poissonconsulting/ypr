complete_schedule <- function(x) {
  TotalMortality <- 1 - (1 - x$NaturalMortality) * (1 - x$FishingMortality)
  x$Survivorship <- cumprod(1 - x$NaturalMortality)
  x$Survivorship <- c(1, x$Survivorship[-nrow(x)])
  x$FishedSurvivorship <- cumprod(1 - TotalMortality)
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
    t <- tR:tmax
    n <- length(t)
    L <- Linf * (1 - exp(-k * (t-t0)))
    L[L < 0] <- 0
    W <- Wa * L^Wb
    E <- fa * W^fb
    E[L < Lm] <- 0
    N <- ypr_instant2interval(M * L^Mb)
    N[n] <- 1
    V <- exp(log(L/Linf) * Vp) / (exp(log(Lv/Linf) * Vp) + exp(log(L/Linf) * Vp))
    C <- pi * V
    R <- rep(rho, n)
    R[L < Llo | L > Lup] <- 1 - Nc
    U <- C * (1 - R) + C * R * Hm

    data.frame(Age = t, Length = L, Weight = W, Fecundity = E,
                   NaturalMortality = N, Vulnerability = V, Release = R,
                   FishingMortality = U)
  })
  if(complete) schedule <- complete_schedule(schedule)

  attr(schedule, "tau") <- population$tau
  attr(schedule, "BH") <- population$BH
  attr(schedule, "Rk") <- population$Rk
  attr(schedule, "R0") <- population$R0
  attr(schedule, "pi") <- population$pi

  if(requireNamespace("tibble", quietly = TRUE))
    schedule <- tibble::as_tibble(schedule)
  schedule
}

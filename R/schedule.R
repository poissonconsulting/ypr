#' Life-History Schedule
#'
#' Generates the life-history schedule by age for a population.
#'
#' @inheritParams params
#' @return A tibble of the life-history schedule by age.
#' @family tabulate
#' @family schedule
#' @export
#' @examples
#' ypr_tabulate_schedule(ypr_population())
ypr_tabulate_schedule <- function(object) {
  UseMethod("ypr_tabulate_schedule")
}

#' @describeIn ypr_tabulate_schedule Tabulate Schedule
#' @export
ypr_tabulate_schedule.ypr_population <- function(object) {
  population <- object
  chk_population(population)

  schedule <- math(population)

  as_tibble(schedule)
}

#' @describeIn ypr_tabulate_schedule Tabulate Schedule
#' @export
ypr_tabulate_schedule.ypr_ecotypes <- function(object) {

  chk::chk_s3_class(object, "ypr_ecotypes")

  weights <- attr(object, "weights")
  eco_names <- names(object)

  # need to loop and then add the weights and names
  schedule <- math(population)

  schedule <- as_tibble(schedule)



  yield[["Ecotype"]] <- eco_names
  yield[["Proportions"]] <- weights


}


math <- function(population) {

  schedule <- with(population, {
    t <- tR:tmax
    nt <- length(t)
    L <- length_at_age(population, t)
    W <- Wa * L^Wb
    E <- fa * W^fb
    if (Ls < 0) Ls <- length_at_age(population, -Ls)
    S <- exp(log(L / 1000) * Sp) / (exp(log(Ls / 1000) * Sp) +
                                      exp(log(L / 1000) * Sp)) * es
    N <- rep(n, nt)
    if (Ln < 0) Ln <- length_at_age(population, -Ln)
    N[L >= Ln] <- nL
    N <- 1 - ((1 - N) * (1 - S * Sm))
    if (Lv < 0) Lv <- length_at_age(population, -Lv)
    V <- exp(log(L / 1000) * Vp) / (exp(log(Lv / 1000) * Vp) +
                                      exp(log(L / 1000) * Vp))
    C <- pi * V
    R <- rep(1 - rho, nt)
    R[L < Llo | L > Lup] <- Nc
    U <- C * R + C * (1 - R) * Hm

    TotalMortality <- 1 - (1 - N) * (1 - U)
    Survivorship <- cumprod(1 - N)
    Survivorship <- c(1, Survivorship[-nt])
    FishedSurvivorship <- cumprod(1 - TotalMortality)
    FishedSurvivorship <- c(1, FishedSurvivorship[-nt])

    data.frame(
      Age = t, Length = L, Weight = W, Fecundity = E, Spawning = S,
      NaturalMortality = N, Vulnerability = V, Retention = R,
      FishingMortality = U, Survivorship = Survivorship,
      FishedSurvivorship = FishedSurvivorship
    )
  })

}







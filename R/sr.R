bh <- function(stock, alpha, beta) {
   alpha * stock / (1 + (beta * stock))
}

ri <- function(stock, alpha, beta) {
  alpha * stock * exp(-beta * stock)
}

sr <- function(schedule) {
  schedule <- as.list(schedule)
  schedule$BH <- attr(schedule, "BH")
  schedule$Rk <- attr(schedule, "Rk")
  schedule$R0 <- attr(schedule, "R0")

  with(schedule, {
    phi <- sum(Fecundity * Spawning * 0.5 * Survivorship)

    phiF <- sum(Fecundity * Spawning * 0.5 * FishedSurvivorship)

    alpha <-  Rk / phi

    if(BH) {
      beta <- (Rk - 1) / (R0 * phi)
      R0F <- (alpha * phiF - 1) / (beta * phiF)
    } else {
      beta <- log(Rk) / (R0 * phi)
      R0F <- log(alpha * phiF) / (beta * phiF)
    }
    c(alpha = alpha, beta = beta, phi = phi, phiF = phiF, R0F = R0F)
  })
}

#' Stock-Recruitment Parameters
#'
#' @inheritParams ypr_schedule
#' @return A named numeric vector of alpha, beta, phi (eggs at unfished equilibrium),
#' phiF (eggs at the fished equilibrium) and R0F (recruits at the fished equilibrium )
#' @export
#' @examples
#' ypr_sr(ypr_population()) # Beverton-Holt
#' ypr_sr(ypr_population(BH = 0L)) # Ricker
ypr_sr <- function(population) {
  check_population(population)

  schedule <- ypr_schedule(population)

  sr(schedule)
}

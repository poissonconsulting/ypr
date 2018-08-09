bh <- function(stock, alpha, beta) {
  unname(alpha * stock / (1 + (beta * stock)))
}

ri <- function(stock, alpha, beta) {
  unname(alpha * stock * exp(-beta * stock))
}

sr <- function(schedule) {
  schedule <- as.list(schedule)
  schedule$BH <- attr(schedule, "BH")
  schedule$Rk <- attr(schedule, "Rk")
  schedule$Rmax <- attr(schedule, "Rmax")

  R0 <- 1

  with(schedule, {
    phi <- sum(Fecundity * Spawning/2 * Survivorship)

    phiF <- sum(Fecundity * Spawning/2 * FishedSurvivorship)

    alpha <-  Rk / phi

    if(BH) {
      beta <- (alpha * phi - 1) / (R0 * phi)
      kappa <- alpha / beta
      R0F <- (alpha * phiF - 1) / (beta * phiF)
    } else {
      beta <- log(alpha * phi) / (R0 * phi)
      kappa <- alpha / (beta * exp(1))
      R0F <- log(alpha * phiF) / (beta * phiF)
    }
    beta <- beta * kappa / Rmax
    R0 <- R0 / kappa * Rmax
    R0F <- R0F / kappa * Rmax
    list(alpha = alpha, beta = beta, phi = phi, phiF = phiF, R0 = R0, R0F = R0F)
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

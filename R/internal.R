sanitize <- function(x) {
  x[is.nan(x)] <- 0
  x[x < 0] <- 0
  x
}

yield <- function(mu, population, Ly, harvest, biomass, check) {
  population$mu <- mu
  yield <- ypr_yield(population, Ly = Ly, harvest = harvest, biomass = biomass,
                     sanitize = FALSE, check = check)
}

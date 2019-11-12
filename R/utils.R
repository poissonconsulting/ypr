inst2inter <- function(x) {
  1 - exp(-x)
}

inter2inst <- function(x) {
  -log(1 - x)
}

length_at_age <- function(population, age) {
  with(population, {
    if(L2 < 0) L2 <- Linf * (1 - exp(-k * (-L2 - t0)))
    L <- Linf * (1 - exp(-k * (age - t0)))
    t2 <- -log(1 - min(L2/Linf, 1)) / k - t0
    L[age > t2] <- L2 + (Linf2 - L2) * (1 - exp(-k2 * (age[age > t2] - t2)))
    L[L < 0] <- 0
    L
  })
}

#' Length At Age
#'
#' @inheritParams params
#'
#' @return A double vector of the lengths.
#' @export
#'
#' @examples
#' ypr_length_at_age(ypr_population(), seq(0,5, by = 0.5))
ypr_length_at_age <- function(population, age) {
  chk_population(population)
  chk_numeric(age)
  chk_vector(age)

  length_at_age(population, age)
}

inst2inter <- function(x) {
  1 - exp(-x)
}

inter2inst <- function(x) {
  -log(1 - x)
}

length_at_age <- function(population, age) {
  with(population, {
    if (L2 < 0) L2 <- Linf * (1 - exp(-k * (-L2 - t0)))
    L <- Linf * (1 - exp(-k * (age - t0)))
    t2 <- -log(1 - min(L2 / Linf, 1)) / k + t0
    L[age > t2] <- L2 + (Linf2 - L2) * (1 - exp(-k2 * (age[age > t2] - t2)))
    L[L < 0] <- 0
    L
  })
}

age_at_length <- function(population, length) {
  with(population, {
    if (L2 < 0) L2 <- Linf * (1 - exp(-k * (-L2 - t0)))
    t <- -log(1 - pmin(length / Linf, 1)) / k + t0
    t2 <- -log(1 - pmin(L2 / Linf, 1)) / k + t0
    t[t > t2] <- -log(1 - pmin((length[t > t2] - L2) /
                                 (Linf2 - L2), 1)) /
      k2 + t2
    t
  })
}

is.ypr_population <- function(x) {
  inherits(x, "ypr_population")
}

set_par <- function(object, par, value) {
  if(is.ypr_population(object)) {
    object[[par]] <- value
  } else {
    for(i in seq_len(length(object))) {
      object[[i]] <- set_par(object[[i]], par, value = value)
    }
  }
  object
}

get_par <- function(object, par) {
  if(is.ypr_population(object)) {
    return(object[[par]])
  }
  unname(sapply(object, get_par, par))
}

#' Length At Age
#'
#' @inheritParams params
#' @return A double vector of the lengths.
#' @family calculate
#' @export
#' @examples
#' ypr_length_at_age(ypr_population(), seq(0, 5, by = 0.5))
ypr_length_at_age <- function(population, age) {
  check_population(population)
  chk_numeric(age)
  chk_vector(age)
  chk_gte(age)

  length_at_age(population, age)
}

#' Age At Length
#'
#' @inheritParams params
#' @return A double vector of the lengths.
#' @family calculate
#' @export
#' @examples
#' ypr_age_at_length(ypr_population(), seq(0, 100, by = 10))
ypr_age_at_length <- function(population, length) {
  check_population(population)
  chk_numeric(length)
  chk_vector(length)
  chk_gte(length)

  age_at_length(population, length)
}

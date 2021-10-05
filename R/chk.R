chk_population <- function(x, x_name = NULL) {
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_string(x_name, x_name = "x_name")

  chk_s3_class(x, "ypr_population", x_name = x_name)
  chk_named(x, x_name = x_name)
  chk_unique(names(x), x_name = x_name)
  chk_superset(names(x), .parameters$Parameter, x_name = x_name)

  do.call("chk_parameters", x)
  x
}

chk_populations <- function(x, x_name = NULL) {
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))

  chk_list(x, x_name = x_name)

  x_name <- paste("elements of", x_name)

  chk_s3_class(x, "ypr_populations")

  chk_all(x, chk_population, x_name = x_name)

  x
}

chk_ecotypes <- function(x) {
  check_same(x, "BH")
  check_same(x, "Rk")
  check_same(x, "tR")
  check_same(x, "Rmax")
  check_same(x, "pi")
  check_same(x, "Llo")
  check_same(x, "Lup")
  check_same(x, "rho")
  check_same(x, "q")
}

check_same <- function(populations, parameter) {
  param_list <- numeric(length(populations))
  for (i in seq_len(length(populations))) {
    val <- populations[[i]][[parameter]]
    param_list[i] <- val
  }
  if (length(unique(param_list)) != 1) {
    chk::abort_chk(parameter, " must be the same across all ecotypes")
  }
}

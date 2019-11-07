chk_population <- function(x, x_name = NULL) {
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_string(x_name, x_name = "x_name")

  chk_s3_class(x, "ypr_population", x_name = x_name)
  chk_named(x, x_name = x_name)
  chk_unique(names(x), x_name = x_name)
  chk_superset(names(x), .parameters$Parameter, x_name = x_name)

  parameters <- .parameters

  # need to check class
  parameters$Code <- paste0(
    "chk_scalar(", parameters$Parameter, ");",
    "chk_s3_class(", parameters$Parameter, ",'",
    ifelse(parameters$Integer == 1, "integer", "numeric"),"');",
    "chk_not_any_na(", parameters$Parameter, ");",
    "chk_range(", parameters$Parameter, ", c(",
    parameters$Lower, ifelse(parameters$Integer == 1, "L", ""), ",",
    parameters$Upper, ifelse(parameters$Integer == 1, "L", ""), "))")

  code <- paste0(parameters$Code, collapse = "\n")
  code <- paste0("with(x, {\n", code, "\n})")

  eval(parse(text = code))

  x
}

chk_populations <- function(x, x_name = NULL) {
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))

  chk_list(x, x_name = x_name)
  chk_named(x, x_name = x_name)
  chk_unique(names(x), x_name = x_name)

  x_name <- paste("elements of", x_name)

  chk_s3_class(x, "ypr_populations")

  chk_all(x, chk_population, x_name = x_name)

  x
}

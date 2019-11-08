library(ypr)

parameter <- ypr:::.parameters$Parameter
integer <- ypr:::.parameters$Integer == 1

body <- paste0("chk_s3_class(", parameter, ",'",
  ifelse(integer, "integer", "numeric"), "')\n",
  "chk_scalar(", parameter, ")\n",
  "chk_not_any_na(", parameter, ")\n",
  "chk_range(", parameter, ", c(",
  ypr:::.parameters$Lower, ifelse(integer, "L", ""), ",",
  ypr:::.parameters$Upper, ifelse(integer, "L", ""), "))",
  collapse = "\n")

args <- paste0("chk_parameters <- function(",
  chk::cc(ypr:::.parameters$Parameter, ellipsis = Inf, brac = ""),
  ") {\n")

code <- paste0(args, body, "\n}")

writeLines(code, "R/chk-parameters.R")

transformers <- styler::tidyverse_style(strict = FALSE)
transformers$space$add_space_after_for_if_while <- NULL
styler::style_file("R/chk-parameters.R", transformers = transformers, filetype = c("R", "Rprofile", "Rmd"))


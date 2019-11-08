library(ypr)

args <- "chk_parameters <- function("
args <- paste0(args, chk::cc(ypr:::.parameters$Parameter, ellipsis = Inf, brac = ""))
args <- paste0(args, ") {")

body <- paste0("chk_s3_class(", ypr:::.parameters$Parameter, ",'",
  ifelse(ypr:::.parameters$Integer == 1, "integer", "numeric"), "')\n",
  "chk_scalar(", ypr:::.parameters$Parameter, ")\n",
  "chk_not_any_na(", ypr:::.parameters$Parameter, ")\n",
  "chk_range(", ypr:::.parameters$Parameter, ", c(",
  ypr:::.parameters$Lower, ifelse(ypr:::.parameters$Integer == 1, "L", ""), ",",
  ypr:::.parameters$Upper, ifelse(ypr:::.parameters$Integer == 1, "L", ""), "))")

body <- paste0(body, collapse = "\n")

code <- paste0(args, body, "\n}")

cat(code)

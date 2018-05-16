check_population <- function(x, exclusive = FALSE, order = FALSE, x_name = substitute(x)) {
  x_name <- deparse(x_name)

  check_named(x, x_name = x_name)
  check_names(x,
              c("tmax", "k", "Linf", "t0", "b", "Lm", "fb", "Rt",
                "nu", "Lv", "Llo", "Lup", "mu", "rho", "eta", "Rk"),
              exclusive = exclusive, order = order, unique = TRUE, x_name = x_name)


  with(x, {
    check_scalar(tmax, c(1L, .tmax))
    check_scalar(k, c(0, 10))
    check_scalar(Linf, c(0, .Lmax))
    check_scalar(t0, c(-tmax/2, tmax/2))
    check_scalar(b, c(2, 4))
    check_scalar(Lm, c(0, .Lmax))
    check_scalar(fb, c(0.5, 2))
    check_scalar(Rt, c(0L, tmax - 1L))
    check_probability(nu)
    check_scalar(Lv, c(0, Linf))
    check_scalar(Lup, c(0, Linf))
    check_scalar(Llo, c(0, Lup))
    check_probability(mu)
    check_probability(rho)
    check_probability(eta)
    check_scalar(Rk, c(1, 10))
  })

  x
}

check_schedule <- function(x, complete = FALSE, exclusive = FALSE, order = FALSE, x_name = substitute(x)) {
  x_name <- deparse(x_name)

  if(complete) {
    values <- list(Age = c(1L, .tmax),
         Length = c(0, .Lmax),
         Weight = c(0, .Machine$double.xmax),
         Fecundity = c(0, .Machine$double.xmax),
         NaturalMortality = c(0, 1),
         Capture = c(0, 1),
         Release = c(0, 1),
         FishingMortality = c(0, 1),
         Productivity = c(1, 10),
         TotalMortality = c(0, 1),
         Survivorship = c(0, 1),
         FishedSurvivorship = c(0, 1))
  } else {
    values <- list(Age = c(1L, .tmax),
         Length = c(0, .Lmax),
         Weight = c(0, .Machine$double.xmax),
         Fecundity = c(0, .Machine$double.xmax),
         NaturalMortality = c(0, 1),
         Capture = c(0, 1),
         Release = c(0, 1),
         FishingMortality = c(0, 1),
         Productivity = c(1, 10))
  }

  check_data(x,
             values = values,
             nrow = TRUE,
             exclusive = exclusive,
             order = order,
             x_name = x_name)

  if(any(diff(x$Age) != 1L))
    stop("Ages in schedule ", x_name, " must be consecutive", call. = FALSE)

  if(any(x$Productivity != x$Productivity[1]))
    stop("Productivity in schedule ", x_name, " must be constant", call. = FALSE)

  x
}

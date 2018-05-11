check_schedule <- function(x, exclusive = FALSE, order = FALSE, x_name = substitute(x), error = TRUE) {
  x_name <- deparse(x_name)
  check_data(x,
             values = list(Age = c(1L, .tmax),
                           Length = c(0, .Lmax),
                           Weight = c(0, .Wmax),
                           Fecundity = c(0, .Emax),
                           NaturalMortality = c(0, 1),
                           Capture = c(0, 1),
                           Release = c(0, 1),
                           FishingMortality = c(0, 1)),
             nrow = c(1L, .tmax),
             exclusive = exclusive,
             order = order,
             x_name = x_name, error = error)

  if(any(diff(x$Age) != 1))
    stop("Ages in ", x_name, " must be consecutive", call. = FALSE)

  x
}

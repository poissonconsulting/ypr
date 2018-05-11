#' @export
plot.ypr_population <- function(x, ...) {
  check_population(x)
  schedule <- ypr_schedule(population = x)

  with(schedule, {
    plot(Length ~ Age, xlim = c(0, max(Age)), ylim = c(0, max(Length)),
         type = "l")
    plot(Weight ~ Length, xlim = c(0, max(Length)), ylim = c(0, max(Weight)),
         type = "l")
    plot(Fecundity ~ Weight, xlim = c(0, max(Weight)), ylim = c(0, max(Fecundity)),
         type = "l")
    plot(NaturalMortality ~ Length, xlim = c(0, max(Length)), ylim = c(0,1),
         type = "l")
    plot(FishingMortality ~ Length, xlim = c(0, max(Length)), ylim = c(0,1),
         type = "l")
  })
  invisible(x)
}

ypr_plot <- function(population = ypr_population()) {
}


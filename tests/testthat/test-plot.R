context("plot")

test_that("ypr_plot_schedule", {
  gp <- ypr_plot_schedule(ypr_population())
  expect_is(gp, "gg")
})

test_that("ypr_plot_yield", {
  gp <- ypr_plot_histogram(ypr_population(Rmax = 1000), y = "Fishing", binwidth = 1)
  expect_is(gp, "gg")
})

test_that("ypr_plot_yield", {
  gp <- ypr_plot_yield(ypr_population(Rk = 10), y = "YPUE",  pi = seq(0, 1, length.out = 10))
  expect_is(gp, "gg")
})

test_that("ypr_plot_sr", {
  gp <- ypr_plot_sr(ypr_population())
  expect_is(gp, "gg")
})

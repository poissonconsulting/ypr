context("plot")

test_that("ypr_plot_schedule", {
  gp <- ypr_plot_schedule(ypr_population())
  expect_is(gp, "gg")
})

test_that("ypr_plot_yield", {
  gp <- ypr_plot_yield(ypr_population())
  expect_is(gp, "gg")
})

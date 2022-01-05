test_that("ypr_plot_schedule population", {
  gp <- ypr_plot_schedule(ypr_population())
  expect_snapshot_plot(gp, "ypr_plot_schedule")
})

test_that("ypr_plot_schedule ecotypes 1", {
  gp <- ypr_plot_schedule(ypr_ecotypes())
  expect_snapshot_plot(gp, "ypr_plot_schedule1")
})

test_that("ypr_plot_schedule ecotypes 2", {
  gp <- ypr_plot_schedule(ypr_ecotypes(Linf = c(200, 800), k = c(0.2, 0.1), names = c("fast", "slow")))
  expect_snapshot_plot(gp, "ypr_plot_schedule2")
})

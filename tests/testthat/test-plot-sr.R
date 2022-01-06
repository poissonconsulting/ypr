test_that("ypr_plot_sr", {
  gp <- ypr_plot_sr(ypr_population())
  expect_snapshot_plot(gp, "ypr_plot_sr")
})

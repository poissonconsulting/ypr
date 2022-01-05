test_that("plot population", {
  pdf(tempfile())
  withr::defer(dev.off())
  expect_silent(plot(ypr_population()))
})

test_that("ypr_plot_fish", {
  gp <- ypr_plot_fish(ypr_population(Rmax = 1000), y = "Caught", binwidth = 1L)
  expect_snapshot_plot(gp, "ypr_plot_fish")
})

test_that("ypr_plot_biomass", {
  gp <- ypr_plot_biomass(ypr_population())
  expect_snapshot_plot(gp, "ypr_plot_biomass")
})

test_that("ypr_plot_yield", {
  gp <- ypr_plot_yield(ypr_population(Rk = 10), y = "YPUE", pi = seq(0, 1, length.out = 10))
  expect_warning(expect_snapshot_plot(gp, "ypr_plot_yield"))
})

test_that("ypr_plot_yield2", {
  gp <- ypr_plot_yield(ypr_populations(Rk = c(2.5, 4.6), Llo = c(0, 60)),
    pi = seq(0, 1, length.out = 2), plot_values = FALSE
  ) +
    ggplot2::facet_wrap(~Llo) +
    ggplot2::aes_string(group = "Rk", color = "Rk") +
    ggplot2::scale_color_manual(values = c("black", "blue"))

  expect_snapshot_plot(gp, "ypr_plot_yield2")
})

test_that("ypr_plot_sr", {
  gp <- ypr_plot_sr(ypr_population())
  expect_snapshot_plot(gp, "ypr_plot_sr")
})

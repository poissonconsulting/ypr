context("plot")

test_that("ypr_ggplot2", {
  gp <- ypr_ggplot2(ypr_population())
  expect_is(gp, "gg")
})

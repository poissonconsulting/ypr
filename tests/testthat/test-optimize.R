context("optimize")

test_that("optimize", {
  expect_equal(ypr_optimize(), 0.04296278, tolerance = 1e-08)
  expect_identical(ypr_optimise, ypr_optimize)
})

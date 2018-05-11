context("optimize")

test_that("optimize", {
  expect_equal(ypr_optimize(ypr_population()), 0.0991969, tolerance = 1e-08)
  expect_identical(ypr_optimise, ypr_optimize)
})

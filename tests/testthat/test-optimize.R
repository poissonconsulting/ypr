context("optimize")

test_that("optimize", {
  expect_equal(ypr_optimize(ypr_population()), 0.08588063, tolerance = 1e-06)
  expect_identical(ypr_optimise, ypr_optimize)
})

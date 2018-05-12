context("yield")

test_that("yield", {
  expect_equal(ypr_yield(ypr_population()), 75.80249, tolerance = 1e-06)
})

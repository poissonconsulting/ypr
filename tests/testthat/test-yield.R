context("yield")

test_that("yield", {
  expect_equal(ypr_yield(ypr_population()), 0.042961, tolerance = 1e-08)
})

context("yield")

test_that("yield", {
  expect_equal(ypr_yield(ypr_population()), 0.5841969, tolerance = 1e-06)
  expect_equal(ypr_yield(ypr_schedule(ypr_population(), complete = TRUE)),
               ypr_yield(ypr_population()), tolerance = 1e-06)
  expect_equal(ypr_yield(ypr_population(R0 = 1000)), 0.5841969, tolerance = 1e-06)
})

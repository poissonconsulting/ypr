context("yield")

test_that("yield", {
  expect_equal(ypr_yield(ypr_population()), 0.6211422, tolerance = 1e-06)
  expect_equal(ypr_yield(ypr_schedule(ypr_population(), complete = TRUE)),
               ypr_yield(ypr_population()), tolerance = 1e-06)
})

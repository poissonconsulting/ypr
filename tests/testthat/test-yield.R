context("yield")

test_that("yield", {
  expect_equal(ypr_yield(ypr_population()), 0.052582, tolerance = 1e-06)
  expect_equal(ypr_yield(ypr_schedule(ypr_population(), complete = TRUE)),
               ypr_yield(ypr_population()), tolerance = 1e-06)
  expect_equal(ypr_yield(ypr_population(R0 = 1000)), 52.582, tolerance = 1e-03)
  expect_equal(ypr_yield(ypr_population(), biomass = TRUE),  0.1965734, tolerance = 1e-06)
})

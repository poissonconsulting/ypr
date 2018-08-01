context("yield")

test_that("yield", {
  expect_equal(ypr_yield(ypr_population()), 0.05240065, tolerance = 1e-06)
  expect_equal(ypr_yield(ypr_population(R0 = 1000)), 52.40065, tolerance = 1e-03)
  expect_equal(ypr_yield(ypr_population(), biomass = TRUE),  13.88418, tolerance = 1e-06)
})

context("yield")

test_that("yield", {
  expect_equal(ypr_yield(ypr_population()), 0.03493376, tolerance = 1e-06)
  expect_equal(ypr_yield(ypr_population(Rmax = 1000)), 34.93376, tolerance = 1e-03)
  expect_equal(ypr_yield(ypr_population(BH = 0L)), 0.08827256, tolerance = 1e-03)
  expect_equal(ypr_yield(ypr_population(Rmax = 1000, BH = 0L)), 88.27256, tolerance = 1e-03)
  expect_equal(ypr_yield(ypr_population(), biomass = TRUE), 9.256122, tolerance = 1e-06)
  expect_equal(ypr_yield(ypr_population(), biomass = TRUE, Ly = 70), 3.25123, tolerance = 1e-06)
})

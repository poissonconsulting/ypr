context("yield-uncertainty")

test_that("ypr_yield_uncertainty", {
  population <- ypr_population()
  population$Rk <- 10
  yield <- ypr_yield_uncertainty(population, ypr_population())

  expect_identical(length(yield), 3L)
  expect_identical(names(yield), c("estimate", "lower", "upper"))
  expect_equivalent(yield[1], c(estimate = 0.7557548), tolerance = 1e-02)
  expect_equivalent(yield[2], c(estimate = 0.6315903), tolerance = 1e-02)
})

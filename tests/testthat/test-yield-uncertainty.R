context("yield-uncertainty")

test_that("ypr_yield_uncertainty", {
  population <- ypr_population()
  population$Rk <- 10
  yield <- ypr_yield_uncertainty(population, ypr_population(), 3)

  expect_identical(length(yield), 3L)
  expect_identical(names(yield), c("estimate", "lower", "upper"))
})

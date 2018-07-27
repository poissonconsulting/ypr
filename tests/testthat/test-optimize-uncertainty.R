context("optimize-uncertainty")

test_that("optimize_uncertainty", {
  population <- ypr_population()
  population$Rk <- 5.1
  mu <- ypr_optimize_uncertainty(population, ypr_population(), n = 10)
  expect_identical(length(mu), 3L)
  expect_identical(names(mu), c("estimate", "lower", "upper"))
  expect_equivalent(mu[2], c(estimate = 0.137424), tolerance = 1e-02)
})

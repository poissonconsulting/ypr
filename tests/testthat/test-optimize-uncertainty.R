context("optimize-uncertainty")

test_that("optimize_uncertainty", {
  population <- ypr_population()
  population$Rk <- 5.1
  pi <- ypr_optimize_uncertainty(population, ypr_population(), n = 10)
  expect_identical(length(pi), 3L)
  expect_identical(names(pi), c("estimate", "lower", "upper"))
  expect_equivalent(pi[2], c(estimate = 0.09196994), tolerance = 1e-02)
})

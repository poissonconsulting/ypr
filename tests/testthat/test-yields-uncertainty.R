context("yields-uncertainty")

test_that("ypr_yields_uncertainty", {
  population <- ypr_population()
  population$Rk <- 10
  yields <- ypr_yields_uncertainty(population, ypr_population(), n = 10)

  expect_identical(colnames(yields), c("estimate", "lower", "upper"))
  expect_identical(nrow(yields), 100L)
})

context("population")

test_that("population", {

  population <- ypr_population()
  expect_identical(check_population(population, exclusive = TRUE, order = TRUE), population)
})

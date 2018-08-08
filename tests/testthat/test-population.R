context("population")

test_that("population", {
  population <- ypr_population()
  expect_identical(check_population(population), population)
  population2 <- ypr_population()
  population2$Rk <- 2.5
  expect_identical(ypr_population_update(population, Rk = 2.5), population2)
  expect_error(ypr_population_update(population, Rk = 0), "the values in Rk must lie between 2 and 3")
  expect_is(ypr_population_update(population, pi = 0.23456), "ypr_population")

  ypr_population_update(population, M = 0.2, Mb = -0.75)

})

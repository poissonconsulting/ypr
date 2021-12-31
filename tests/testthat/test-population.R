test_that("population", {
  population <- ypr_population()
  expect_identical(check_population(population), population)
  population2 <- ypr_population()
  population2$Rk <- 2.5
  expect_identical(ypr_population_update(population, Rk = 2.5), population2)
  expect_error(
    ypr_population_update(
      population,
      Rk = 0.5
    ),
    "^`Rk` must be between 1 and 100, not 0.5[.]$",
    class = "chk_error"
  )
  expect_s3_class(
    ypr_population_update(population, pi = 0.23456),
    "ypr_population"
  )

  ypr_population_update(population, n = ypr:::inst2inter(0.2), nL = 0.3)
})

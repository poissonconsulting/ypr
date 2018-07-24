context("sample")

test_that("sample", {
  population <- ypr_population()
  population2 <- population
  population2$Rk <- 10
  sample <- sample_population(population, population2)
  expect_identical(length(sample), 1L)
  expect_identical(check_population(sample[[1]], exclusive = TRUE, order = TRUE), sample[[1]])

  sample2 <- sample_population(population, population2, 2)
  expect_identical(length(sample2), 2L)
  expect_identical(check_population(sample2[[2]], exclusive = TRUE, order = TRUE), sample2[[2]])
})

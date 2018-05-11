context("plot")

test_that("plot", {
  population <- ypr_population()
  expect_identical(plot(population), population)
})

context("weight")

test_that("weight", {
  expect_identical(weight(c(0,10,100), 1e-05, 3), c(0, 0.01, 10))
})

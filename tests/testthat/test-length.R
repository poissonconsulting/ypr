context("length")

test_that("length", {
  expect_equal(ypr_length(c(0,1,10), k = 1, Linf = 100), c(0.00000, 63.21206, 99.99546),
               tolerance = 0.0000001)
})

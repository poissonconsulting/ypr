context("growth")

test_that("growth", {
  expect_equal(growth(c(0,1,10), k = 1, Linf = 100, t0 = 0), c(0.00000, 63.21206, 99.99546),
               tolerance = 0.0000001)
})

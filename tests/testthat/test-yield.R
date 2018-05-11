context("yield")

test_that("yield", {
  expect_equal(ypr_yield(ypr_schedule()), 0.042961, tolerance = 1e-08)
})

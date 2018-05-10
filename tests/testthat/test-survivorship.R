context("survivorship")

test_that("survivorship", {
  expect_equal(ypr_survivorship(c(0,1,11), 0.2), c(1.25, 1.0000000, 0.1073742),
               tolerance = 0.0000001)
})

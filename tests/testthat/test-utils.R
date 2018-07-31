context("utils")

test_that("quantiles", {
  quantiles <- quantiles(1:10, 0.95)
  expect_identical(names(quantiles), c("estimate", "lower", "upper"))
  expect_equal(quantiles, c(5.5, 1.225, 9.775), check.attributes = FALSE)
  expect_equal(ypr_instant2interval(ypr_interval2instant(0.5)), 0.5)
})

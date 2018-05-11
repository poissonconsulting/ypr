context("yields")

test_that("yields", {
  yields <- ypr_yields(ypr_population())
  expect_equal(checkr::check_vector(yields, c(0,1,NA), length = 30), yields)
})

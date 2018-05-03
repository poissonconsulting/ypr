context("fecundity")

test_that("fecundity", {
  expect_identical(ypr_fecundity(c(0,49,50,100), 50, 1e-05, 3),
                   c(0.00,  0.00,  1.25, 10.00))
})

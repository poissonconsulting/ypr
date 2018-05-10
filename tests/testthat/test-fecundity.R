context("fecundity")

test_that("fecundity", {
  expect_identical(ypr_fecundity(c(0,49,50,100), Lm = 50, fa = 1),
                   c(0, 0, 1.25, 10))
})

context("check")

test_that("check_ecotypes", {
  ecotypes <- ypr_ecotypes(Ls = c(50, 60))
  expect_identical(check_ecotypes(ecotypes), ecotypes)
})

test_that("check_ecotypes error", {
  ecotypes <- ypr_ecotypes(Linf = c(50, 60))
  expect_error(check_ecotypes(ecotypes),
               "the following 1 parameter must be identical: 'Lup'")
})

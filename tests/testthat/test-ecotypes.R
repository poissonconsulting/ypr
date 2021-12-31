test_that("ypr_ecotypes works", {
  ecotypes <- ypr_ecotypes()
  expect_s3_class(ecotypes, "ypr_ecotypes")
  expect_length(ecotypes, 1L)
  expect_snapshot_output(ecotypes)
})

test_that("ypr_ecotypes creates an ecotype with 2 elements", {
  ecotypes <- ypr_ecotypes(Linf = c(1, 2))
  expect_s3_class(ecotypes, "ypr_ecotypes")
  expect_length(ecotypes, 2L)
  expect_snapshot_output(ecotypes)
})

test_that("ypr_ecotypes creates an ecotype when 2 parameters are provided", {
  ecotypes <- ypr_ecotypes(Linf = c(1, 2), RPR = c(1, 1))
  expect_s3_class(ecotypes, "ypr_ecotypes")
  expect_length(ecotypes, 2L)
  expect_snapshot_output(ecotypes)
})

test_that("ypr_ecotypes creates an ecotype when 3 parameters are provided", {
  ecotypes <- ypr_ecotypes(Linf = c(1, 2), k2 = c(0.15, 0.25), RPR = c(2, 1))
  expect_s3_class(ecotypes, "ypr_ecotypes")
  expect_length(ecotypes, 2L)
  expect_snapshot_output(ecotypes)
})

test_that("ypr_ecotypes provides correct weights", {
  ecotypes <- ypr_ecotypes(Linf = c(1, 2), RPR = c(1, 3.5))
  proportions <- attr(ecotypes, "proportions")
  expect_equal(ecotypes[[1]]$RPR, 1)
  expect_equal(ecotypes[[2]]$RPR, 3.5)
})

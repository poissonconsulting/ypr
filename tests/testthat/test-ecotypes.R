
test_that("ypr_ecotypes creates an ecotype", {
  ecotypes <- ypr_ecotypes(Linf = c(1, 2), RPR = c(1, 1))
  expect_s3_class(ecotypes, "ypr_ecotypes")
  expect_length(ecotypes, 2L)
  expect_snapshot_output(ecotypes)
})

test_that("ypr_ecotypes creates an ecotype when 1 parameter is provided", {
  ecotypes <- ypr_ecotypes(Linf = c(1, 2), RPR = c(1, 1))
  expect_s3_class(ecotypes, "ypr_ecotypes")
  expect_length(ecotypes, 2L)
  expect_snapshot_output(ecotypes)
})

test_that("ypr_ecotypes creates an ecotype when 2 parameters is provided", {
  ecotypes <- ypr_ecotypes(Linf = c(1, 2), k2 = c(0.15, 0.25), RPR = c(1, 1))
  expect_s3_class(ecotypes, "ypr_ecotypes")
  expect_length(ecotypes, 2L)
  expect_snapshot_output(ecotypes)
})

test_that("ypr_ecotypes does not error when no weights provided", {
  ecotypes <- ypr_ecotypes(Linf = c(1, 2))
  expect_length(ecotypes, 2L)
  expect_snapshot_output(ecotypes)
})

test_that("ypr_ecotypes provides correct weights", {
  ecotypes <- ypr_ecotypes(Linf = c(1, 2), RPR = c(1, 1))
  proportions <- attr(ecotypes, "proportions")
  expect_equal(ecotypes[[1]]$RPR, 1)
  expect_equal(ecotypes[[2]]$RPR, 1)
})

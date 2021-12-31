test_that("ecotype converts data.frame", {
  expect_identical(as_ypr_ecotypes(as.data.frame(ypr_ecotypes())), ypr_ecotypes())
})

test_that("ecotype converts population", {
  expect_identical(as_ypr_ecotypes(ypr_population()), ypr_ecotypes())
})

test_that("ecotype converts ecotypes", {
  expect_identical(as_ypr_ecotypes(ypr_ecotypes()), ypr_ecotypes())
})

test_that("outputs preserves RPR", {
  populations <- ypr_populations(Linf = c(100, 1000), RPR = c(1, 1/2), expand = FALSE)
  expect_identical(populations[[1]]$RPR, 1)
  expect_identical(populations[[2]]$RPR, 1/2)

  ecotypes <- as_ypr_ecotypes(populations)
  expect_identical(ecotypes[[1]]$RPR, 1)
  expect_identical(ecotypes[[2]]$RPR, 1/2)
})

test_that("ecotypes default names are used", {
  populations <- ypr_populations(Linf = c(100, 1000))
  ecotypes <- as_ypr_ecotypes(populations)
  expect_named(ecotypes, c("Linf_100", "Linf_1000"))
})

test_that("ecotypes will throw error if sr values are not the same", {
  expect_error(
    as_ypr_ecotypes(ypr_populations(Rk = c(10, 20))),
    "Rk must be the same across all elements."
  )

  expect_error(
    as_ypr_ecotypes(ypr_populations(pi = c(0.1, 0.2))),
    "Pi must be the same across all elements."
  )

  expect_error(
    as_ypr_ecotypes(ypr_populations(BH = c(1L, 0L))),
    "BH must be the same across all elements."
  )
})

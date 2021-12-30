test_that("ecotype now converts population", {
  expect_s3_class(as_ypr_ecotypes(ypr_population()), "ypr_ecotypes")
})

test_that("outputs proper weight proportions when all the same", {
  populations <- ypr_populations(Linf = c(100, 1000), RPR = c(1,1))
  expect_identical(populations[[1]]$RPR, 1)
  expect_identical(populations[[2]]$RPR, 1)

  ecotypes <- as_ypr_ecotypes(populations)
  expect_identical(ecotypes[[1]]$RPR, 1/2)
  expect_identical(ecotypes[[2]]$RPR, 1/2)
})


test_that("outputs proper weight proportions when not all the same", {
  populations <- ypr_populations(Linf = c(100, 1000), RPR = c(1, 1/2), expand = FALSE)
  expect_identical(populations[[1]]$RPR, 1)
  expect_identical(populations[[2]]$RPR, 1/2)

  ecotypes <- as_ypr_ecotypes(populations)
  expect_identical(ecotypes[[1]]$RPR, 2/3)
  expect_identical(ecotypes[[2]]$RPR, 1/3)
})

test_that("ecotypes names can be null and default names are used", {
  populations <- ypr_populations(Linf = c(100, 1000))
  ecotypes <- as_ypr_ecotypes(populations)
  expect_named(ecotypes, c("Linf_100", "Linf_1000"))
})

test_that("ecotypes names are provided and output as the names", {
  populations <- ypr_populations(Linf = c(100, 1000))
  ecotypes <- as_ypr_ecotypes(populations, names = c("small", "big"))
  expect_named(ecotypes, c("small", "big"))
})

test_that("ecotypes names fail as too many passed", {
  expect_error(
    as_ypr_ecotypes(ypr_populations(Linf = c(100, 1000)), names = c("small", "big", "bigger")),
    'Length of populations and names do not match. 2 != 3.'
  )
})

test_that("ecotypes names fail as not enough are passed", {
  expect_error(
    as_ypr_ecotypes(ypr_populations(Linf = c(100, 1000)),  c("small")),
    'Length of populations and names do not match. 2 != 1.'
  )
})

test_that("ecotypes will throw error if sr values are not the same", {
  expect_error(
    as_ypr_ecotypes(ypr_populations(Rk = c(10, 20))),
    "Rk must be the same across all ecotypes."
  )

  expect_error(
    as_ypr_ecotypes(ypr_populations(pi = c(0.1, 0.2))),
    "Pi must be the same across all ecotypes."
  )

  expect_error(
    as_ypr_ecotypes(ypr_populations(BH = c(1L, 0L))),
    "BH must be the same across all ecotypes."
  )
})

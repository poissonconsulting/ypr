test_that("ecotype erros with a population", {
  population <- adams_bt_03
  expect_error(
    as_ypr_ecotypes(population, 1),
    "`populations` must inherit from S3 class 'ypr_populations'."
  )
})

test_that("ecotype erros with a list", {
  population <- list(tmax = 20L, k = 0.15, Linf = 100, t0 = 0, k2 = 0.15)
  expect_error(
    as_ypr_ecotypes(population, 1),
    "`populations` must inherit from S3 class 'ypr_populations'."
  )
})

test_that("ecotype errors when incorrect weight parameters given", {
  expect_error(
    as_ypr_ecotypes(weights = c("a", "b")),
    "`weights` must be numeric."
  )
})

test_that("ecotype errors when NA weight parameters given", {
  expect_error(
    as_ypr_ecotypes(weights = c(1, 2, NA)),
    "`weights` must not have any missing values."
  )
})

test_that("ecotype errors correct NA type given as weights", {
  expect_error(
    as_ypr_ecotypes(weights = NA_integer_),
    "`weights` must not have any missing values."
  )
})

test_that("ecotype errors nothing given as weights", {
  populations <- ypr_populations(Linf = c(100, 1000))
  expect_error(
    as_ypr_ecotypes(populations, weights = numeric(0)),
    "Length of populations and numeric\\(0\\) do not match. 2 != 0."
  )
})

test_that("ecotype errors when 0's weight parameters given", {
  populations <- ypr_populations(Linf = c(100, 1000))
  expect_error(
    as_ypr_ecotypes(populations, c(1, 2, 0)),
    "`weights` must have values greater than 0."
  )
})

test_that("ecotype errors when lengths of populations and weights don't match", {
  populations <- ypr_populations(Linf = c(100, 1000))
  weights <- c(1, 2, 3)
  expect_error(
    as_ypr_ecotypes(populations, weights),
    "Length of populations and weights do not match. 2 != 3."
  )
})

test_that("outputs ecotype class object", {
  populations <- ypr_populations(Linf = c(100, 1000))
  weights <- c(1, 1)
  ecotype <- as_ypr_ecotypes(populations, weights)
  expect_s3_class(ecotype, "ypr_ecotypes")
})

test_that("outputs proper wieght proportions when all the same", {
  populations <- ypr_populations(Linf = c(100, 1000))
  weights <- c(1, 1)
  ecotype <- as_ypr_ecotypes(populations, weights)
  expect_equal(
    attr(ecotype, "proportions"),
    c(0.5, 0.5)
  )
})

test_that("outputs proper wieght proportions when not all even", {
  populations <- ypr_populations(Linf = c(100, 1000, 10, 200))
  weights <- c(3, 1, 2, 1)
  ecotype <- as_ypr_ecotypes(populations, weights)
  expect_equal(
    attr(ecotype, "proportions"),
    c(0.4286, 0.1429, 0.2857, 0.1429),
    tolerance = 0.001
  )
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
  populations <- ypr_populations(Linf = c(100, 1000))
  expect_error(
    as_ypr_ecotypes(populations, names = c("small", "big", "bigger")),
    'Length of populations and c\\("small", "big", "bigger"\\) do not match. 2 != 3.'
  )
})

test_that("ecotypes names fail as not enough are passed", {
  populations <- ypr_populations(Linf = c(100, 1000))
  expect_error(
    as_ypr_ecotypes(populations,  c(1, 2), c("small")),
    'Length of populations and c\\("small"\\) do not match. 2 != 1.'
  )
})

test_that("ecotypes will throw error if constant values are not the same", {
  expect_error(
    as_ypr_ecotypes(ypr_populations(Rk = c(10, 20))),
    "Rk must be the same across all ecotypes."
  )

  expect_error(
    as_ypr_ecotypes(ypr_populations(pi = c(0.1, 0.2))),
    "Pi must be the same across all ecotypes."
  )
})

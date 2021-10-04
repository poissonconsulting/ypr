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
  populations <- chilliwack_bt_05
  expect_error(
    as_ypr_ecotypes(populations, c("a", "b", "c")),
    "`weights` must be numeric."
  )
})

test_that("ecotype errors when NA weight parameters given", {
  populations <- chilliwack_bt_05
  expect_error(
    as_ypr_ecotypes(populations, c(1, 2, NA)),
    "`weights` must not have any missing values."
  )
})

test_that("ecotype errors correct NA type given as weights", {
  populations <- chilliwack_bt_05
  expect_error(
    as_ypr_ecotypes(populations, NA_integer_),
    "`weights` must not have any missing values."
  )
})

test_that("ecotype errors nothing given as weights", {
  populations <- chilliwack_bt_05
  expect_error(
    as_ypr_ecotypes(populations, numeric(0)),
    "Length of populations and numeric\\(0\\) do not match. 12 != 0."
  )
})

test_that("ecotype errors when 0's weight parameters given", {
  populations <- chilliwack_bt_05
  expect_error(
    as_ypr_ecotypes(populations, c(1, 2, 0)),
    "`weights` must have values greater than 0."
  )
})

test_that("ecotype errors when lengths of populations and weights don't match", {
  populations <- chilliwack_bt_05
  weights <- c(1, 2, 3)
  expect_error(
    as_ypr_ecotypes(populations, weights),
    "Length of populations and weights do not match. 12 != 3."
  )
})

test_that("outputs ecotype class object", {
  populations <- chilliwack_bt_05
  weights <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
  ecotype <- as_ypr_ecotypes(populations, weights)
  expect_s3_class(ecotype, "ypr_ecotype")
  expect_equal(
    attr(ecotype, "weights"),
    rep(0.08333333, 12),
    tolerance = 0.0001
  )
})

test_that("outputs proper wieght proportions when all the same", {
  populations <- chilliwack_bt_05
  weights <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
  ecotype <- as_ypr_ecotypes(populations, weights)
  expect_equal(
    attr(ecotype, "weights"),
    rep(0.08333333, 12),
    tolerance = 0.0001
  )
})

test_that("outputs proper wieght proportions when not all even", {
  populations <- chilliwack_bt_05
  weights <- c(1, 1, 1, 1, 1, 1, 1, 3, 1, 2, 1, 1)
  ecotype <- as_ypr_ecotypes(populations, weights)
  expect_equal(
    attr(ecotype, "weights"),
    c(0.0667, 0.0667, 0.0667, 0.0667, 0.0667, 0.0667, 0.0667, .20, 0.0667,
      .13333, 0.0667, 0.0667),
    tolerance = 0.001
  )
})






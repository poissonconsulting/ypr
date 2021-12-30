test_that("ecotype now converts population", {
  expect_s3_class(as_ypr_ecotypes(ypr_population()), "ypr_ecotypes")
})

test_that("ecotype errors when incorrect weight parameters given", {
  expect_error(
    as_ypr_ecotypes(ypr_populations(), weights = c("a", "b")),
    "`weights` must be numeric."
  )
})

test_that("ecotype errors when NA weight parameters given", {
  expect_error(
    as_ypr_ecotypes(ypr_populations(), weights = c(1, NA)),
    "`weights` must not have any missing values."
  )
})

test_that("ecotype errors correct NA type given as weights", {
  expect_error(
    as_ypr_ecotypes(ypr_populations(), weights = NA_integer_),
    "`weights` must not have any missing values."
  )
})

test_that("ecotype errors nothing given as weights", {
  expect_error(
    as_ypr_ecotypes(ypr_populations(), weights = numeric(0)),
    "Length of populations and weights do not match. 1 != 0."
  )
})

test_that("ecotype errors when 0's weight parameters given", {
  expect_error(
    as_ypr_ecotypes(ypr_populations(), c(1, 0)),
    "`weights` must have values greater than 0."
  )
})

test_that("outputs ecotype class object", {
  ecotype <- as_ypr_ecotypes(ypr_populations(Linf = c(100, 1000)), c(1/2,1/2))
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

test_that("outputs proper weight proportions when not all even", {
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
  expect_error(
    as_ypr_ecotypes(ypr_populations(Linf = c(100, 1000)), names = c("small", "big", "bigger")),
    'Length of populations and names do not match. 2 != 3.'
  )
})

test_that("ecotypes names fail as not enough are passed", {
  expect_error(
    as_ypr_ecotypes(ypr_populations(Linf = c(100, 1000)),  c(1, 2), c("small")),
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

test_that("as_ypr_population data.frame", {
  expect_identical(
    as_ypr_population(
      as.data.frame(
        ypr_population(Linf = 150)
      )
    ),
    ypr_population(Linf = 150)
  )
})

test_that("as_ypr_population population", {
  expect_identical(
    as_ypr_population(
        ypr_population(Linf = 150)
    ),
    ypr_population(Linf = 150)
  )
})

test_that("as_ypr_population populations", {
  expect_identical(
    as_ypr_population(
      ypr_populations(Linf = 150)
    ),
    ypr_population(Linf = 150)
  )
})

test_that("as_ypr_population ecotypes", {
  expect_identical(
    as_ypr_population(
      ypr_ecotypes(Linf = 150)
    ),
    ypr_population(Linf = 150)
  )
})

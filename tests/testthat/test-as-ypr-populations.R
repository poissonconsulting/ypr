test_that("as_ypr_population data.frame", {
  expect_identical(
    as_ypr_populations(
      as.data.frame(
        ypr_populations(Linf = c(150, 250))
      )
    ),
    ypr_populations(Linf = c(150, 250))
  )
})

test_that("as_ypr_populations population", {
  expect_identical(
    as_ypr_populations(
      ypr_population(Linf = 150)
    ),
    ypr_populations(Linf = 150)
  )
})

test_that("as_ypr_populations populations", {
  expect_identical(
    as_ypr_populations(
      ypr_populations(Linf = c(150, 250))
    ),
    ypr_populations(Linf = c(150, 250))
  )
})

test_that("as_ypr_populations populations", {
  expect_identical(
    as_ypr_populations(
      ypr_ecotypes(Linf = c(150, 250))
    ),
    ypr_populations(Linf = c(150, 250), RPR = c(1, 1), expand = FALSE)
  )
})

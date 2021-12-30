test_that("update", {
  expect_identical(
    update(ypr_population(), Rk = 5),
    ypr_population(Rk = 5)
  )
})

test_that("as_tibble ypr_population", {
  data <- as_tibble(ypr_population())
  expect_snapshot_data(data, "population")
})

test_that("as_tibble ypr_populations", {
  data <- as_tibble(ypr_populations(Rk = c(3, 4)))
  expect_snapshot_data(data, "populations")
})

test_that("as_tibble ypr_ecotypes", {
  data <- as_tibble(as_ypr_ecotypes(ypr_populations(Linf = c(100, 200)), weights = c(0.75, 0.25)))
  expect_snapshot_data(data, "ecotypes")
})

test_that("ypr_tabulate_fish works", {
  fish <- ypr_tabulate_fish(ypr_population(n = ypr:::inst2inter(0.2)))
  expect_identical(colnames(fish), c(
    "Age", "Survivors", "Spawners", "Caught",
    "Harvested", "Released", "HandlingMortalities"
  ))
  expect_identical(fish[[1]], as.double(1:20))
  expect_equal(fish$Survivors[1:2], c(0.134, 0.110), tolerance = 0.01)

  fish <- ypr_tabulate_fish(ypr_population(), x = "Length")
  expect_identical(colnames(fish), c(
    "Length", "Survivors", "Spawners", "Caught",
    "Harvested", "Released", "HandlingMortalities"
  ))
  expect_identical(fish$Length[1:2], c(14, 26))
})

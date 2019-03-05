context("schedule")

test_that("schedule.ypr_population", {
  schedule <- ypr_schedule(ypr_population(Rmax = 100, Rk = 2, Wa = 0.01, fa = 0.1, Mb = -0.75))
  expect_identical(checkr::check_data(
    schedule,
    values = list(Age = c(0L, 100L),
                  Length = c(0, 1000),
                  Weight = c(0, .Machine$double.xmax),
                  Fecundity = c(0, .Machine$double.xmax),
                  Spawning = c(0, 1),
                  NaturalMortality = c(0, 1),
                  Vulnerability = c(0, 1),
                  Retention = c(0, 1),
                  FishingMortality = c(0, 1),
                  Survivorship = c(0, 1),
                  FishedSurvivorship = c(0, 1)),
    nrow = 20L, exclusive = TRUE, order = TRUE), schedule)

  expect_true(all(diff(schedule$Age) == 1L))

  expect_equal(schedule$Weight[20], 8579.51642)
  expect_equal(schedule$Fecundity[20], 857.9516, tolerance = 1e-6)
})

test_that("schedule.ypr_ecotypes", {
  schedule <- ypr_schedule(ypr_ecotypes(Rmax = c(10, 100), Rk = 2, Wa = 0.01, fa = 0.1, Mb = -0.75))
  expect_identical(checkr::check_data(
    schedule,
    values = list(Age = c(0L, 100L),
                  Length = c(0, 1000),
                  Weight = c(0, .Machine$double.xmax),
                  Fecundity = c(0, .Machine$double.xmax),
                  Spawning = c(0, 1),
                  NaturalMortality = c(0, 1),
                  Vulnerability = c(0, 1),
                  Retention = c(0, 1),
                  FishingMortality = c(0, 1),
                  Survivorship = c(0, 1),
                  FishedSurvivorship = c(0, 1),
                  Ecotype = c("ecotype1", "ecotype2")),
    nrow = 40L, exclusive = TRUE, order = TRUE), schedule)

  expect_true(all(diff(schedule$Age[1:20]) == 1L))
  expect_true(all(diff(schedule$Age[21:40]) == 1L))

  expect_equal(schedule$Weight[20], 8579.51642)
  expect_equal(schedule$Fecundity[20], 857.9516, tolerance = 1e-6)
})

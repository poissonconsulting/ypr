context("schedule")

test_that("schedule", {
  schedule <- ypr_schedule(ypr_population(
    Rmax = 100, Rk = 2, Wa = 0.01,
    n = ypr:::inst2inter(0.2), fa = 0.1
  ))
  expect_identical(checkr::check_data(
    schedule,
    values = list(
      Age = c(0L, 100L),
      Length = c(0, 1000),
      Weight = c(0, .Machine$double.xmax),
      Fecundity = c(0, .Machine$double.xmax),
      Spawning = c(0, 1),
      NaturalMortality = c(0, 1),
      Vulnerability = c(0, 1),
      Retention = c(0, 1),
      FishingMortality = c(0, 1),
      Survivorship = c(0, 1),
      FishedSurvivorship = c(0, 1)
    ),
    nrow = TRUE, exclusive = TRUE, order = TRUE
  ), schedule)

  expect_true(all(diff(schedule$Age) == 1L))

  expect_equal(schedule$Weight[20], 8579.51642)
  expect_equal(schedule$Fecundity[20], 857.9516, tolerance = 1e-6)
})

test_that("schedule with biphasic growth", {

  pop1 <- ypr_population(tmax = 9L, k = 0.54, Linf = 43.90, t0 = 0.65,
                         k2 = 0.7, Linf2 = 82.56, L2 = -3.6)

  pop2 <- ypr_population_update(pop1, k2 = 0.27, Linf2 = 54.2)

  schedule1 <- ypr_schedule(pop1)
  schedule2 <- ypr_schedule(pop2)

  expect_equal(schedule1$Length,
               c(7.56017235610119, 22.723028948946, 53.4078559389573, 68.0834736852762,
                 75.3711697821585, 78.9901325623683, 80.7872562939886, 81.679681528206,
                 82.122846784251))

  expect_equal(schedule2$Length,
               c(7.56017235610119, 22.723028948946, 38.2853759487198, 42.0511023391726,
                 44.9257806469274, 47.1202511198824, 48.7954648798639, 50.0742887128647,
                 51.0505166038468))
})

test_that("schedule with biphasic length loss", {
  schedule <- ypr_schedule(ypr_population(Linf = 300, L2 = 150))
  expect_equal(
    schedule$Length,
    c(
      41.7876070724827, 77.7545337954846, 108.711554513468, 135.356509171792,
      147.236655274101, 140.65696597406, 134.993774911116, 130.11942119122,
      125.924026064589, 122.313016014843, 119.204990862075, 116.529888822159,
      114.227407158651, 112.245642825298, 110.539922456186, 109.071795328941,
      107.808166600115, 106.720551273975, 105.784432087484, 104.978706836786
    )
  )
})

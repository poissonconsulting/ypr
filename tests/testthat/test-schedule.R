context("schedule")

test_that("schedule", {
  schedule <- ypr_schedule(ypr_population(R0 = 100, Wa = 0.01, fa = 0.1, Mb = -0.75))
  expect_identical(check_schedule(schedule, exclusive = TRUE, order = TRUE), schedule)
  expect_equal(schedule$Weight[20], 8579.51642)
  expect_equal(schedule$Fecundity[20], 857.9516, tolerance = 1e-6)
})

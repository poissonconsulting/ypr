context("schedule")

test_that("schedule", {
  schedule <- ypr_schedule(ypr_population(R0 = 100, Wa = 0.01))
  expect_identical(check_schedule(schedule, exclusive = TRUE, order = TRUE), schedule)
  expect_equal(schedule$Weight[20], 8579.51642)
})

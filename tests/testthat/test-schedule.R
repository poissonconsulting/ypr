context("schedule")

test_that("schedule", {
  schedule <- ypr_schedule(ypr_population(R0 = 100))
  expect_identical(check_schedule(schedule, exclusive = TRUE, order = TRUE), schedule)
})

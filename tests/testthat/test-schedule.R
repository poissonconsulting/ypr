context("schedule")

test_that("schedule", {

  schedule <- ypr_schedule()
  expect_identical(check_schedule(schedule, exclusive = TRUE, order = TRUE), schedule)
})

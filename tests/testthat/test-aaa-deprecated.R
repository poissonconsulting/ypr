context("deprecated")

test_that("ypr_schedule", {
  expect_warning(ypr_schedule(ypr_population()),
                 "`ypr_schedule[(][)]` is deprecated as of ypr 0.4.0.")
})

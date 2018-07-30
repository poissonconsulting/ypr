context("data")

test_that("data", {
  expect_identical(check_population(adams_bt_03), adams_bt_03)
  expect_identical(check_population(chilliwack_bt_05), chilliwack_bt_05)
  expect_identical(check_population(kootenay_bt_13), kootenay_bt_13)
  expect_identical(check_population(kootenay_rb_13), kootenay_rb_13)
  expect_identical(check_population(quesnel_bt), quesnel_bt)
  expect_identical(check_population(quesnel_lt), quesnel_lt)
  expect_identical(check_population(quesnel_rb), quesnel_rb)
})

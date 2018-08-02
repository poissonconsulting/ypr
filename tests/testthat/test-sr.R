context("sr")

test_that("sr", {
  bh <- ypr_sr(ypr_population())
  ri <- ypr_sr(ypr_population(BH = 0L))
  expect_is(bh, "numeric")
  expect_identical(names(bh), c("alpha", "beta", "R0F"))
  expect_equal(bh["alpha"], 6.708921e-06, check.attributes = FALSE)
  expect_equal(bh["beta"], 4.472614e-06, check.attributes = FALSE)
  expect_equal(bh["R0F"], 0.2015758, check.attributes = FALSE)
  expect_identical(ri["alpha"], bh["alpha"])
  expect_equal(ri["beta"], 2.456835e-06, check.attributes = FALSE)
  expect_equal(ri["R0F"], 0.3411221, check.attributes = FALSE, tolerance = 1e-07)
})

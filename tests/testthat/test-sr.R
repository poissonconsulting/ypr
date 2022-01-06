test_that("ypr_sr population", {
  sr <- ypr_sr(ypr_population())
  expect_s3_class(sr, "tbl_df")
  expect_snapshot_data(sr, "pop")
})

test_that("ypr_sr ecotype 1", {
  expect_identical(ypr_sr(ypr_ecotypes()), ypr_sr(ypr_population()))
})

test_that("ypr_sr ecotype 2 same", {
  expect_equal(ypr_sr(ypr_ecotypes(Linf = c(100, 100.00000000001))), ypr_sr(ypr_population()))
})

test_that("ypr_sr ecotype 2 diff weights", {
  expect_equal(ypr_sr(ypr_ecotypes(Linf = c(100, 50), RPR = c(1, 0.00000000001))), ypr_sr(ypr_population()))
})

test_that("ypr_sr ecotype 2 other diff weights", {
  expect_equal(ypr_sr(ypr_ecotypes(Linf = c(100, 50), RPR = c(0.0000000000001, 1))), ypr_sr(ypr_population(Linf = 50)))
})

test_that("ypr_sr works with 3 ecotypes", {
  ecotype <- ypr_ecotypes(Linf = c(10, 100, 1000), RPR = c(1, 2, 1))
  sr <- ypr_sr(ecotype)
  expect_snapshot_data(sr, "sr3")
})

test_that("ypr_sr population low mortality", {
  sr <- ypr_sr(ypr_population(n = 0.1))
  expect_s3_class(sr, "tbl_df")
  expect_snapshot_data(sr, "poplow")
})

test_that("ypr_sr population bh n", {
  bh <- ypr_sr(ypr_population(n = ypr:::inst2inter(0.2)))
  expect_s3_class(bh, "data.frame")
  expect_identical(names(bh), c("alpha", "beta", "Rk", "phi", "phiF", "R0", "R0F", "S0", "S0F"))
  expect_equal(bh$alpha, 0.0006708921, tolerance = 1e-06, ignore_attr = TRUE)
  expect_equal(bh$beta, bh$alpha, ignore_attr = TRUE)
  expect_equal(bh$Rk, ypr_population()$Rk, ignore_attr = TRUE)
  expect_equal(bh$R0F, 0.1343839, ignore_attr = TRUE, tolerance = 1e-06)
  expect_equal(bh$phi, 4471.658, ignore_attr = TRUE, tolerance = 1e-07)
  expect_equal(bh$phiF, 1721.956, ignore_attr = TRUE, tolerance = 1e-06)
  expect_equal(bh$S0, 1.583806, ignore_attr = TRUE, tolerance = 1e-06)
  expect_equal(bh$S0F, 0.1746688, ignore_attr = TRUE, tolerance = 1e-06)
  expect_snapshot_data(bh, "bh")
})

test_that("ypr_sr population ri n", {
  ri <- ypr_sr(ypr_population(BH = 0L, n = ypr:::inst2inter(0.2)))
  expect_equal(ri$alpha, 0.0006708921, tolerance = 1e-06, ignore_attr = TRUE)
  expect_equal(ri$Rk, ypr_population()$Rk, ignore_attr = TRUE)
  expect_equal(ri$phi, 4471.658, ignore_attr = TRUE, tolerance = 1e-07)
  expect_equal(ri$phiF, 1721.956, ignore_attr = TRUE, tolerance = 1e-06)
  expect_equal(ri$beta, 0.0002468074, ignore_attr = TRUE, tolerance = 1e-06)
  expect_equal(ri$R0F, 0.3395686, ignore_attr = TRUE, tolerance = 1e-07)
  expect_snapshot_data(ri, "ri")
})

test_that("ypr_sr extinct population BH", {
  bh <- ypr_sr(ypr_population(Linf = 140))
  expect_equal(bh$R0F, 0, ignore_attr = TRUE, tolerance = 1e-06)
  expect_snapshot_data(bh, "bh0")
})

test_that("ypr_sr extinct population RI", {
  ri <- ypr_sr(ypr_population(Linf = 140, BH = 0L))
  expect_equal(ri$R0F, 0, ignore_attr = TRUE, tolerance = 1e-06)
  expect_snapshot_data(ri, "ri0")
})

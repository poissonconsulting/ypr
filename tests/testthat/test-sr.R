test_that("sr", {
  bh <- ypr_sr(ypr_population(n = ypr:::inst2inter(0.2)))
  ri <- ypr_sr(ypr_population(BH = 0L, n = ypr:::inst2inter(0.2)))
  expect_s3_class(bh, "data.frame")
  expect_identical(names(bh), c("alpha", "beta", "Rk", "phi", "phiF", "R0", "R0F", "S0", "S0F"))
  expect_identical(names(ri), names(bh))
  expect_equal(bh$alpha, 0.0006708921, tolerance = 1e-06, ignore_attr = TRUE)
  expect_equal(bh$beta, bh$alpha, ignore_attr = TRUE)
  expect_equal(bh$Rk, ypr_population()$Rk, ignore_attr = TRUE)
  expect_equal(bh$R0F, 0.1343839, ignore_attr = TRUE, tolerance = 1e-06)
  expect_equal(bh$phi, 4471.658, ignore_attr = TRUE, tolerance = 1e-07)
  expect_equal(bh$phiF, 1721.956, ignore_attr = TRUE, tolerance = 1e-06)
  expect_equal(bh$S0, 1.583806, ignore_attr = TRUE, tolerance = 1e-06)
  expect_equal(bh$S0F, 0.1746688, ignore_attr = TRUE, tolerance = 1e-06)
  expect_identical(unname(bh$R0F), bh(bh$R0F * bh$phiF, bh$alpha, bh$beta))
  expect_equal(unname(ri$R0F), ri(ri$R0F * ri$phiF, ri$alpha, ri$beta))
  expect_identical(ri[c("alpha", "phi", "phiF")], bh[c("alpha", "phi", "phiF")])
  expect_equal(ri$beta, 0.0002468074, ignore_attr = TRUE, tolerance = 1e-06)
  expect_equal(ri$R0F, 0.3395686, ignore_attr = TRUE, tolerance = 1e-07)
})

test_that("ypr_sr extinct population", {
  bh <- ypr_sr(ypr_population(Linf = 100))
  expect_equal(bh$R0F, 0.1857959, ignore_attr = TRUE, tolerance = 1e-06)

  bh <- ypr_sr(ypr_population(Linf = 100, BH = 0L))
  expect_equal(bh$R0F, 0.4549179, ignore_attr = TRUE, tolerance = 1e-06)

  bh <- ypr_sr(ypr_population(Linf = 140))
  expect_equal(bh$R0F, 0, ignore_attr = TRUE, tolerance = 1e-06)

  bh <- ypr_sr(ypr_population(Linf = 140, BH = 0L))
  expect_equal(bh$R0F, 0, ignore_attr = TRUE, tolerance = 1e-06)
})

test_that("ypr_sr works almost identical ecotypes with same weighting", {
  popn <- ypr_population(Linf = 100)
  sr <- ypr_sr(popn)
  ecotypes <- ypr_ecotypes(Linf = c(100, 100.0000001), RPR = c(0.5, 0.5))
  expect_equal(ypr_sr(ecotypes), sr)
})

test_that("ypr_sr works with 3 ecotypes", {
  ecotype <- ypr_ecotypes(Linf = c(10, 100, 1000), RPR = c(1, 2, 1))
  sr <- ypr_sr(ecotype)
  expect_snapshot_data(sr, "sr3")
})

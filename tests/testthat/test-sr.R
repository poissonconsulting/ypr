context("sr")

test_that("sr population", {
  bh <- ypr_sr(ypr_population())
  ri <- ypr_sr(ypr_population(BH = 0L))
  expect_is(bh, "data.frame")
  expect_identical(names(bh), c("alpha", "beta", "Rk", "phi", "phiF", "R0", "R0F", "S0", "S0F"))
  expect_identical(names(ri), names(bh))
  expect_equal(bh$alpha, 0.0006708921, check.attributes = FALSE)
  expect_equal(bh$beta, bh$alpha, check.attributes = FALSE)
  expect_equal(bh$Rk, ypr_population()$Rk, check.attributes = FALSE)
  expect_equal(bh$R0F, 0.1343839, check.attributes = FALSE, tolerance = 1e-07)
  expect_equal(bh$phi, 4471.658, check.attributes = FALSE, tolerance = 1e-07)
  expect_equal(bh$phiF, 1721.956, check.attributes = FALSE, tolerance = 1e-06)
  expect_equal(bh$S0, 1.583806, check.attributes = FALSE, tolerance = 1e-06)
  expect_equal(bh$S0F, 0.1746688, check.attributes = FALSE, tolerance = 1e-06)
  expect_identical(unname(bh$R0F), bh(bh$R0F * bh$phiF, bh$alpha, bh$beta))
  expect_equal(unname(ri$R0F), ri(ri$R0F * ri$phiF, ri$alpha, ri$beta))
  expect_identical(ri[c("alpha", "phi", "phiF")], bh[c("alpha", "phi", "phiF")])
  expect_equal(ri$beta, 0.0002468074, check.attributes = FALSE)
  expect_equal(ri$R0F, 0.3395686, check.attributes = FALSE, tolerance = 1e-07)
})

test_that("sr ecotypes same", {
  sr <- ypr_sr(ypr_ecotypes(Rmax = c(0.5, 0.5)))
  expect_identical(sr, ypr_sr(ypr_population()))
})

test_that("sr ecotypes diff same abundance", {
  sr1 <- ypr_sr(ypr_population(M = 1))
  sr2 <- ypr_sr(ypr_population(M = 2))
  sr <- ypr_sr(ypr_ecotypes(M = c(1, 2), Rmax = c(0.5, 0.5)))

  expect_identical(sr$phi, mean(c(sr1$phi, sr2$phi)))
  expect_identical(sr$phiF, mean(c(sr1$phiF, sr2$phiF)))
  expect_equal(sr$Rk, sr1$Rk)
  expect_equal(sr$Rk, sr2$Rk)
  expect_equal(sr$R0, sr1$R0)
  expect_equal(sr$R0, sr2$R0)
  expect_equal(sr$S0, mean(c(sr1$S0, sr2$S0)))
})

test_that("sr ecotypes diff abundance", {
  sr1 <- ypr_sr(ypr_population(M = 1))
  sr2 <- ypr_sr(ypr_population(M = 2))
  sr <- ypr_sr(ypr_ecotypes(M = c(1, 2), Rmax = c(1, 10)))

  expect_identical(sr$phi, weighted.mean(c(sr1$phi, sr2$phi), c(1, 10)))
  expect_identical(sr$phiF, weighted.mean(c(sr1$phiF, sr2$phiF), c(1, 10)))
  expect_equal(sr$Rk, sr1$Rk)
  expect_equal(sr$Rk, sr2$Rk)
  expect_equal(sr$R0/11,  weighted.mean(c(sr1$R0, sr2$R0), c(1, 10)))
  expect_equal(sr$S0/11,  weighted.mean(c(sr1$S0, sr2$S0), c(1, 10)))
})

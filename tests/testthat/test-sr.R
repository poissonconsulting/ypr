test_that("sr", {
  bh <- ypr_sr(ypr_population(n = ypr:::inst2inter(0.2)))
  ri <- ypr_sr(ypr_population(BH = 0L, n = ypr:::inst2inter(0.2)))
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

test_that("ypr_sr extinct population", {
  bh <- ypr_sr(ypr_population(Linf = 100))
  expect_equal(bh$R0F, 0.1857959, check.attributes = FALSE, tolerance = 1e-06)

  bh <- ypr_sr(ypr_population(Linf = 100, BH = 0L))
  expect_equal(bh$R0F, 0.4549179, check.attributes = FALSE, tolerance = 1e-06)

  bh <- ypr_sr(ypr_population(Linf = 140))
  expect_equal(bh$R0F, 0, check.attributes = FALSE, tolerance = 1e-06)

  bh <- ypr_sr(ypr_population(Linf = 140, BH = 0L))
  expect_equal(bh$R0F, 0, check.attributes = FALSE, tolerance = 1e-06)
})

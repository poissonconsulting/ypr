test_that("yield", {
  expect_equivalent(ypr_yield(ypr_population(n = ypr:::inst2inter(0.2))), 0.03493376, tolerance = 1e-06)
  expect_equivalent(ypr_yield(ypr_population(n = ypr:::inst2inter(0.2)), harvest = FALSE), 0.03493376, tolerance = 1e-06)
  expect_equivalent(ypr_yield(ypr_population(rho = 0.4, n = ypr:::inst2inter(0.2))), ypr_yield(ypr_population(pi = 0.2 * 0.6, n = ypr:::inst2inter(0.2))), tolerance = 1e-06)
  expect_equivalent(ypr_yield(ypr_population(rho = 0.4, n = ypr:::inst2inter(0.2)), harvest = FALSE), 0.1215271, tolerance = 1e-06)
  expect_equivalent(ypr_yield(ypr_population(rho = 0.4, Hm = 0.3, n = ypr:::inst2inter(0.2))), 0.05576617, tolerance = 1e-06)
  expect_equivalent(ypr_yield(ypr_population(rho = 0.4, Hm = 0.3, n = ypr:::inst2inter(0.2)), harvest = FALSE), 0.09294362, tolerance = 1e-06)
  expect_equivalent(ypr_yield(ypr_population(Rmax = 1000, n = ypr:::inst2inter(0.2))), 34.93376, tolerance = 1e-03)
  expect_equivalent(ypr_yield(ypr_population(BH = 0L, n = ypr:::inst2inter(0.2))), 0.08827256, tolerance = 1e-03)
  expect_equivalent(ypr_yield(ypr_population(Rmax = 1000, BH = 0L, n = ypr:::inst2inter(0.2))), 88.27256, tolerance = 1e-03)
  expect_equivalent(ypr_yield(ypr_population(n = ypr:::inst2inter(0.2)), biomass = TRUE), 0.09256122, tolerance = 1e-06)
  expect_equivalent(ypr_yield(ypr_population(n = ypr:::inst2inter(0.2)), biomass = TRUE, Ly = 70), 0.0325123, tolerance = 1e-06)
  expect_equivalent(ypr_yield(ypr_population(n = ypr:::inst2inter(0.2), L2 = 50), biomass = TRUE, Ly = 70), 0.0325123, tolerance = 1e-06)
  expect_equivalent(ypr_yield(ypr_population(L2 = 50, Linf = 100), biomass = TRUE, Ly = 70), 0.03549328, tolerance = 1e-06)
  expect_equivalent(ypr_yield(ypr_population(Linf = 140), biomass = TRUE, Ly = 70), 0, tolerance = 1e-06)
  expect_equivalent(ypr_yield(ypr_population(Ls = -4.8), biomass = TRUE, Ly = 70), 0.0344496332448326)
  expect_equivalent(ypr_yield(ypr_population(Ls = -4.8, Lv = -4.8), biomass = TRUE, Ly = 70), 0.0366468217646047)
  expect_equivalent(ypr_yield(ypr_population(Ls = -4.8, Lv = -4.8, Ln = -4.8, L2 = -4.8), biomass = TRUE, Ly = 70), 0.0366468217646047)
  expect_equivalent(ypr_yield(ypr_population(Linf = 300, L2 = 150), biomass = TRUE, Ly = 70), 2.06998434234758)
})

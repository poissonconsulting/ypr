context("as-data-frame")

test_that("as.data.frame", {
  expect_identical(as.data.frame(ypr_population()),
                   structure(list(tmax = 20L, k = 0.15, Linf = 100, t0 = 0, k2 = 0.15,
                                  Linf2 = 100, L2 = 1000, Wb = 3, Ls = 50, Sp = 100, es = 1,
                                  Sm = 0, fb = 1, tR = 1L, BH = 1L, Rk = 3, n = 0.2, nL = 0.2,
                                  Ln = 50, Lv = 50, Vp = 100, Llo = 0, Lup = 1000, Nc = 0,
                                  pi = 0.2, rho = 0, Hm = 0, Rmax = 1, Wa = 0.01, fa = 1, q = 0.1), class = "data.frame", row.names = c(NA,
                                                                                                                                        -1L)))

  expect_identical(as.data.frame(ypr_populations(Rk = c(3,4))),
                   structure(list(tmax = c(20L, 20L), k = c(0.15, 0.15), Linf = c(100,
100), t0 = c(0, 0), k2 = c(0.15, 0.15), Linf2 = c(100, 100),
    L2 = c(1000, 1000), Wb = c(3, 3), Ls = c(50, 50), Sp = c(100,
    100), es = c(1, 1), Sm = c(0, 0), fb = c(1, 1), tR = c(1L,
    1L), BH = c(1L, 1L), Rk = c(3, 4), n = c(0.2, 0.2), nL = c(0.2,
    0.2), Ln = c(50, 50), Lv = c(50, 50), Vp = c(100, 100), Llo = c(0,
    0), Lup = c(1000, 1000), Nc = c(0, 0), pi = c(0.2, 0.2),
    rho = c(0, 0), Hm = c(0, 0), Rmax = c(1, 1), Wa = c(0.01,
    0.01), fa = c(1, 1), q = c(0.1, 0.1)), row.names = c("Rk_3",
"Rk_4"), class = "data.frame"))
})

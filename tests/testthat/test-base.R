test_that("data.frame conversion for ecotypes functions as expected", {
  expect_identical(
    as.data.frame(as_ypr_ecotypes()),
    structure(list(
      tmax = c(20L, 20L), k = c(0.15, 0.15), Linf = c(100, 1000), t0 = c(0, 0),
      k2 = c(0.15, 0.15), Linf2 = c(100, 100), L2 = c(1000, 1000), Wb = c(3, 3),
      Ls = c(50, 50), Sp = c(100, 100), es = c(1, 1), Sm = c(0, 0), fb = c(1, 1),
      tR = c(1L, 1L), BH = c(1L, 1L), Rk = c(3, 3), n = c(0.2, 0.2),
      nL = c(0.2, 0.2), Ln = c(1000, 1000), Lv = c(50, 50), Vp = c(100, 100),
      Llo = c(0, 0), Lup = c(1000, 1000), Nc = c(0, 0), pi = c(0.2, 0.2),
      rho = c(0, 0), Hm = c(0, 0), Rmax = c(1, 1), Wa = c(0.01, 0.01),
      fa = c(1, 1), q = c(0.1, 0.1)
      ),
      row.names = c(1L, 2L),
      proportions = c(0.5, 0.5),
      class = c("tbl_df", "tbl", "data.frame")
    )
  )
})

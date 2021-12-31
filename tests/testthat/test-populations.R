
test_that("populations", {
  populations <- ypr_populations()
  expect_identical(length(populations), 1L)
  expect_identical(populations[[1]], ypr_population())

  expect_identical(
    ypr_populations(Rk = 2),
    structure(list(Pop_1 = structure(list(
      tmax = 20L, k = 0.15,
      Linf = 100, t0 = 0, k2 = 0.15, Linf2 = 100, L2 = 1000, Wb = 3,
      Ls = 50, Sp = 100, es = 1, Sm = 0, fb = 1, tR = 1L, BH = 1L,
      Rk = 2, n = 0.2, nL = 0.2, Ln = 1000, Lv = 50, Vp = 100, Llo = 0,
      Lup = 1000, Nc = 0, pi = 0.2, rho = 0, Hm = 0, Rmax = 1,
      Wa = 0.01, fa = 1, q = 0.1, RPR = 1
    ), class = "ypr_population")), class = "ypr_populations")
  )

  populations <- ypr_populations(Rk = c(2.5, 4.6))
  expect_identical(length(populations), 2L)
  expect_identical(
    names(populations),
    c("Rk_2_5", "Rk_4_6")
  )

  populations <- ypr_populations(Rk = c(2.5, 4.6), Hm = c(0.2, 0.05))
  expect_identical(
    names(populations),
    c("Rk_2_5_Hm_0_05", "Rk_4_6_Hm_0_05", "Rk_2_5_Hm_0_2", "Rk_4_6_Hm_0_2")
  )
  expect_identical(check_populations(populations), populations)
  expect_identical(length(populations), 4L)
  expect_identical(check_population(populations[[1]]), populations[[1]])

  populations <- ypr_populations(k = 0.12, Rk = c(2.5, 4.6), Hm = c(0.2, 0.05))
  expect_identical(
    names(populations),
    c("Rk_2_5_Hm_0_05", "Rk_4_6_Hm_0_05", "Rk_2_5_Hm_0_2", "Rk_4_6_Hm_0_2")
  )
  expect_identical(check_populations(populations), populations)
  expect_identical(length(populations), 4L)
  expect_identical(check_population(populations[[1]]), populations[[1]])
})

test_that("populations expand = FALSE", {
  populations <- ypr_populations(k = 0.12, Rk = c(2.5, 4.6, 5.0), Hm = c(0.2, 0.05))
  expect_identical(
    names(populations),
    c(
      "Rk_2_5_Hm_0_05", "Rk_4_6_Hm_0_05", "Rk_5_Hm_0_05", "Rk_2_5_Hm_0_2",
      "Rk_4_6_Hm_0_2", "Rk_5_Hm_0_2"
    )
  )
  expect_error(
    ypr_populations(
      k = 0.12, Rk = c(2.5, 4.6, 5.0),
      Hm = c(0.2, 0.05), expand = FALSE
    ),
    "^Non-scalar parameter values must all be the same length [(]not 2 and 3[)][.]$"
  )
  expect_error(
    ypr_populations(
      k = 0.12, Rk = c(2.5, 4.6, 5.0),
      Hm = c(0.2, 0.05), expand = FALSE
    ),
    "^Non-scalar parameter values must all be the same length [(]not 2 and 3[)][.]$"
  )

  expect_identical(
    names(ypr_populations(
      k = 0.12, Rk = c(2.5, 4.6),
      Hm = c(0.2, 0.05), expand = TRUE
    )),
    c("Rk_2_5_Hm_0_05", "Rk_4_6_Hm_0_05", "Rk_2_5_Hm_0_2", "Rk_4_6_Hm_0_2")
  )

  expect_identical(
    names(ypr_populations(
      k = 0.12, Rk = c(2.5, 4.6),
      Hm = c(0.2, 0.05), expand = FALSE
    )),
    c("Rk_2_5_Hm_0_2", "Rk_4_6_Hm_0_05")
  )

  expect_identical(
    names(ypr_populations(Rk = c(2.5, 4.6, 2.5), expand = FALSE)),
    c("Rk_2_5_Pop_1", "Rk_4_6", "Rk_2_5_Pop_2")
  )
  expect_identical(
    names(ypr_populations(Rk = c(2.5, 4.6, 2.5), Ls = c(60, 50, 50), expand = FALSE)),
    c("Ls_60_Rk_2_5", "Ls_50_Rk_4_6", "Ls_50_Rk_2_5")
  )
  expect_identical(
    names(ypr_populations(Rk = c(2.5, 4.6, 2.5), Ls = c(60, 50, 60), expand = FALSE)),
    c("Ls_60_Rk_2_5_Pop_1", "Ls_50_Rk_4_6", "Ls_60_Rk_2_5_Pop_2")
  )
})

test_that("populations names", {
  populations <- ypr_populations(Ls = c(50, 60), names = c("Name1", "Name2"))
  expect_identical(names(populations), c("Name1", "Name2"))
})

test_that("population", {
  population <- ypr_population()
  expect_identical(check_population(population), population)
  population2 <- ypr_population()
  population2$Rk <- 2.5
  expect_identical(ypr_population_update(population, Rk = 2.5), population2)
  expect_error(
    ypr_population_update(
      population,
      Rk = 0.5
    ),
    "^`Rk` must be between 1 and 100, not 0.5[.]$",
    class = "chk_error"
  )
  expect_s3_class(
    ypr_population_update(population, pi = 0.23456),
    "ypr_population"
  )

  ypr_population_update(population, n = ypr:::inst2inter(0.2), nL = 0.3)
})

test_that("populations", {
  populations <- ypr_populations()
  expect_identical(length(populations), 1L)
  expect_identical(populations[[1]], ypr_population())

  expect_identical(
    ypr_populations(Rk = 2),
    structure(list(Popn_1 = structure(list(
      tmax = 20L, k = 0.15,
      Linf = 100, t0 = 0, k2 = 0.15, Linf2 = 100, L2 = 1000, Wb = 3,
      Ls = 50, Sp = 100, es = 1, Sm = 0, fb = 1, tR = 1L, BH = 1L,
      Rk = 2, n = 0.2, nL = 0.2, Ln = 1000, Lv = 50, Vp = 100, Llo = 0,
      Lup = 1000, Nc = 0, pi = 0.2, rho = 0, Hm = 0, Rmax = 1,
      Wa = 0.01, fa = 1, q = 0.1
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
    c("Rk_2_5_Popn_1", "Rk_4_6", "Rk_2_5_Popn_2")
  )
  expect_identical(
    names(ypr_populations(Rk = c(2.5, 4.6, 2.5), Ls = c(60, 50, 50), expand = FALSE)),
    c("Ls_60_Rk_2_5", "Ls_50_Rk_4_6", "Ls_50_Rk_2_5")
  )
  expect_identical(
    names(ypr_populations(Rk = c(2.5, 4.6, 2.5), Ls = c(60, 50, 60), expand = FALSE)),
    c("Ls_60_Rk_2_5_Popn_1", "Ls_50_Rk_4_6", "Ls_60_Rk_2_5_Popn_2")
  )
})

test_that("ypr_populations_update", {
  expect_identical(
    ypr_populations_update(ypr_populations(Rk = c(2.5, 4)), Rk = 2.5),
    structure(list(Popn_1 = structure(list(
      tmax = 20L, k = 0.15,
      Linf = 100, t0 = 0, k2 = 0.15, Linf2 = 100, L2 = 1000, Wb = 3,
      Ls = 50, Sp = 100, es = 1, Sm = 0, fb = 1, tR = 1L, BH = 1L,
      Rk = 2.5, n = 0.2, nL = 0.2, Ln = 1000, Lv = 50, Vp = 100,
      Llo = 0, Lup = 1000, Nc = 0, pi = 0.2, rho = 0, Hm = 0, Rmax = 1,
      Wa = 0.01, fa = 1, q = 0.1
    ), class = "ypr_population"), Popn_2 = structure(list(
      tmax = 20L, k = 0.15, Linf = 100, t0 = 0, k2 = 0.15, Linf2 = 100,
      L2 = 1000, Wb = 3, Ls = 50, Sp = 100, es = 1, Sm = 0, fb = 1,
      tR = 1L, BH = 1L, Rk = 2.5, n = 0.2, nL = 0.2, Ln = 1000, Lv = 50,
      Vp = 100, Llo = 0, Lup = 1000, Nc = 0, pi = 0.2, rho = 0,
      Hm = 0, Rmax = 1, Wa = 0.01, fa = 1, q = 0.1
    ), class = "ypr_population")), class = "ypr_populations")
  )
})

test_that("ypr_populations_expand", {
  pops <- ypr_populations(Rk = c(2.5, 4, 2.5), Hm = c(0.1, 0.2, 0.1), expand = FALSE)
  expect_identical(names(pops), c("Rk_2_5_Hm_0_1_Popn_1", "Rk_4_Hm_0_2", "Rk_2_5_Hm_0_1_Popn_2"))
  pops <- ypr_populations_expand(pops)
  expect_identical(names(pops), c("Rk_2_5_Hm_0_1", "Rk_4_Hm_0_1", "Rk_2_5_Hm_0_2", "Rk_4_Hm_0_2"))
  expect_identical(pops, ypr_populations(Rk = c(2.5, 4, 2.5), Hm = c(0.1, 0.2, 0.1)))
})

test_that("ypr_ecotypes creates an ecotype", {
  ecotypes <- ypr_ecotypes(Linf = c(1, 2), weights = c(1, 1))
  expect_s3_class(ecotypes, "ypr_ecotypes")
  expect_length(ecotypes, 2L)
  expect_snapshot_output(ecotypes)
})

test_that("ypr_ecotypes creates an ecotype when 1 parameter is provided", {
  ecotypes <- ypr_ecotypes(Linf = c(1, 2), weights = c(1, 1))
  expect_s3_class(ecotypes, "ypr_ecotypes")
  expect_length(ecotypes, 2L)
  expect_snapshot_output(ecotypes)
})

test_that("ypr_ecotypes creates an ecotype when 2 parameters is provided", {
  ecotypes <- ypr_ecotypes(Linf = c(1, 2), k2 = c(0.15, 0.25), weights = c(1, 1))
  expect_s3_class(ecotypes, "ypr_ecotypes")
  expect_length(ecotypes, 2L)
  expect_snapshot_output(ecotypes)
})

test_that("ypr_ecotypes does not error when no weights provided", {
  ecotypes <- ypr_ecotypes(Linf = c(1, 2))
  expect_length(ecotypes, 2L)
  expect_snapshot_output(ecotypes)
})

test_that("ypr_ecotypes errors when incorrect length of weight provided", {
  expect_error(
    ypr_ecotypes(Linf = c(1, 2), weights = c(1, 1, 1)),
    "Length of populations and weights do not match. 2 != 3."
  )
})

test_that("ypr_ecotypes provides correct weights", {
  ecotypes <- ypr_ecotypes(Linf = c(1, 2), weights = c(1, 1))
  proportions <- attr(ecotypes, "proportions")
  expect_equal(proportions, c(0.5, 0.5))
})

test_that("update parameter in ypr_ecotypes", {

  ecotypes <- ypr_ecotypes(Linf = c(2.5, 4), weights = c(1, 3))
  expect_s3_class(ecotypes, "ypr_ecotypes")
  expect_length(ecotypes, 2L)
  expect_named(ecotypes, c("Linf_2_5", "Linf_4"))
  expect_equal(ecotypes[[1]]$Linf, 2.5)
  expect_equal(ecotypes[[2]]$Linf, 4)

  ecotypes_updated <- ypr_ecotypes_update(ecotypes, Linf = c(1))
  expect_s3_class(ecotypes_updated, "ypr_ecotypes")
  expect_length(ecotypes_updated, 2L)
  expect_named(ecotypes_updated, c("Popn_1", "Popn_2"))
  expect_equal(ecotypes_updated[[1]]$Linf, 1)
  expect_equal(ecotypes_updated[[2]]$Linf, 1)

})

test_that("nothing updated when empty value passed to ypr_ecotypes_update", {

  ecotypes <- ypr_ecotypes(Linf = c(2.5, 4), weights = c(1, 3))
  expect_s3_class(ecotypes, "ypr_ecotypes")
  expect_length(ecotypes, 2L)
  expect_named(ecotypes, c("Linf_2_5", "Linf_4"))
  expect_equal(ecotypes[[1]]$Linf, 2.5)
  expect_equal(ecotypes[[2]]$Linf, 4)

  ecotypes_updated <- ypr_ecotypes_update(ecotypes)
  expect_s3_class(ecotypes_updated, "ypr_ecotypes")
  expect_length(ecotypes_updated, 2L)
  expect_named(ecotypes_updated, c("Linf_2_5", "Linf_4"))
  expect_equal(ecotypes_updated[[1]]$Linf, 2.5)
  expect_equal(ecotypes_updated[[2]]$Linf, 4)

})

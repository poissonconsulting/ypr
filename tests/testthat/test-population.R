context("population")

test_that("population", {
  population <- ypr_population()
  expect_identical(chk_population(population), population)
  population2 <- ypr_population()
  population2$Rk <- 2.5
  expect_identical(ypr_population_update(population, Rk = 2.5), population2)
  expect_error(ypr_population_update(population, Rk = 0.5), "^`Rk` must be between 1 and 100, not 0.5[.]$", class = "chk_error")
  expect_is(ypr_population_update(population, pi = 0.23456), "ypr_population")

  ypr_population_update(population, M = 0.2, Mb = -0.75)

  populations <- ypr_populations()
  expect_identical(length(populations), 1L)
  expect_identical(populations[[1]], ypr_population())

  expect_identical(ypr_populations(Rk = 2),
                  structure(list(Popn_1 = structure(list(tmax = 20L, k = 0.15,
    Linf = 100, t0 = 0, Wb = 3, Ls = 50, Sp = 100, es = 1, Sm = 0,
    fb = 1, tR = 1L, BH = 1L, Rk = 2, M = 0.2, Mb = 0, Lv = 50,
    Vp = 100, Llo = 0, Lup = 1000, Nc = 0, pi = 0.2, rho = 0,
    Hm = 0, Rmax = 1, A0 = 0, Wa = 0.01, fa = 1, q = 0.1), class = "ypr_population")), class = "ypr_populations"))

  populations <- ypr_populations(Rk = c(2.5, 4.6))
  expect_identical(length(populations), 2L)
  expect_identical(names(populations),
    c("Rk_2_5", "Rk_4_6"))

  populations <- ypr_populations(Rk = c(2.5, 4.6), Hm = c(0.2, 0.05))
  expect_identical(names(populations),
    c("Rk_2_5_Hm_0_05", "Rk_4_6_Hm_0_05", "Rk_2_5_Hm_0_2", "Rk_4_6_Hm_0_2"))
  expect_identical(chk_populations(populations), populations)
  expect_identical(length(populations), 4L)
  expect_identical(chk_population(populations[[1]]), populations[[1]])

  populations <- ypr_populations(k = 0.12, Rk = c(2.5, 4.6), Hm = c(0.2, 0.05))
  expect_identical(names(populations),
    c("Rk_2_5_Hm_0_05", "Rk_4_6_Hm_0_05", "Rk_2_5_Hm_0_2", "Rk_4_6_Hm_0_2"))
  expect_identical(chk_populations(populations), populations)
  expect_identical(length(populations), 4L)
  expect_identical(chk_population(populations[[1]]), populations[[1]])

  names(populations) <- NULL
  expect_error(chk_populations(populations), "^`populations` must be named[.]$", class = "chk_error")
})

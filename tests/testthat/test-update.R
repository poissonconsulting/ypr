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

test_that("ypr_populations_update", {
  expect_identical(
    ypr_populations_update(ypr_populations(Rk = c(2.5, 4)), Rk = 2.5),
    structure(list(Pop_1 = structure(list(
      tmax = 20L, k = 0.15,
      Linf = 100, t0 = 0, k2 = 0.15, Linf2 = 100, L2 = 1000, Wb = 3,
      Ls = 50, Sp = 100, es = 1, Sm = 0, fb = 1, tR = 1L, BH = 1L,
      Rk = 2.5, n = 0.2, nL = 0.2, Ln = 1000, Lv = 50, Vp = 100,
      Llo = 0, Lup = 1000, Nc = 0, pi = 0.2, rho = 0, Hm = 0, Rmax = 1,
      Wa = 0.01, fa = 1, q = 0.1, RPR = 1
    ), class = "ypr_population"), Pop_2 = structure(list(
      tmax = 20L, k = 0.15, Linf = 100, t0 = 0, k2 = 0.15, Linf2 = 100,
      L2 = 1000, Wb = 3, Ls = 50, Sp = 100, es = 1, Sm = 0, fb = 1,
      tR = 1L, BH = 1L, Rk = 2.5, n = 0.2, nL = 0.2, Ln = 1000, Lv = 50,
      Vp = 100, Llo = 0, Lup = 1000, Nc = 0, pi = 0.2, rho = 0,
      Hm = 0, Rmax = 1, Wa = 0.01, fa = 1, q = 0.1, RPR = 1
    ), class = "ypr_population")), class = "ypr_populations")
  )
})


test_that("update parameter in ypr_ecotypes", {
  ecotypes <- ypr_ecotypes(Linf = c(2.5, 4), RPR = c(1, 3))
  expect_s3_class(ecotypes, "ypr_ecotypes")
  expect_length(ecotypes, 2L)
  expect_named(ecotypes, c("Linf_2_5", "Linf_4"))
  expect_equal(ecotypes[[1]]$Linf, 2.5)
  expect_equal(ecotypes[[2]]$Linf, 4)
  expect_equal(ecotypes[[1]]$RPR, 1)
  expect_equal(ecotypes[[2]]$RPR, 3)

  # ecotypes_updated <- ypr_ecotypes_update(ecotypes, Linf = c(1))
  # expect_s3_class(ecotypes_updated, "ypr_ecotypes")
  # expect_length(ecotypes_updated, 2L)
  # expect_named(ecotypes_updated, c('RPR_1', 'RPR_3'))
  # expect_equal(ecotypes_updated[[1]]$Linf, 1)
  # expect_equal(ecotypes_updated[[2]]$Linf, 1)
})

test_that("nothing updated when empty value passed to ypr_ecotypes_update", {

  ecotypes <- ypr_ecotypes(Linf = c(2.5, 4), RPR = c(1, 3))
  expect_s3_class(ecotypes, "ypr_ecotypes")
  expect_length(ecotypes, 2L)
  expect_named(ecotypes, c('Linf_2_5', 'Linf_4'))
  expect_equal(ecotypes[[1]]$Linf, 2.5)
  expect_equal(ecotypes[[2]]$Linf, 4)

  ecotypes_updated <- ypr_ecotypes_update(ecotypes)
  expect_s3_class(ecotypes_updated, "ypr_ecotypes")
  expect_length(ecotypes_updated, 2L)
  expect_named(ecotypes_updated, c('Linf_2_5', 'Linf_4'))
  expect_equal(ecotypes_updated[[1]]$Linf, 2.5)
  expect_equal(ecotypes_updated[[2]]$Linf, 4)
})


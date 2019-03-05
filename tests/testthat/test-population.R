context("population")

test_that("population", {
  population <- ypr_population()
  expect_identical(check_population(population), population)
})

test_that("population errors", {
  expect_error(ypr_population(Rk = double(0)), "Rk must have 1 element")
  expect_error(ypr_population(Rk = 0.5), "the values in Rk must lie between 1 and 100")
  expect_error(ypr_population(Linf2 = 100), "unused argument [(]Linf2 = 100[)]")
  expect_error(ypr_population(Linf = c(100, 150)), "Linf must have 1 element")
  expect_error(ypr_population(Linf = 50, Ls = 100), "'population' parameter Linf < Ls")
})

test_that("ypr_population_update", {
  population <- ypr_population()
  population2 <- ypr_population()
  population2$Rk <- 2.5
  expect_identical(ypr_population_update(population, Rk = 2.5), population2)

  expect_is(ypr_population_update(population, pi = 0.23456), "ypr_population")
})

test_that("ypr_population_update errors", {
  expect_error(ypr_population_update(ypr_population(), Rk = 0.5),
               "the values in Rk must lie between 1 and 100")
  expect_error(ypr_population_update(ypr_population(), Lv = 200),
               "'population' parameter Linf < Lv")
})

test_that("populations", {
  populations <- ypr_populations()
  expect_is(populations, "ypr_populations")
  expect_identical(length(populations), 1L)
  expect_identical(populations[[1]], ypr_population())

  populations <- ypr_populations(Rk = c(2.5, 4.6))
  expect_identical(length(populations), 2L)
  expect_identical(names(populations),
                   c("Rk_2_5", "Rk_4_6"))

  populations <- ypr_populations(Rk = c(2.5, 4.6), Hm = c(0.2, 0.05))
  expect_identical(names(populations),
                   c("Rk_2_5_Hm_0_05", "Rk_4_6_Hm_0_05", "Rk_2_5_Hm_0_2", "Rk_4_6_Hm_0_2"))
  expect_identical(check_populations(populations), populations)
  expect_identical(length(populations), 4L)
  expect_identical(check_population(populations[[1]]), populations[[1]])

  populations <- ypr_populations(k = 0.12, Rk = c(2.5, 4.6), Hm = c(0.2, 0.05))
  expect_identical(names(populations),
                   c("Rk_2_5_Hm_0_05", "Rk_4_6_Hm_0_05", "Rk_2_5_Hm_0_2", "Rk_4_6_Hm_0_2"))
  expect_identical(check_populations(populations), populations)
  expect_identical(length(populations), 4L)
  expect_identical(check_population(populations[[1]]), populations[[1]])

  names(populations) <- NULL
  expect_warning(check_populations(populations), "elements of populations must be named")
})

test_that("ecotypes no arguments", {
  ecotypes <- ypr_ecotypes()
  expect_is(ecotypes, "ypr_ecotypes")
  expect_identical(length(ecotypes), 1L)
  expect_identical(names(ecotypes), "ecotype1")
  expect_identical(ecotypes[[1]], ypr_population())
  expect_identical(check_ecotypes(ecotypes), ecotypes)
})

test_that("ecotypes arguments length 1", {
  ecotypes <- ypr_ecotypes(Rk = 2.5)
  expect_is(ecotypes, "ypr_ecotypes")
  expect_identical(length(ecotypes), 1L)
  expect_identical(names(ecotypes), "ecotype1")
  expect_identical(ecotypes[[1]], ypr_population(Rk = 2.5))
  expect_identical(check_ecotypes(ecotypes), ecotypes)

  ecotypes <- ypr_ecotypes(Linf = 150)
  expect_is(ecotypes, "ypr_ecotypes")
  expect_identical(length(ecotypes), 1L)
  expect_identical(names(ecotypes), "ecotype1")
  expect_identical(ecotypes[[1]], ypr_population(Linf = 150))
})

test_that("ecotypes arguments length 2", {
  ecotypes <- ypr_ecotypes(Wb = c(3.4, 3.2))
  expect_is(ecotypes, "ypr_ecotypes")
  expect_identical(length(ecotypes), 2L)
  expect_identical(names(ecotypes), c("ecotype1", "ecotype2"))
  expect_identical(ecotypes[[1]], ypr_population(Wb = 3.4))
  expect_identical(ecotypes[[2]], ypr_population(Wb = 3.2))
  expect_identical(check_ecotypes(ecotypes), ecotypes)

  ecotypes <- ypr_ecotypes(Linf = c(150, 200))
  expect_is(ecotypes, "ypr_ecotypes")
  expect_identical(length(ecotypes), 2L)
  expect_identical(names(ecotypes), c("ecotype1", "ecotype2"))
  expect_identical(ecotypes[[1]], ypr_population(Linf = 150))
  expect_identical(ecotypes[[2]], ypr_population(Linf = 200))
  expect_identical(check_ecotypes(ecotypes), ecotypes)
})

test_that("ecotypes errors", {
  expect_error(ypr_ecotypes(Rk = c(3.4, 3.2)),
               "the following 1 parameter value must be scalars: 'Rk'")
  expect_error(ypr_ecotypes(k = 1:2, M = c(1, 3, 4)),
               "the following 1 parameter value must be scalars or vectors of the same length as the number of ecotypes [(]3[)]: 'k'")
    expect_error(ypr_ecotypes(k = -1),
               "the values in k must lie between 0.015 and 15")
})

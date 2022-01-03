test_that("ecotype converts data.frame", {
  expect_identical(as_ypr_ecotypes(as.data.frame(ypr_ecotypes())), ypr_ecotypes())
})

test_that("ecotype converts population", {
  expect_identical(as_ypr_ecotypes(ypr_population()), ypr_ecotypes())
})

test_that("ecotype converts populations", {
  expect_identical(as_ypr_ecotypes(ypr_populations(Linf = c(100, 200))), ypr_ecotypes(Linf = c(100, 200)))
})

test_that("ecotype converts ecotypes", {
  expect_identical(as_ypr_ecotypes(ypr_ecotypes()), ypr_ecotypes())
})

test_that("ecotypes default names are used", {
  ecotypes <- ypr_ecotypes(Linf = c(100, 1000))
  expect_named(ecotypes, c("Linf_100", "Linf_1000"))
})

test_that("ecotypes preserves names", {
  populations <- ypr_populations(Linf = c(100, 1000), names = c("thing1", "thing2"))
  expect_named(as_ypr_ecotypes(populations), c("thing1", "thing2"))
})

test_that("ecotypes will throw error if sr values are not the same", {
  expect_error(
    as_ypr_ecotypes(ypr_populations(Rk = c(10, 20))),
    "Rk must be the same across all elements."
  )


  expect_error(
    as_ypr_ecotypes(ypr_populations(BH = c(1L, 0L))),
    "BH must be the same across all elements."
  )

  expect_error(
    as_ypr_ecotypes(ypr_populations(tR = c(1L, 2L))),
    "tR must be the same across all elements."
  )

  expect_error(
    as_ypr_ecotypes(ypr_populations(Rmax = c(2, 3))),
    "Rmax must be the same across all elements."
  )

})

test_that("ecotypes will throw error if fishery values are not the same", {
  expect_error(
    as_ypr_ecotypes(ypr_populations(pi = c(0.1, 0.2))),
    "pi must be the same across all elements."
  )

  expect_error(
    as_ypr_ecotypes(ypr_populations(Nc = c(0, 1))),
    "Nc must be the same across all elements."
  )

  expect_error(
    as_ypr_ecotypes(ypr_populations(Hm = c(0, 1))),
    "Hm must be the same across all elements."
  )

  expect_error(
    as_ypr_ecotypes(ypr_populations(Llo = c(10, 100))),
    "Llo must be the same across all elements."
  )

  expect_error(
    as_ypr_ecotypes(ypr_populations(Lup = c(10, 100))),
    "Lup must be the same across all elements."
  )

  expect_error(
    as_ypr_ecotypes(ypr_populations(rho = c(0, 1))),
    "rho must be the same across all elements."
  )

  expect_error(
    as_ypr_ecotypes(ypr_populations(q = c(0, 1))),
    "q must be the same across all elements."
  )
})

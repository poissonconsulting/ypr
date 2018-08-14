context("tabulate")

test_that("ypr_tabulate_yield", {
  yield <- ypr_tabulate_yield(ypr_population())
  expect_identical(check_tabulated_yield(yield), yield)
  expect_identical(yield$Type, c("actual", "optimal"))

  yield <- ypr_tabulate_yield(ypr_population(), all = TRUE)
  expect_identical(check_tabulated_yield(yield, exclusive = FALSE),yield)
  expect_identical(ncol(yield), 34L)
  expect_identical(yield$Linf, c(100, 100))

  yield <- ypr_tabulate_yield(ypr_populations(Rk = c(3,5)))
  expect_identical(check_tabulated_yield(yield, exclusive = FALSE),yield)
  expect_identical(colnames(yield), c("Type", "pi", "Yield", "Age", "Length", "Weight", "Effort", "Rk"))
  expect_identical(nrow(yield), 4L)

  yield <- ypr_tabulate_yield(ypr_populations(Rk = c(3,5)), all = TRUE)
  expect_identical(check_tabulated_yield(yield, exclusive = FALSE),yield)
  expect_identical(ncol(yield), 34L)
  expect_identical(nrow(yield), 4L)

  yields <- ypr_tabulate_yields(ypr_population(), pi = seq(0, 1, length.out = 10))
  expect_identical(colnames(yields), c("pi", "Yield", "Age", "Length", "Weight", "Effort"))
  expect_identical(nrow(yields), 10L)
  expect_identical(check_tabulated_yields(yields), yields)
  expect_identical(yields$pi[1:2], c(0,1/9))
  expect_identical(yields$Effort, yields$pi * 100)
  expect_equal(yields$Yield[1:2], c(0,0.0738), tolerance = 1e-04)
  expect_equal(yields$Weight[1:2], c(NA,3057.662), tolerance = 1e-07)

  yields <- ypr_tabulate_yields(ypr_populations(Rk = c(3,5)), pi = seq(0, 1, length.out = 2))
  expect_identical(ncol(yields), 7L)
  expect_identical(nrow(yields), 4L)

  yields <- ypr_tabulate_yields(ypr_populations(Rk = c(3,5)), pi = seq(0, 1, length.out = 2)
                                ,all = TRUE)
  expect_identical(ncol(yields), 33L)
  expect_identical(nrow(yields), 4L)

  sr <- ypr_tabulate_sr(ypr_population())
  expect_identical(check_tabulated_sr(sr), sr)
  expect_identical(sr$Type, c("unfished", "actual", "optimal"))
  skip_if(length(tools::Rd_db("ypr")) == 0)
  parameters <- ypr_tabulate_parameters(ypr_population())
  expect_identical(parameters$Description[1], "The maximum age (yr).")
  expect_identical(check_tabulated_parameters(parameters), parameters)
  expect_identical(ypr_detabulate_parameters(ypr_tabulate_parameters(ypr_population(BH = 1L))),
                   ypr_population(BH = 1L))
})

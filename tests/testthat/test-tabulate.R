context("tabulate")

test_that("ypr_tabulate_yield", {
  yield <- ypr_tabulate_yield(ypr_population())
  expect_identical(check_tabulated_yield(yield), yield)
  expect_identical(yield$Type, c("actual", "optimal"))

  yields <- ypr_tabulate_yields(ypr_population(), pi = seq(0, 1, length.out = 10))
  expect_identical(colnames(yields), c("pi", "Yield", "Age", "Length", "Weight"))
  expect_identical(nrow(yields), 10L)
  expect_identical(yields$pi[1:2], c(0,1/9))
  expect_equal(yields$Yield[1:2], c(0,0.0738), tolerance = 1e-04)
  expect_equal(yields$Weight[1:2], c(NA,3057.662), tolerance = 1e-07)

  expect_identical(check_tabulated_yield(yield), yield)
  expect_identical(yield$Type, c("actual", "optimal"))

  sr <- ypr_tabulate_sr(ypr_population())
  expect_identical(check_tabulated_sr(sr), sr)
  expect_identical(sr$Type, c("unfished", "actual", "optimal"))
  skip_if(length(tools::Rd_db("ypr")) == 0)
  parameters <- ypr_tabulate_parameters(ypr_population())
  expect_identical(parameters$Description[1], "The maximum age (yr).")
  expect_identical(check_tabulated_parameters(parameters), parameters)
  expect_identical(ypr_import_parameters(ypr_tabulate_parameters(ypr_population(BH = 1L))),
                   ypr_population(BH = 1L))
})

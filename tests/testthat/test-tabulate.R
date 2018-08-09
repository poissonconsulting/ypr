context("tabulate")

test_that("ypr_tabulate_yield", {
  yield <- ypr_tabulate_yield(ypr_population())
  expect_identical(check_tabulated_yield(yield), yield)
  expect_identical(yield$Type, c("actual", "optimal"))
  sr <- ypr_tabulate_sr(ypr_population())
  expect_identical(check_tabulated_sr(sr), sr)
  expect_identical(sr$Type, c("unfished", "actual", "optimal"))
  parameters <- ypr_tabulate_parameters(ypr_population())
  expect_identical(parameters$Description[1], "The maximum age (yr).")
  expect_identical(check_tabulated_parameters(parameters), parameters)
  expect_identical(ypr_import_parameters(ypr_tabulate_parameters(ypr_population(BH = 1L))),
                   ypr_population(BH = 1L))
})

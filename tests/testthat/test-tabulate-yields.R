test_that("ypr_tabulate_yields", {
  yields <- ypr_tabulate_yields(ypr_populations(Rk = c(3, 5)), pi = seq(0, 1, length.out = 2))
  expect_identical(ncol(yields), 8L)
  expect_identical(nrow(yields), 4L)

  yields <- ypr_tabulate_yields(ypr_populations(Rk = c(3, 5)),
                                pi = seq(0, 1, length.out = 2),
                                all = TRUE
  )
  expect_identical(ncol(yields), 38L)
  expect_identical(nrow(yields), 4L)

  skip_if(length(tools::Rd_db("ypr")) == 0)
  parameters <- ypr_tabulate_parameters(ypr_population())
  expect_identical(parameters$Description[1], "The maximum age (yr).")

  expect_error(chk::check_data(
    parameters,
    values = list(
      Parameter = ypr:::.parameters$Parameter,
      Value = c(min(ypr:::.parameters$Lower), max(ypr:::.parameters$Upper)),
      Description = ""
    ),
    exclusive = TRUE,
    order = TRUE,
    nrow = c(nrow(ypr:::.parameters) - 1, nrow(ypr:::.parameters)),
    key = "Parameter"
  ), NA)

  expect_identical(
    ypr_detabulate_parameters(ypr_tabulate_parameters(ypr_population(BH = 1L))),
    ypr_population(BH = 1L)
  )
})

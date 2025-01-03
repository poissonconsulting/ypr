test_that("ypr_tabulate_parameters", {
  parameters <- ypr_tabulate_parameters(ypr_population())
  expect_identical(parameters$Parameter[1], "tmax")

  chk::check_data(
    parameters,
    values = list(
      Parameter = ypr:::.parameters$Parameter,
      Value = c(min(ypr:::.parameters$Lower), max(ypr:::.parameters$Upper)),
      Description = c("", NA)
    ),
    exclusive = TRUE,
    order = TRUE,
    nrow = rep(nrow(ypr:::.parameters), 3),
    key = "Parameter"
  )

  expect_identical(
    ypr_detabulate_parameters(ypr_tabulate_parameters(ypr_population(BH = 1L))),
    ypr_population(BH = 1L)
  )
})

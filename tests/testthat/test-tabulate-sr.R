test_that("ypr_tabulate_sr population", {
  sr <- ypr_tabulate_sr(ypr_population())

  expect_error(chk::check_data(
    sr,
    values = list(
      Type = c("unfished", "actual", "optimal"),
      pi = c(0, 1),
      u = c(0, 1),
      Eggs = c(0, .Machine$double.xmax),
      Recruits = c(0, .Machine$double.xmax),
      Spawners = c(0, .Machine$double.xmax),
      Fecundity = c(0, .Machine$double.xmax)
    ),
    nrow = TRUE,
    exclusive = TRUE,
    order = TRUE
  ), NA)

  expect_identical(sr$Type, c("unfished", "actual", "optimal"))
})

test_that("ypr_tabulate_sr populations", {
  sr <- ypr_tabulate_sr(ypr_populations(Rk = c(3, 5)))

  expect_error(chk::check_data(
    sr,
    values = list(
      Type = c("unfished", "actual", "optimal"),
      pi = c(0, 1),
      u = c(0, 1),
      Eggs = c(0, .Machine$double.xmax),
      Recruits = c(0, .Machine$double.xmax),
      Spawners = c(0, .Machine$double.xmax),
      Fecundity = c(0, .Machine$double.xmax),
      Rk = c(3, 3, 5)
    ),
    nrow = TRUE,
    exclusive = TRUE,
    order = TRUE
  ), NA)

  expect_identical(colnames(sr), c(
    "Type", "pi", "u", "Eggs", "Recruits",
    "Spawners", "Fecundity", "Rk"
  ))
  expect_identical(sr$Rk, c(3, 3, 3, 5, 5, 5))
})

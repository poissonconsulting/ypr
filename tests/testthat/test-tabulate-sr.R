test_that("ypr_tabulate_sr population", {
  sr <- ypr_tabulate_sr(ypr_population())

  expect_s3_class(sr, "tbl_df")
  expect_snapshot_data(sr, "srpopulation")
})

test_that("ypr_tabulate_sr populations", {
  sr <- ypr_tabulate_sr(ypr_populations(Rk = c(3, 5)))

  expect_s3_class(sr, "tbl_df")
  expect_snapshot_data(sr, "srpopulationRk")
})

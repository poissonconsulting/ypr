test_that("ypr_tabulate_fish population", {
  fish <- ypr_tabulate_fish(ypr_population(n = ypr:::inst2inter(0.2)))
  expect_s3_class(fish, "tbl_df")
  expect_snapshot_data(fish, "n0_2")
})

test_that("ypr_tabulate_fish population Length", {
  fish <- ypr_tabulate_fish(ypr_population(), x = "Length")
  expect_s3_class(fish, "tbl_df")
  expect_snapshot_data(fish, "length")
})

# test_that("ypr_tabulate_fish ecotypes 1", {
#   fish <- ypr_tabulate_fish(ypr_ecotypes())
#   expect_s3_class(fish, "tbl_df")
#   expect_snapshot_data(fish, "eco1")
# })
#
# test_that("ypr_tabulate_fish ecotypes 1", {
#   fish <- ypr_tabulate_fish(ypr_ecotypes(Linf = c(200, 600)))
#   expect_s3_class(fish, "tbl_df")
#   expect_snapshot_data(fish, "eco1")
# })

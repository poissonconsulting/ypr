test_that("ypr_tabulate_fish population 1", {
  fish <- ypr_tabulate_fish(ypr_population())
  expect_s3_class(fish, "tbl_df")
  expect_snapshot_data(fish, "pop1")
})

test_that("ypr_tabulate_fish ecotypes 1", {
  expect_identical(ypr_tabulate_fish(ypr_ecotypes()), ypr_tabulate_fish(ypr_population()))
})

test_that("ypr_tabulate_fish population n", {
  fish <- ypr_tabulate_fish(ypr_population(n = ypr:::inst2inter(0.2)))
  expect_s3_class(fish, "tbl_df")
  expect_snapshot_data(fish, "n0_2")
})

test_that("ypr_tabulate_fish population Length", {
  fish <- ypr_tabulate_fish(ypr_population(), x = "Length")
  expect_s3_class(fish, "tbl_df")
  expect_snapshot_data(fish, "length")
})

test_that("ypr_tabulate_fish population no fish", {
  fish <- ypr_tabulate_fish(ypr_population(n = 0.1))
  expect_s3_class(fish, "tbl_df")
  expect_snapshot_data(fish, "lowmortality")
})

test_that("ypr_tabulate_fish high Linf", {
  fish <- ypr_tabulate_fish(ypr_population(Linf = 140))
  expect_s3_class(fish, "tbl_df")
  expect_snapshot_data(fish, "highlinf")
})

test_that("ypr_tabulate_fish ecotype no fish", {
  expect_identical(ypr_tabulate_fish(ypr_ecotypes(n = 0.1)),
                   ypr_tabulate_fish(ypr_population(n = 0.1)))
})

test_that("ypr_tabulate_fish ecotypes 2 same", {
  expect_equal(ypr_tabulate_fish(ypr_ecotypes(Linf = c(100, 100.0000001))),
               ypr_tabulate_fish(ypr_population(Linf = 100)))
})

test_that("ypr_tabulate_fish ecotypes 2 diff", {
  expect_equal(ypr_tabulate_fish(ypr_ecotypes(Linf = c(100, 50), RPR = c(100, 0.00000000001))),
               ypr_tabulate_fish(ypr_population(Linf = 100)))
})

test_that("ypr_tabulate_fish ecotypes 2 other diff", {
  expect_equal(ypr_tabulate_fish(ypr_ecotypes(Linf = c(100, 50), RPR = c(0.00000000001, 100))),
               ypr_tabulate_fish(ypr_population(Linf = 50)))
})

test_that("ypr_tabulate_fish ecotypes 2 diff more", {
  fish <- ypr_tabulate_fish(ypr_ecotypes(Linf = c(100, 50), RPR = c(1, 1)))
  expect_s3_class(fish, "tbl_df")
  expect_snapshot_data(fish, "2diff")
})

test_that("ypr_tabulate_fish ecotypes weights correctly", {
  expect_identical(ypr_tabulate_fish(ypr_ecotypes(Linf = c(100, 50), RPR = c(1, 1))),
                   ypr_tabulate_fish(ypr_ecotypes(Linf = c(100, 50), RPR = c(100, 100))))
})

test_that("print population", {
  expect_snapshot_output(print(ypr_population()))
})

test_that("print populations", {
  expect_snapshot_output(print(ypr_populations(Rk = c(2.5, 4.6), Hm = c(0.2, 0.05))))
})

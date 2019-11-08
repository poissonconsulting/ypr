context("utils")

test_that("inst2inter", {
  expect_equal(inst2inter(inter2inst(0.5)), 0.5)
})

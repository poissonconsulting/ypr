context("ypr")

test_that("ypr", {

  ypr <- ypr(tmax = 20L, k = 1, Linf = 100, a = 1e-05, b = 3)
  expect_identical(checkr::check_data(ypr,
                              nrow = 20L + 1L,
                              values = list(t = c(0L, 20L),
                                            L = c(0, 100),
                                            W = c(0, 10),
                                            V = c(0, 1),
                                            S = c(0, 1)),
                              exclusive = TRUE,
                              order = TRUE), ypr)
})

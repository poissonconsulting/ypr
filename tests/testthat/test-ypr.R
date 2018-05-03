context("ypr")

test_that("ypr", {

  ypr <- ypr(tmax = 20L, k = 1, Linf = 100, a = 1e-05, b = 3)
  expect_identical(checkr::check_data(ypr,
                              nrow = 20L + 1L,
                              values = list(Age = c(0L, 20L),
                                            Length = c(0, 100),
                                            Weight = c(0, 10),
                                            Vulnerability = c(0, 1),
                                            Survivorship = c(0, 1),
                                            Fecundity = c(0, 1e+05)),
                              exclusive = TRUE,
                              order = TRUE), ypr)
})

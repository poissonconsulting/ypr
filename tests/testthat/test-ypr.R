context("ypr")

test_that("ypr", {

  ypr <- ypr()
  expect_identical(checkr::check_data(ypr,
                              nrow = 20L + 1L,
                              values = list(Age = c(0L, 20L),
                                            Length = c(0, 100),
                                            Weight = c(0, 10),
                                            Vulnerability = c(0, 1),
                                            Survivorship = c(0, 1),
                                            Fecundity = c(0, 10),
                                            RelativeFecundity = c(0, 0.6)),
                              exclusive = TRUE,
                              order = TRUE), ypr)
})

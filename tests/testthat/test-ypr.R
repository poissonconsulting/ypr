context("ypr")

test_that("ypr", {

  ypr <- ypr()
  expect_identical(checkr::check_data(ypr,
                              nrow = 20L,
                              values = list(Age = c(1L, 20L),
                                            Length = c(13, 100),
                                            Weight = c(0.02, 10),
                                            Vulnerability = c(0, 1),
                                            Survivorship = c(0, 1),
                                            Fecundity = c(0, 10)),
                              exclusive = TRUE,
                              order = TRUE), ypr)
})

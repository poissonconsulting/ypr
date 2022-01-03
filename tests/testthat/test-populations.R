test_that("ypr_populations works", {
  populations <- ypr_populations()
  expect_s3_class(populations, "ypr_populations")
  expect_length(populations, 1L)
  expect_snapshot_output(populations)
})

test_that("ypr_populations element is a population", {
  populations <- ypr_populations()
  expect_identical(populations[[1]], ypr_population())
})

test_that("ypr_populations creates an population with 2 elements", {
  populations <- ypr_populations(Linf = c(1, 2))
  expect_s3_class(populations, "ypr_populations")
  expect_length(populations, 2L)
  expect_snapshot_output(populations)
})

test_that("ypr_populations creates names", {
  populations <- ypr_populations(Linf = c(1, 2.5))
  expect_named(populations, c("Linf_1", "Linf_2_5"))
})

test_that("ypr_populations allows names to be specified", {
  populations <- ypr_populations(Linf = c(1, 2), names = c("t2", "t1"))
  expect_s3_class(populations, "ypr_populations")
  expect_length(populations, 2L)
  expect_named(populations, c("t2", "t1"))
})

test_that("ypr_populations creates populations with 2 elements even when parameters same if not expand", {
  populations <- ypr_populations(Linf = c(1, 1), expand = TRUE)
  expect_s3_class(populations, "ypr_populations")
  expect_length(populations, 1L)
  expect_snapshot_output(populations)
})

test_that("ypr_populations creates populations with 2 elements even when parameters same if not expand", {
  populations <- ypr_populations(Linf = c(1, 1), expand = FALSE)
  expect_s3_class(populations, "ypr_populations")
  expect_length(populations, 2L)
  expect_snapshot_output(populations)
})

test_that("ypr_populations creates 2 populations when 2 parameters are provided", {
  populations <- ypr_populations(Linf = c(1, 2), RPR = c(1, 1))
  expect_s3_class(populations, "ypr_populations")
  expect_length(populations, 2L)
  expect_snapshot_output(populations)
})

test_that("ypr_populations creates 2 populations when 3 parameters are provided and not expand", {
  populations <- ypr_populations(Linf = c(1, 2), k2 = c(0.15, 0.25), RPR = c(2, 1), expand = FALSE)
  expect_s3_class(populations, "ypr_populations")
  expect_length(populations, 2L)
  expect_snapshot_output(populations)
})

test_that("ypr_populations creates 8 populations when 3 parameters are provided and expand", {
  populations <- ypr_populations(Linf = c(1, 2), k2 = c(0.15, 0.25), RPR = c(2, 1),
                                 expand = TRUE)
  expect_s3_class(populations, "ypr_populations")
  expect_length(populations, 8L)
  expect_snapshot_output(populations)
})

test_that("ypr_populations preserves RPR", {
  populations <- ypr_populations(Linf = c(1, 2), RPR = c(1, 3.5), expand = FALSE)
  expect_equal(populations[[1]]$RPR, 1)
  expect_equal(populations[[2]]$RPR, 3.5)
})

test_that("as_ypr_populations works if sr values are not the same", {
  populations <- ypr_populations(Rk = c(10, 20),
                                 BH = c(1L, 0L),
                                 tR = c(1L, 2L),
                                 Rmax = c(2, 3), expand = FALSE)

  expect_length(populations, 2L)
  expect_snapshot_output(populations)
})

test_that("as_ypr_populations works if fishery values are not the same", {

  populations <- ypr_populations(  pi = c(0.1, 0.2),
                                   Nc = c(0, 1),
                                   Hm = c(0, 1),
                                   Llo = c(10, 100),
                                   Lup = c(10, 100),
                                   rho = c(0, 1),
                                   q = c(0, 1), expand = FALSE)

  expect_length(populations, 2L)
  expect_snapshot_output(populations)
})

test_that("populations", {
  populations <- ypr_populations()
  expect_identical(length(populations), 1L)
  expect_identical(populations[[1]], ypr_population())
})

test_that("populations expand = FALSE", {
  populations <- ypr_populations(Rk = c(2.5, 4.6), Hm = c(0.2, 0.05))
  expect_identical(
    names(populations),
    c("Rk_2_5_Hm_0_05", "Rk_4_6_Hm_0_05", "Rk_2_5_Hm_0_2", "Rk_4_6_Hm_0_2")
  )
  expect_identical(check_populations(populations), populations)
  expect_identical(length(populations), 4L)
  expect_identical(check_population(populations[[1]]), populations[[1]])

  populations <- ypr_populations(k = 0.12, Rk = c(2.5, 4.6), Hm = c(0.2, 0.05))
  expect_identical(
    names(populations),
    c("Rk_2_5_Hm_0_05", "Rk_4_6_Hm_0_05", "Rk_2_5_Hm_0_2", "Rk_4_6_Hm_0_2")
  )
  expect_identical(check_populations(populations), populations)
  expect_identical(length(populations), 4L)
  expect_identical(check_population(populations[[1]]), populations[[1]])
})

test_that("populations expand = FALSE", {
  populations <- ypr_populations(k = 0.12, Rk = c(2.5, 4.6, 5.0), Hm = c(0.2, 0.05))
  expect_identical(
    names(populations),
    c(
      "Rk_2_5_Hm_0_05", "Rk_4_6_Hm_0_05", "Rk_5_Hm_0_05", "Rk_2_5_Hm_0_2",
      "Rk_4_6_Hm_0_2", "Rk_5_Hm_0_2"
    )
  )
  expect_error(
    ypr_populations(
      k = 0.12, Rk = c(2.5, 4.6, 5.0),
      Hm = c(0.2, 0.05), expand = FALSE
    ),
    "^Non-scalar parameter values must all be the same length [(]not 2 and 3[)][.]$"
  )
  expect_error(
    ypr_populations(
      k = 0.12, Rk = c(2.5, 4.6, 5.0),
      Hm = c(0.2, 0.05), expand = FALSE
    ),
    "^Non-scalar parameter values must all be the same length [(]not 2 and 3[)][.]$"
  )

  expect_identical(
    names(ypr_populations(
      k = 0.12, Rk = c(2.5, 4.6),
      Hm = c(0.2, 0.05), expand = TRUE
    )),
    c("Rk_2_5_Hm_0_05", "Rk_4_6_Hm_0_05", "Rk_2_5_Hm_0_2", "Rk_4_6_Hm_0_2")
  )

  expect_identical(
    names(ypr_populations(
      k = 0.12, Rk = c(2.5, 4.6),
      Hm = c(0.2, 0.05), expand = FALSE
    )),
    c("Rk_2_5_Hm_0_2", "Rk_4_6_Hm_0_05")
  )

  expect_identical(
    names(ypr_populations(Rk = c(2.5, 4.6, 2.5), expand = FALSE)),
    c("Rk_2_5_Pop_1", "Rk_4_6", "Rk_2_5_Pop_2")
  )
  expect_identical(
    names(ypr_populations(Rk = c(2.5, 4.6, 2.5), Ls = c(60, 50, 50), expand = FALSE)),
    c("Ls_60_Rk_2_5", "Ls_50_Rk_4_6", "Ls_50_Rk_2_5")
  )
  expect_identical(
    names(ypr_populations(Rk = c(2.5, 4.6, 2.5), Ls = c(60, 50, 60), expand = FALSE)),
    c("Ls_60_Rk_2_5_Pop_1", "Ls_50_Rk_4_6", "Ls_60_Rk_2_5_Pop_2")
  )
})

test_that("populations names", {
  populations <- ypr_populations(Ls = c(50, 60), names = c("Name1", "Name2"))
  expect_identical(names(populations), c("Name1", "Name2"))
})

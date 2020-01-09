context("utils")

test_that("inst2inter", {
  expect_equal(inst2inter(inter2inst(0.5)), 0.5)
})


test_that("ypr_length_at_age", {
  expect_equal(
    ypr_length_at_age(ypr_population(), seq(0, 5, by = 0.5)),
    c(
      0, 7.22565136714471, 13.9292023574942, 20.1483781240623, 25.9181779318282,
      31.2710721209028, 36.2371848378227, 40.8444635633185, 45.1188363905974,
      49.0843579392451, 52.7633447258985
    )
  )

  expect_equal(
    ypr_length_at_age(ypr_population(L2 = 28, Linf2 = 200), seq(0, 5, by = 0.5)),
    c(
      0, 7.22565136714471, 13.9292023574942, 20.1483781240623, 25.9181779318282,
      35.8142278443789, 47.6777193347986, 58.6839962901497, 68.8949980442048,
      78.3681884104188, 87.1568790674243
    )
  )

  expect_equal(ypr_length_at_age(ypr_population(Linf = 43.9, k = 0.54, t0 = 0.65), 1),
    7.560172,
    tolerance = 1e-06
  )
})

test_that("ypr_length_at_age with biphasic growth", {

  pop1 <- ypr_population(tmax = 9L, k = 0.54, Linf = 43.90, t0 = 0.65,
                         k2 = 0.7, Linf2 = 82.56, L2 = -3.6)

  pop2 <- ypr_population_update(pop1, k2 = 0.27, Linf2 = 54.2)

  length1 <- ypr_length_at_age(pop1, 1:9L)
  length2 <- ypr_length_at_age(pop2, 1:9L)

  expect_equal(length1,
               c(7.56017235610119, 22.723028948946, 53.4078559389573, 68.0834736852762,
                 75.3711697821585, 78.9901325623683, 80.7872562939886, 81.679681528206,
                 82.122846784251))

  expect_equal(length2,
               c(7.56017235610119, 22.723028948946, 38.2853759487198, 42.0511023391726,
                 44.9257806469274, 47.1202511198824, 48.7954648798639, 50.0742887128647,
                 51.0505166038468))
})


test_that("ypr_age_at_length", {
  expect_equal(
    ypr_age_at_length(ypr_population(), seq(0, 100, by = 10)),
    c(
      0, 0.702403437718842, 1.48762367542806, 2.37783295959155, 3.40550415843994,
      4.62098120373297, 6.10860487916103, 8.02648536217291, 10.729586082894,
      15.350567286627, Inf
    )
  )

  expect_equal(
    ypr_age_at_length(ypr_population(L2 = 28, Linf2 = 200), seq(0, 100, by = 10)),
    c(
      0, 0.702403437718842, 1.48762367542806, 2.26800071156818, 2.67216485701108,
      3.10242166459489, 3.56237414117457, 4.05642728886605, 4.59004534002295,
      5.17012118662049, 5.80552238531599
    )
  )

  pop <- ypr_population(L2 = 28, Linf2 = 200)
  seq <- seq(0, 100, by = 10)

  expect_equal(ypr_length_at_age(pop, ypr_age_at_length(pop, seq)), seq)

  expect_equal(ypr_age_at_length(ypr_population(Linf = 43.9, k = 0.54, t0 = 0.65), 7.560172), 1, tolerance = 1e-07)
})

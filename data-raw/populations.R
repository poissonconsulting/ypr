library(ypr)

adams_bt_03 <- ypr_population(k = 0.13, Linf = 131, t0 = 0.2, Wb = 3.4,
                              Ls = 40, Lv = 40, M = ypr_inter2inst(0.3), pi = 0.06,
                              Hm = 0.15,
                              Rk = 3.8, Vp = 5)

chilliwack_bt_05 <- ypr_populations(k = 0.12, Linf = 86, t0 = 0.018,
                                   Wa = 0.022, Wb = 2.8,
                                   M = 0.19,
                                   Ls = 38.5,
                                   Lv = 36.5,
                                   Vp = 11.7,
                                   fa = 2.29,
                                   Rmax = 1000, # Population size was arbitrarily set to 1000
                                   Rk = c(2.5,4.6),
                                   Llo = c(0,60,1000),
                                   Nc = 0.15,
                                   Hm = c(0.05,0.2))

ypr_tabulate_yield(chilliwack_bt_05[[1]])

kootenay_bt_13 <- ypr_population(k = 0.19, t0 = 0.5, Wb = 3.04,
                                 Ls = 60, Vp = 5,
                                 Lv = 40, M = ypr_inter2inst(0.29),
                                 pi = 0.1, Rk = 5)

kootenay_rb_13 <- ypr_population(k = 0.25, t0 = 0.75, Wb = 3.39,
                                 Ls = 60, Vp = 5,
                                 Lv = 40, M = ypr_inter2inst(0.38), pi = 0.1, Rk = 10)

#kootenay_rb_17 <- ypr_population(k = 0.25, Wb = 3.39,
#                                 Ls = 60, Vp = 5,
#                                 Lv = 40, M = ypr_inter2inst(0.77), pi = 0.14,
#                                 Rk = 10, rho = Hm = Rmax = 100)

quesnel_bt <- ypr_population(k = 0.13, Linf = 100, Wb = 3.4,
                             Lv = 40, M = ypr_inter2inst(0.3), pi = 0.06, Rk = 3.8)

quesnel_lt <- ypr_population(k = 0.15, Linf = 100, Wb = 3.1,
                             Lv = 40, M = ypr_inter2inst(0.15), pi = 0.04, Rk = 2.5)

quesnel_rb <- ypr_population(k = 0.2, Linf = 100, Wb = 3,
                             Lv = 40, M = ypr_inter2inst(0.5), pi = 0.14, Rk = 6)

usethis::use_data(adams_bt_03, overwrite = TRUE)
usethis::use_data(chilliwack_bt_05, overwrite = TRUE)
usethis::use_data(kootenay_bt_13, overwrite = TRUE)
usethis::use_data(kootenay_rb_13, overwrite = TRUE)
usethis::use_data(quesnel_bt, overwrite = TRUE)
usethis::use_data(quesnel_lt, overwrite = TRUE)
usethis::use_data(quesnel_rb, overwrite = TRUE)

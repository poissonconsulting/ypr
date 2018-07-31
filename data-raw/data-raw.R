library(ypr)

adams_bt_03 <- ypr_population(k = 0.13, Linf = 131, t0 = 0.2, Wb = 3.4,
                              Lm = 40, Lv = 40, M = ypr_interval2instant(0.3), mu = 0.06,
                              eta = 0.15,
                              Rk = 3.8, Vp = 5)

chilliwack_bt_05 <- ypr_population(k = 0.12, Linf = 86, t0 = 0.018,
                                   Wb = 2.8, M = 0.2, Lm = 38.5,
                                   Lv = 50, Vp = 11.7,
                                   Rk = 4.6, Llo = 60, Nc = 0.15, eta = 0.2)

kootenay_bt_13 <- ypr_population(k = 0.19, t0 = 0.5, Wb = 3.04,
                                 Lm = 60, Vp = 5,
                                 Lv = 40, M = ypr_interval2instant(0.29),
                                 mu = 0.1, Rk = 5)

kootenay_rb_13 <- ypr_population(k = 0.25, t0 = 0.75, Wb = 3.39,
                                 Lm = 60, Vp = 5,
                                 Lv = 40, M = ypr_interval2instant(0.38), mu = 0.1, Rk = 10)

quesnel_bt <- ypr_population(k = 0.13, Linf = 1000, Wb = 3.4,
                             Lv = 400, M = ypr_interval2instant(0.3), mu = 0.06, Rk = 3.8)

quesnel_lt <- ypr_population(k = 0.15, Linf = 1000, Wb = 3.1,
                             Lv = 400, M = ypr_interval2instant(0.15), mu = 0.04, Rk = 2.5)

quesnel_rb <- ypr_population(k = 0.2, Linf = 1000, Wb = 3,
                             Lv = 400, M = ypr_interval2instant(0.5), mu = 0.14, Rk = 6)

usethis::use_data(adams_bt_03, overwrite = TRUE)
usethis::use_data(chilliwack_bt_05, overwrite = TRUE)
usethis::use_data(kootenay_bt_13, overwrite = TRUE)
usethis::use_data(kootenay_rb_13, overwrite = TRUE)
usethis::use_data(quesnel_bt, overwrite = TRUE)
usethis::use_data(quesnel_lt, overwrite = TRUE)
usethis::use_data(quesnel_rb, overwrite = TRUE)

plot(adams_bt_03)
ypr_plot(adams_bt_03)

plot(chilliwack_bt_05)
ypr_plot(chilliwack_bt_05)

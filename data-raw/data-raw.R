library(ypr)

quesnel_bt <- ypr_population(k = 0.13, Linf = 1000, a = 1.3e-08, b = 3.4,
                             Lv = 400, nu = 0.3, mu = 0.06, Rk = 3.8)

quesnel_lt <- ypr_population(k = 0.15, Linf = 1000, a = 6e-09, b = 3.1,
                             Lv = 400, nu = 0.15, mu = 0.04, Rk = 2.5)

quesnel_rb <- ypr_population(k = 0.2, Linf = 1000, a = 1.3e-08, b = 3,
                             Lv = 400, nu = 0.5, mu = 0.14, Rk = 6)

usethis::use_data(quesnel_bt, overwrite = TRUE)
usethis::use_data(quesnel_lt, overwrite = TRUE)
usethis::use_data(quesnel_rb, overwrite = TRUE)

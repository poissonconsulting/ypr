context("print")

test_that("print", {
  expect_identical(capture_output(print(ypr_population())),
    "tmax:  20\nk:     0.15\nLinf:  100\nt0:    0\nk2:    0.15\nLinf2: 100\nL2:    1000\nWb:    3\nLs:    50\nSp:    100\nes:    1\nSm:    0\nfb:    1\ntR:    1\nBH:    1\nRk:    3\nn:     0.2\nnL:    0.2\nLn:    50\nLv:    50\nVp:    100\nLlo:   0\nLup:   1000\nNc:    0\npi:    0.2\nrho:   0\nHm:    0\nRmax:  1\nWa:    0.01\nfa:    1\nq:     0.1")

  expect_identical(capture_output(print(ypr_populations(Rk = c(2.5, 4.6), Hm = c(0.2, 0.05)))),
    "tmax:  20\nk:     0.15\nLinf:  100\nt0:    0\nk2:    0.15\nLinf2: 100\nL2:    1000\nWb:    3\nLs:    50\nSp:    100\nes:    1\nSm:    0\nfb:    1\ntR:    1\nBH:    1\nRk:    2.5, 4.6, 2.5, 4.6\nn:     0.2\nnL:    0.2\nLn:    50\nLv:    50\nVp:    100\nLlo:   0\nLup:   1000\nNc:    0\npi:    0.2\nrho:   0\nHm:    0.05, 0.05, 0.2, 0.2\nRmax:  1\nWa:    0.01\nfa:    1\nq:     0.1")
})

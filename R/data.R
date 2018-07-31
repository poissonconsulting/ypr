#' Adams Lake Bull Trout Population Parameters
#'
#' A list of the estimates of the life-history parameters for
#' Bull Trout in Adams Lake, BC, adapted from Bison et al (2003).
#' @references Bison, R., O’Brien, D., and Martell, S.J.D. 2003. An Analysis of Sustainable Fishing Options for Adams Lake Bull Trout Using Life History and Telemetry Data. BC Ministry of Water Land and Air Protection, Kamloops, B.C.
#' @format An object of class \code{\link{ypr_population}}.
#' @examples
#' ypr_plot(adams_bt_03)
"adams_bt_03"

#' Chilliwack Lake Bull Trout Population Parameters
#'
#' A list of the estimates of the life-history parameters for
#' Bull Trout in Chilliwack Lake, BC, adapted from Taylor et al (2005).
#' @references Taylor, J.L. 2005. Sustainability of the Chilliwack Lake Char Fishery. Ministry of Water, Land and Air Protection, Surrey, B.C.
#' @format An object of class \code{\link{ypr_population}}.
#' @examples
#' ypr_plot(chilliwack_bt_05)
#' ypr_plot(ypr_population_update(chilliwack_bt_05, Rk = 2.5, Hm = 0.05, rho = 1))
"chilliwack_bt_05"

#' Kootenay Lake Bull Trout Population Parameters (2013)
#'
#' A list of the estimates of the life-history parameters for
#' Bull Trout in Kootenay Lake, BC, adapted from Andrusak and Thorley (2013).
#' The estimates should not be used for management.
#' @references Andrusak, G.F., and Thorley, J.L. 2013. Kootenay Lake Exploitation Study: Fishing and Natural Mortality of Large Rainbow Trout and Bull Trout: 2013 Annual Report. A Poisson Consulting Ltd. and Redfish Consulting Ltd. Report, Habitat Conservation Trust Foundation, Victoria, BC.
#' @format An object of class \code{\link{ypr_population}}.
#' @examples
#' ypr_plot(kootenay_bt_13)
#' ypr_plot(kootenay_bt_13, Ly = 75)
"kootenay_bt_13"

#' Kootenay Lake Rainbow Trout Population Parameters (2013)
#'
#' A list of the estimates of the life-history parameters for
#' Rainbow Trout in Kootenay Lake, BC, adapted from Andrusak and Thorley (2013).
#' The estimates should not be used for management.
#' @references Andrusak, G.F., and Thorley, J.L. 2013. Kootenay Lake Exploitation Study: Fishing and Natural Mortality of Large Rainbow Trout and Bull Trout: 2013 Annual Report. A Poisson Consulting Ltd. and Redfish Consulting Ltd. Report, Habitat Conservation Trust Foundation, Victoria, BC.
#' @format An object of class \code{\link{ypr_population}}.
#' @examples
#' ypr_plot(kootenay_rb_13)
#' ypr_plot(kootenay_rb_13, Ly = 80)
"kootenay_rb_13"

#' Quesnel Lake Bull Trout Population Parameters
#'
#' A list of the current best estimates of the life-history parameters for
#' Bull Trout in Quesnel Lake, BC.
#' The estimates are liable to change and should not be used for management.
#' @format An object of class \code{\link{ypr_population}}.
#' @examples
#' ypr_plot(quesnel_bt)
"quesnel_bt"

#' Quesnel Lake Lake Trout Population Parameters
#'
#' A list of the current best estimates of the life-history parameters for
#' Lake Trout in Quesnel Lake, BC.
#' The estimates are liable to change and should not be used for management.
#' @format An object of class \code{\link{ypr_population}}.
#' @examples
#' ypr_plot(quesnel_rb)
"quesnel_rb"

#' Quesnel Lake Rainbow Trout Population Parameters
#'
#' A list of the current best estimates of the life-history parameters for
#' Rainbow Trout in Quesnel Lake, BC.
#' The estimates are liable to change and should not be used for management.
#' @format An object of class \code{\link{ypr_population}}.
#' @examples
#' ypr_plot(quesnel_lt)
"quesnel_lt"

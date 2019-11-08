#' Parameter Descriptions for chk Functions
#' @param tmax The maximum age (yr).
#' @param k The VB growth coefficient (per yr).
#' @param Linf The VB mean maximum length (cm).
#' @param t0 The (theoretical) age at zero length (yr).
#' @param Wb The weight (as a function of length) scaling exponent.
#' @param Ls The length at which 50\% mature (cm).
#' @param Sp The maturity (as a function of length) power.
#' @param es The annual probability of a mature fish spawning.
#' @param Sm The spawning mortality probability.
#' @param fb The fecundity (as a function of weight) scaling exponent.
#' @param tR The age from which survival is density-independent (yr).
#' @param BH Recruitment follows a Beverton-Holt (1) or Ricker (0) relationship.
#' @param Rk The lifetime spawners per spawner at low density.
#' @param M The instantaneous mortality rate (per yr).
#' @param Mb The instantaneous mortality rate (as a function of length) scaling exponent.
#' @param Lv The length at which 50\% vulnerable to harvest (cm).
#' @param Vp The vulnerability to harvest (as a function of length) power.
#' @param Llo The lower harvest slot length (cm).
#' @param Lup The upper harvest slot length (cm).
#' @param Nc The slot limits non-compliance probability.
#' @param pi The annual capture probability.
#' @param rho The release probability.
#' @param Hm The hooking mortality probability.
#' @param Rmax The number of recruits at the carrying capacity (ind).
#' @param A0 The initial post age tR density independent mortality probability.
#' @param Wa The (extrapolated) weight of a 1 cm individual (g).
#' @param fa The (theoretical) fecundity of a 1 g female (eggs).
#' @param q The catchability (annual probability of capture) for a unit of effort.
#' @param all A flag indicating whether to include all parameter values.
#' @param u A flag indicating whether to plot the exploitation rate as opposed to the capture rate.
#' @param percent A flag specifying whether to plot the number of fish as a percent or frequency (the default).
#' @param color A string of the color around each bar (or NULL).
#' @param population An object of class [ypr_population()].
#' @param plot_values A flag indicating whether to plot the actual and optimal values.
#' @param Ly The minimum length (trophy) fish to consider when calculating the yield.
#' @param harvest A flag indicating whether to calculate the yield for harvested fish or captures.
#' @param biomass A flag indicating whether to calculate the yield in terms of the biomass versus number of individuals.
#' @param title A string of the report title.
#' @param date A date of the report date.
#' @param file A string of the file name.
#' @param binwidth A positive integer of the width of the bins for grouping.
#' @param type A string indicating whether to include 'both' or just the 'actual' or 'optimal' yield.
#' @param object The populations or populations.
#' @param ... Unused parameters.
#' @param view A flag specifying whether to view the report (after rendering it to html).
#' @keywords internal
#' @name params
NULL

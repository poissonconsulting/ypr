# Parameter Descriptions for ypr Package

Default parameter descriptions which may be overridden in individual
functions.

## Arguments

- ...:

  These dots are for future extensions and must be empty.

- tmax:

  The maximum age (yr).

- k:

  The VB growth coefficient (yr-1).

- Linf:

  The VB mean maximum length (cm).

- t0:

  The (theoretical) age at zero length (yr).

- k2:

  The VB growth coefficient after length L2 (yr-1).

- Linf2:

  The VB mean maximum length after length L2 (cm).

- L2:

  The length (or age if negative) at which growth switches from the
  first to second phase (cm or yr).

- Wb:

  The weight (as a function of length) scaling exponent.

- Ls:

  The length (or age if negative) at which 50 % mature (cm or yr).

- Sp:

  The maturity (as a function of length) power.

- es:

  The annual probability of a mature fish spawning.

- Sm:

  The spawning mortality probability.

- fb:

  The fecundity (as a function of weight) scaling exponent.

- tR:

  The age from which survival is density-independent (yr).

- BH:

  Recruitment follows a Beverton-Holt (1) or Ricker (0) relationship.

- Rk:

  The lifetime spawners per spawner at low density (or the egg to tR
  survival if between 0 and 1).

- n:

  The **annual interval** natural mortality rate from age tR.

- nL:

  The **annual interval** natural mortality rate from length Ln.

- Ln:

  The length (or age if negative) at which the annual interval natural
  mortality rate switches from n to nL (cm or yr).

- Lv:

  The length (or age if negative) at which 50 % vulnerable to harvest
  (cm or yr).

- Vp:

  The vulnerability to harvest (as a function of length) power.

- Llo:

  The lower harvest slot length (cm).

- Lup:

  The upper harvest slot length (cm).

- Nc:

  The slot limits non-compliance probability.

- pi:

  A vector of probabilities of capture to calculate the yield for.

- rho:

  The release probability.

- Hm:

  The hooking mortality probability.

- Rmax:

  The number of recruits at the carrying capacity (ind).

- Wa:

  The (extrapolated) weight of a 1 cm individual (g).

- fa:

  The (theoretical) fecundity of a 1 g female (eggs).

- q:

  The catchability (annual probability of capture) for a unit of effort.

- RPR:

  The relative proportion of recruits that are of the ecotype.

- all:

  A flag specifying whether to include all parameter values.

- u:

  A flag specifying whether to plot the exploitation rate as opposed to
  the capture rate.

- percent:

  A flag specifying whether to plot the number of fish as a percent or
  frequency (the default).

- color:

  A string of the color around each bar (or NULL).

- population:

  An object of class
  [`ypr_population()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_population.md).

- populations:

  An object of class
  [`ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations.md).

- ecotypes:

  An object of class
  [`ypr_ecotypes()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_ecotypes.md).

- plot_values:

  A flag specifying whether to plot the actual and optimal values.

- Ly:

  The minimum length (trophy) fish to consider when calculating the
  yield (cm).

- harvest:

  A flag specifying whether to calculate the yield for harvested fish or
  captures.

- biomass:

  A flag specifying whether to calculate the yield in terms of the
  biomass versus number of individuals.

- title:

  A string of the report title.

- date:

  A date of the report date.

- file:

  A string of the path to the file (without the extension).

- binwidth:

  A positive integer of the width of the bins for grouping.

- type:

  A string indicating whether to include 'both' or just the 'actual' or
  'optimal' yield.

- object:

  The population or populations.

- expand:

  A flag specifying whether to expand parameter combinations.

- view:

  A flag specifying whether to view the report (after rendering it to
  html).

- ask:

  A flag specifying whether to ask before overwriting or creating a
  file.

- description:

  A string describing the population.

- age:

  A numeric vector of the age (yr).

- length:

  A numeric vector of the length (cm).

- names:

  A character vector of unique ecotype names.

- x:

  The object to coerce.

## Details

A flag is a non-missing logical scalar.

A string is a non-missing character scalar.

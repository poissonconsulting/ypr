
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis build
status](https://travis-ci.org/poissonconsulting/ypr.svg?branch=master)](https://travis-ci.org/poissonconsulting/ypr)
[![Coverage
status](https://codecov.io/gh/poissonconsulting/ypr/branch/master/graph/badge.svg)](https://codecov.io/github/poissonconsulting/ypr?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

# ypr

ypr is an implementation of yield per recruit methods for recreational
fisheries in R. Given a list of life history parameters it can generate
a data frame of the schedule and find the capture rate which maximises
the yield. The yield, which is provided in terms of the proportion of
the unfished population, can be based on the total biomass vs number of
fish; harvested vs captured and large (trophy) versus all fish.

The key life history parameters are

  - The growth coefficient (\(k\)) and mean maximum length
    (\(L_\infty\)) from the Von Bertalanffy growth curve
    \(L = L_\infty \cdot (1 - \exp(-k \cdot \text{age}))\).
  - The condition scaling exponent (\(\beta\)) from the weight-length
    relationship \(W = \alpha \cdot L^\beta\)
  - The fecundity scaling exponent (\(\beta_f\)) from the
    fecundity-weight relationship \(F = \alpha_f \cdot W^{\beta_f}\)
  - The length at maturity (\(L_m\))
  - The length at which vulnerable to harvest (\(L_v\))
  - The number of spawners per spawner at low density (\(R_k\))

## Demonstration

``` r
library(ypr)
population <- ypr_population()
ypr_schedule(population)
#> # A tibble: 20 x 9
#>      Age Length  Weight Fecundity NaturalMortality Capture Release
#>    <int>  <dbl>   <dbl>     <dbl>            <dbl>   <dbl>   <dbl>
#>  1     1   13.9   2703.        0               0.2     0         1
#>  2     2   25.9  17411.        0               0.2     0         1
#>  3     3   36.2  47584.        0               0.2     0         1
#>  4     4   45.1  91849.        0               0.2     0         1
#>  5     5   52.8 146892.   146892.              0.2     0.2       0
#>  6     6   59.3 208982.   208982.              0.2     0.2       0
#>  7     7   65.0 274704.   274704.              0.2     0.2       0
#>  8     8   69.9 341248.   341248.              0.2     0.2       0
#>  9     9   74.1 406473.   406473.              0.2     0.2       0
#> 10    10   77.7 468862.   468862.              0.2     0.2       0
#> 11    11   80.8 527416.   527416.              0.2     0.2       0
#> 12    12   83.5 581558.   581558.              0.2     0.2       0
#> 13    13   85.8 631024.   631024.              0.2     0.2       0
#> 14    14   87.8 675781.   675781.              0.2     0.2       0
#> 15    15   89.5 715958.   715958.              0.2     0.2       0
#> 16    16   90.9 751789.   751789.              0.2     0.2       0
#> 17    17   92.2 783569.   783569.              0.2     0.2       0
#> 18    18   93.3 811630.   811630.              0.2     0.2       0
#> 19    19   94.2 836311.   836311.              0.2     0.2       0
#> 20    20   95.0 857952.   857952.              1       0.2       0
#> # ... with 2 more variables: FishingMortality <dbl>, Productivity <dbl>
ypr_plot(population)
```

<img src="man/figures/README-unnamed-chunk-1-1.png" width="100%" />

## Assumptions and Limitation

The calculations assume that growth follows a von Bertalanffy growth
curve; maturation is length based; natural mortality is constant;
vulnerability to the fishery is knife-edged; and capture, release and
hooking mortality are constant. It also assumes that a released
individual cannot be recaught in the same year. The results suffers from
the same limitations as all yield per recruit methods.

## Installation

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/ypr)

    # install.packages("devtools")
    devtools::install_github("poissonconsulting/ypr")

To install the latest development version from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

    # install.packages("drat")
    drat::addRepo("poissonconsulting")
    install.packages("ypr")

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/ypr/issues).

[Pull requests](https://github.com/poissonconsulting/ypr/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.

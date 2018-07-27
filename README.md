
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis build
status](https://travis-ci.org/poissonconsulting/ypr.svg?branch=master)](https://travis-ci.org/poissonconsulting/ypr)
[![Coverage
status](https://codecov.io/gh/poissonconsulting/ypr/branch/master/graph/badge.svg)](https://codecov.io/github/poissonconsulting/ypr?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

# ypr

## Introduction

`ypr` is an R package that implements yield per recruit methods (Walters
and Martell 2004).

The yield, which is provided in terms of the proportion of the unfished
population, can be based on the total biomass vs number of fish,
harvested vs captured and large (trophy) versus all fish.

The yield can also be calculated with lower and upper limits that
represent the uncertainty in one or more life history parameters.

The key life history parameters are

  - The growth coefficient (`k`) and mean maximum length (`Linf`) from
    the Von Bertalanffy growth curve
  - The condition scaling exponent (`b`) from the weight-length
    relationship
  - The length at maturity (`Lm`)
  - The length at which 50% vulnerable to harvest (`Lv`)
  - The number of spawners per spawner at low density (`Rk`)

The calculations do not account for environmental fluctuations,
predator-prey dynamics, angler responses or density-dependent growth.

## Demonstration

``` r
library(ypr)
population <- ypr_population(Rk = 3)
ypr_schedule(population)
#> # A tibble: 20 x 10
#>      Age Length  Weight Fecundity NaturalMortality Vulnerability  Capture
#>    <int>  <dbl>   <dbl>     <dbl>            <dbl>         <dbl>    <dbl>
#>  1     1   13.9   2703.        0               0.2       0.00168 0.000335
#>  2     2   25.9  17411.        0               0.2       0.0361  0.00722 
#>  3     3   36.2  47584.        0               0.2       0.167   0.0333  
#>  4     4   45.1  91849.        0               0.2       0.374   0.0749  
#>  5     5   52.8 146892.   146892.              0.2       0.567   0.113   
#>  6     6   59.3 208982.   208982.              0.2       0.702   0.140   
#>  7     7   65.0 274704.   274704.              0.2       0.788   0.158   
#>  8     8   69.9 341248.   341248.              0.2       0.842   0.168   
#>  9     9   74.1 406473.   406473.              0.2       0.877   0.175   
#> 10    10   77.7 468862.   468862.              0.2       0.901   0.180   
#> 11    11   80.8 527416.   527416.              0.2       0.917   0.183   
#> 12    12   83.5 581558.   581558.              0.2       0.928   0.186   
#> 13    13   85.8 631024.   631024.              0.2       0.937   0.187   
#> 14    14   87.8 675781.   675781.              0.2       0.943   0.189   
#> 15    15   89.5 715958.   715958.              0.2       0.948   0.190   
#> 16    16   90.9 751789.   751789.              0.2       0.952   0.190   
#> 17    17   92.2 783569.   783569.              0.2       0.955   0.191   
#> 18    18   93.3 811630.   811630.              0.2       0.958   0.192   
#> 19    19   94.2 836311.   836311.              0.2       0.960   0.192   
#> 20    20   95.0 857952.   857952.              1         0.961   0.192   
#> # ... with 3 more variables: Release <dbl>, FishingMortality <dbl>,
#> #   Productivity <dbl>
ypr_plot(population)
```

<img src="man/figures/README-unnamed-chunk-1-1.png" width="100%" />

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

## References

<div id="refs" class="references">

<div id="ref-walters_fisheries_2004">

Walters, Carl J., and Steven J. D. Martell. 2004. *Fisheries Ecology and
Management*. Princeton, N.J: Princeton University Press.

</div>

</div>

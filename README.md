
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

`ypr` is an R package that implements equilibrium-based yield per
recruit methods (Walters and Martell 2004).

The yield can be based on the number of fish caught (or harvested) or
biomass caught (or harvested) for all fish or just large (trophy)
individuals.

The key life history parameters are

  - The growth coefficient (`k`) and mean maximum length (`Linf`) from
    the Von Bertalanffy growth curve
  - The length at which 50% spawning (`Ls`)
  - The length at which 50% vulnerable to harvest (`Lv`)
  - The number of spawners per spawner at low density (`Rk`)

There are 18 additional advanced parameters and three scaling
parameters. From more information type `?ypr_population`.

The calculations do not account for parameter uncertainty, environmental
fluctuations, predator-prey dynamics, angler responses or
density-dependent growth.

## Demonstration

``` r
library(ypr)
population <- ypr_population(Rk = 10)
ypr_plot_yield(population)
```

<img src="man/figures/README-unnamed-chunk-1-1.png" width="100%" />

``` r
ypr_tabulate_yield(population)
#> # A tibble: 2 x 3
#>   Type       pi Yield
#>   <chr>   <dbl> <dbl>
#> 1 actual  0.2   0.214
#> 2 optimal 0.272 0.223
```

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

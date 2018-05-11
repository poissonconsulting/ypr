---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build status](https://travis-ci.org/poissonconsulting/ypr.svg?branch=master)](https://travis-ci.org/poissonconsulting/ypr)
[![Coverage status](https://codecov.io/gh/poissonconsulting/ypr/branch/master/graph/badge.svg)](https://codecov.io/github/poissonconsulting/ypr?branch=master)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

# ypr

ypr is an implementation of yield per recruit methods for 
recreational fisheries in R.
Given a list of life history parameters it can generate a data frame
of the schedule and find the capture rate which maximises the yield. 
The yield can be based on the total biomass vs number of fish; 
harvested vs captured and large versus all fish.

## Demonstration


```r
library(ypr)
population <- ypr_population()
ypr_schedule(population)
#> # A tibble: 20 x 9
#>      Age Length Weight Fecundity NaturalMortality Capture Release
#>    <int>  <dbl>  <dbl>     <dbl>            <dbl>   <dbl>   <dbl>
#>  1     1   13.9 0.0270      0                 0.2     0         1
#>  2     2   25.9 0.174       0                 0.2     0         1
#>  3     3   36.2 0.476       0                 0.2     0         1
#>  4     4   45.1 0.918       0                 0.2     0         1
#>  5     5   52.8 1.47        1.47              0.2     0.2       0
#>  6     6   59.3 2.09        2.09              0.2     0.2       0
#>  7     7   65.0 2.75        2.75              0.2     0.2       0
#>  8     8   69.9 3.41        3.41              0.2     0.2       0
#>  9     9   74.1 4.06        4.06              0.2     0.2       0
#> 10    10   77.7 4.69        4.69              0.2     0.2       0
#> 11    11   80.8 5.27        5.27              0.2     0.2       0
#> 12    12   83.5 5.82        5.82              0.2     0.2       0
#> 13    13   85.8 6.31        6.31              0.2     0.2       0
#> 14    14   87.8 6.76        6.76              0.2     0.2       0
#> 15    15   89.5 7.16        7.16              0.2     0.2       0
#> 16    16   90.9 7.52        7.52              0.2     0.2       0
#> 17    17   92.2 7.84        7.84              0.2     0.2       0
#> 18    18   93.3 8.12        8.12              0.2     0.2       0
#> 19    19   94.2 8.36        8.36              0.2     0.2       0
#> 20    20   95.0 8.58        8.58              1       0.2       0
#> # ... with 2 more variables: FishingMortality <dbl>, Productivity <dbl>
ypr_plot(population)
```

<img src="man/figures/README-unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="100%" />


## Assumptions and Limitation

The calculations assume that growth follows a von Bertalanffy growth curve;
maturation is length based;
natural mortality is constant;
vulnerability to the fishery is knife-edged;
and capture, release and hooking mortality are constant.
It also assumes that a released individual cannot be recaught in the same year.
The results suffers from the same limitations as all yield per recruit methods.

## Installation

To install the latest development version from [GitHub](https://github.com/poissonconsulting/ypr)
```
# install.packages("devtools")
devtools::install_github("poissonconsulting/ypr")
```

To install the latest development version from the Poisson drat [repository](https://github.com/poissonconsulting/drat)
```
# install.packages("drat")
drat::addRepo("poissonconsulting")
install.packages("ypr")
```

## Citation


```

To cite package 'ypr' in publications use:

  Joe Thorley (2018). ypr: Yield Per Recruit for Recreational
  Fisheries. R package version 0.0.0.9004.
  https://github.com/poissonconsulting/ypr

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {ypr: Yield Per Recruit for Recreational Fisheries},
    author = {Joe Thorley},
    year = {2018},
    note = {R package version 0.0.0.9004},
    url = {https://github.com/poissonconsulting/ypr},
  }
```

## Contribution

Please report any [issues](https://github.com/poissonconsulting/ypr/issues).

[Pull requests](https://github.com/poissonconsulting/ypr/pulls) are always welcome.

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

# Life-History Schedule

Generates the life-history schedule by age for a population.

## Usage

``` r
ypr_tabulate_schedule(object, ...)

# S3 method for class 'ypr_population'
ypr_tabulate_schedule(object, ...)

# S3 method for class 'ypr_ecotypes'
ypr_tabulate_schedule(object, ...)
```

## Arguments

- object:

  The population or populations.

- ...:

  These dots are for future extensions and must be empty.

## Value

A tibble of the life-history schedule by age.

## Methods (by class)

- `ypr_tabulate_schedule(ypr_population)`: Tabulate Schedule

- `ypr_tabulate_schedule(ypr_ecotypes)`: Tabulate Schedule

## See also

Other tabulate:
[`ypr_detabulate_parameters()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_detabulate_parameters.md),
[`ypr_report()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_report.md),
[`ypr_tabulate_biomass()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_biomass.md),
[`ypr_tabulate_fish()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_fish.md),
[`ypr_tabulate_parameters()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_parameters.md),
[`ypr_tabulate_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_sr.md),
[`ypr_tabulate_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yield.md),
[`ypr_tabulate_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yields.md)

Other schedule:
[`ypr_plot_schedule()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_schedule.md)

## Examples

``` r
ypr_tabulate_schedule(ypr_population())
#> # A tibble: 20 × 11
#>      Age Length Weight Fecundity  Spawning NaturalMortality Vulnerability
#>    <int>  <dbl>  <dbl>     <dbl>     <dbl>            <dbl>         <dbl>
#>  1     1   13.9   27.0      27.0 3.13 e-56              0.2     3.13 e-56
#>  2     2   25.9  174.      174.  2.91 e-29              0.2     2.91 e-29
#>  3     3   36.2  476.      476.  1.04 e-14              0.2     1.04 e-14
#>  4     4   45.1  918.      918.  3.46 e- 5              0.2     3.46 e- 5
#>  5     5   52.8 1469.     1469.  9.95 e- 1              0.2     9.95 e- 1
#>  6     6   59.3 2090.     2090.  1.000e+ 0              0.2     1.000e+ 0
#>  7     7   65.0 2747.     2747.  1.000e+ 0              0.2     1.000e+ 0
#>  8     8   69.9 3412.     3412.  1.000e+ 0              0.2     1.000e+ 0
#>  9     9   74.1 4065.     4065.  1    e+ 0              0.2     1    e+ 0
#> 10    10   77.7 4689.     4689.  1    e+ 0              0.2     1    e+ 0
#> 11    11   80.8 5274.     5274.  1    e+ 0              0.2     1    e+ 0
#> 12    12   83.5 5816.     5816.  1    e+ 0              0.2     1    e+ 0
#> 13    13   85.8 6310.     6310.  1    e+ 0              0.2     1    e+ 0
#> 14    14   87.8 6758.     6758.  1    e+ 0              0.2     1    e+ 0
#> 15    15   89.5 7160.     7160.  1    e+ 0              0.2     1    e+ 0
#> 16    16   90.9 7518.     7518.  1    e+ 0              0.2     1    e+ 0
#> 17    17   92.2 7836.     7836.  1    e+ 0              0.2     1    e+ 0
#> 18    18   93.3 8116.     8116.  1    e+ 0              0.2     1    e+ 0
#> 19    19   94.2 8363.     8363.  1    e+ 0              0.2     1    e+ 0
#> 20    20   95.0 8580.     8580.  1    e+ 0              0.2     1    e+ 0
#> # ℹ 4 more variables: Retention <dbl>, FishingMortality <dbl>,
#> #   Survivorship <dbl>, FishedSurvivorship <dbl>
ypr_tabulate_schedule(ypr_ecotypes(Linf = c(10, 20)))
#> # A tibble: 40 × 13
#>      Age Length Weight Fecundity  Spawning NaturalMortality Vulnerability
#>    <int>  <dbl>  <dbl>     <dbl>     <dbl>            <dbl>         <dbl>
#>  1     1   1.39 0.0270    0.0270 3.13e-156              0.2     3.13e-156
#>  2     2   2.59 0.174     0.174  2.91e-129              0.2     2.91e-129
#>  3     3   3.62 0.476     0.476  1.04e-114              0.2     1.04e-114
#>  4     4   4.51 0.918     0.918  3.46e-105              0.2     3.46e-105
#>  5     5   5.28 1.47      1.47   2.17e- 98              0.2     2.17e- 98
#>  6     6   5.93 2.09      2.09   2.75e- 93              0.2     2.75e- 93
#>  7     7   6.50 2.75      2.75   2.50e- 89              0.2     2.50e- 89
#>  8     8   6.99 3.41      3.41   3.46e- 86              0.2     3.46e- 86
#>  9     9   7.41 4.06      4.06   1.18e- 83              0.2     1.18e- 83
#> 10    10   7.77 4.69      4.69   1.37e- 81              0.2     1.37e- 81
#> # ℹ 30 more rows
#> # ℹ 6 more variables: Retention <dbl>, FishingMortality <dbl>,
#> #   Survivorship <dbl>, FishedSurvivorship <dbl>, Ecotype <chr>,
#> #   Proportion <dbl>
```

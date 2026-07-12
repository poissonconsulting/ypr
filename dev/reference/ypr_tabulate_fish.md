# Tabulate Fish Numbers

Produces a data frame of the number of fish in the 'Survivors',
'Spawners', 'Caught', 'Harvested', 'Released' and 'HandlingMortalities'
categories by 'Length', 'Age' or 'Weight' class and 'Ecotype' (NA if not
applicable)

## Usage

``` r
ypr_tabulate_fish(population, x = "Age", binwidth = 1L)
```

## Arguments

- population:

  An object of class
  [`ypr_population()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_population.md).

- x:

  The object to coerce.

- binwidth:

  A positive integer of the width of the bins for grouping.

## Value

A data frame

## See also

Other tabulate:
[`ypr_detabulate_parameters()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_detabulate_parameters.md),
[`ypr_report()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_report.md),
[`ypr_tabulate_biomass()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_biomass.md),
[`ypr_tabulate_parameters()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_parameters.md),
[`ypr_tabulate_schedule()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_schedule.md),
[`ypr_tabulate_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_sr.md),
[`ypr_tabulate_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yield.md),
[`ypr_tabulate_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yields.md)

Other fish:
[`ypr_plot_fish()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_fish.md)

## Examples

``` r
ypr_tabulate_fish(ypr_population())
#> # A tibble: 20 × 8
#>      Age Survivors Spawners   Caught Harvested Released HandlingMortalities
#>    <dbl>     <dbl>    <dbl>    <dbl>     <dbl>    <dbl>               <dbl>
#>  1     1 0.186     5.82e-57 1.16e-57  1.16e-57        0                   0
#>  2     2 0.149     4.32e-30 8.64e-31  8.64e-31        0                   0
#>  3     3 0.119     1.24e-15 2.48e-16  2.48e-16        0                   0
#>  4     4 0.0951    3.29e- 6 6.58e- 7  6.58e- 7        0                   0
#>  5     5 0.0761    7.58e- 2 1.52e- 2  1.52e- 2        0                   0
#>  6     6 0.0488    4.88e- 2 9.75e- 3  9.75e- 3        0                   0
#>  7     7 0.0312    3.12e- 2 6.24e- 3  6.24e- 3        0                   0
#>  8     8 0.0200    2.00e- 2 3.99e- 3  3.99e- 3        0                   0
#>  9     9 0.0128    1.28e- 2 2.56e- 3  2.56e- 3        0                   0
#> 10    10 0.00818   8.18e- 3 1.64e- 3  1.64e- 3        0                   0
#> 11    11 0.00524   5.24e- 3 1.05e- 3  1.05e- 3        0                   0
#> 12    12 0.00335   3.35e- 3 6.70e- 4  6.70e- 4        0                   0
#> 13    13 0.00214   2.14e- 3 4.29e- 4  4.29e- 4        0                   0
#> 14    14 0.00137   1.37e- 3 2.74e- 4  2.74e- 4        0                   0
#> 15    15 0.000878  8.78e- 4 1.76e- 4  1.76e- 4        0                   0
#> 16    16 0.000562  5.62e- 4 1.12e- 4  1.12e- 4        0                   0
#> 17    17 0.000360  3.60e- 4 7.20e- 5  7.20e- 5        0                   0
#> 18    18 0.000230  2.30e- 4 4.61e- 5  4.61e- 5        0                   0
#> 19    19 0.000147  1.47e- 4 2.95e- 5  2.95e- 5        0                   0
#> 20    20 0.0000943 9.43e- 5 1.89e- 5  1.89e- 5        0                   0
#> # ℹ 1 more variable: Ecotype <chr>
```

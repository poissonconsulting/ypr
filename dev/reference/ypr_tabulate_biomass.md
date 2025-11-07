# Tabulate Biomass (and Eggs)

Produces a data frame of the 'Weight' and 'Fecundity' and the number of
'Survivors' and 'Spawners' and the total 'Biomass' and 'Eggs' by 'Age'
class.

## Usage

``` r
ypr_tabulate_biomass(population)
```

## Arguments

- population:

  An object of class
  [`ypr_population()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_population.md).

## Value

A data frame

## See also

Other tabulate:
[`ypr_detabulate_parameters()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_detabulate_parameters.md),
[`ypr_report()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_report.md),
[`ypr_tabulate_fish()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_fish.md),
[`ypr_tabulate_parameters()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_parameters.md),
[`ypr_tabulate_schedule()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_schedule.md),
[`ypr_tabulate_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_sr.md),
[`ypr_tabulate_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yield.md),
[`ypr_tabulate_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yields.md)

Other biomass:
[`ypr_plot_biomass()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_biomass.md)

## Examples

``` r
ypr_tabulate_biomass(ypr_population())
#> # A tibble: 20 × 8
#>      Age Length Weight Fecundity Survivors Spawners Biomass     Eggs
#>    <int>  <dbl>  <dbl>     <dbl>     <dbl>    <dbl>   <dbl>    <dbl>
#>  1     1   13.9   27.0      27.0 0.186     5.82e-57   5.02  7.86e-56
#>  2     2   25.9  174.      174.  0.149     4.32e-30  25.9   3.76e-28
#>  3     3   36.2  476.      476.  0.119     1.24e-15  56.6   2.95e-13
#>  4     4   45.1  918.      918.  0.0951    3.29e- 6  87.4   1.51e- 3
#>  5     5   52.8 1469.     1469.  0.0761    7.58e- 2 112.    5.56e+ 1
#>  6     6   59.3 2090.     2090.  0.0488    4.88e- 2 102.    5.10e+ 1
#>  7     7   65.0 2747.     2747.  0.0312    3.12e- 2  85.7   4.29e+ 1
#>  8     8   69.9 3412.     3412.  0.0200    2.00e- 2  68.2   3.41e+ 1
#>  9     9   74.1 4065.     4065.  0.0128    1.28e- 2  52.0   2.60e+ 1
#> 10    10   77.7 4689.     4689.  0.00818   8.18e- 3  38.4   1.92e+ 1
#> 11    11   80.8 5274.     5274.  0.00524   5.24e- 3  27.6   1.38e+ 1
#> 12    12   83.5 5816.     5816.  0.00335   3.35e- 3  19.5   9.74e+ 0
#> 13    13   85.8 6310.     6310.  0.00214   2.14e- 3  13.5   6.77e+ 0
#> 14    14   87.8 6758.     6758.  0.00137   1.37e- 3   9.28  4.64e+ 0
#> 15    15   89.5 7160.     7160.  0.000878  8.78e- 4   6.29  3.14e+ 0
#> 16    16   90.9 7518.     7518.  0.000562  5.62e- 4   4.23  2.11e+ 0
#> 17    17   92.2 7836.     7836.  0.000360  3.60e- 4   2.82  1.41e+ 0
#> 18    18   93.3 8116.     8116.  0.000230  2.30e- 4   1.87  9.34e- 1
#> 19    19   94.2 8363.     8363.  0.000147  1.47e- 4   1.23  6.16e- 1
#> 20    20   95.0 8580.     8580.  0.0000943 9.43e- 5   0.809 4.05e- 1
```

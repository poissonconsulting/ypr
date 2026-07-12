# Tabulate Stock-Recruitment Parameters

Tabulate Stock-Recruitment Parameters

## Usage

``` r
ypr_tabulate_sr(object, ...)

# Default S3 method
ypr_tabulate_sr(
  object,
  Ly = 0,
  harvest = TRUE,
  biomass = FALSE,
  all = FALSE,
  ...
)

# S3 method for class 'ypr_populations'
ypr_tabulate_sr(
  object,
  Ly = 0,
  harvest = TRUE,
  biomass = FALSE,
  all = FALSE,
  ...
)
```

## Arguments

- object:

  The population or populations.

- ...:

  These dots are for future extensions and must be empty.

- Ly:

  The minimum length (trophy) fish to consider when calculating the
  yield (cm).

- harvest:

  A flag specifying whether to calculate the yield for harvested fish or
  captures.

- biomass:

  A flag specifying whether to calculate the yield in terms of the
  biomass versus number of individuals.

- all:

  A flag specifying whether to include all parameter values.

## Value

A data.frame of stock-recruitment parameters.

## Methods (by class)

- `ypr_tabulate_sr(default)`: Tabulate Stock-Recruitment Parameters

- `ypr_tabulate_sr(ypr_populations)`: Tabulate Stock-Recruitment
  Parameters

## See also

Other tabulate:
[`ypr_detabulate_parameters()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_detabulate_parameters.md),
[`ypr_report()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_report.md),
[`ypr_tabulate_biomass()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_biomass.md),
[`ypr_tabulate_fish()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_fish.md),
[`ypr_tabulate_parameters()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_parameters.md),
[`ypr_tabulate_schedule()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_schedule.md),
[`ypr_tabulate_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yield.md),
[`ypr_tabulate_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yields.md)

Other populations:
[`as_ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/as_ypr_populations.md),
[`chilliwack_bt_05`](https://poissonconsulting.github.io/ypr/dev/reference/chilliwack_bt_05.md),
[`ypr_plot_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_yield.md),
[`ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations.md),
[`ypr_populations_expand()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations_expand.md),
[`ypr_tabulate_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yield.md),
[`ypr_tabulate_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yields.md)

Other sr:
[`ypr_plot_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_sr.md),
[`ypr_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_sr.md)

## Examples

``` r
ypr_tabulate_sr(ypr_population()) # Beverton-Holt
#> # A tibble: 3 × 7
#>   Type        pi     u  Eggs Recruits Spawners Fecundity
#>   <chr>    <dbl> <dbl> <dbl>    <dbl>    <dbl>     <dbl>
#> 1 unfished 0     0     2386.    0.667    1.33      3600.
#> 2 actual   0.2   0.2    272.    0.186    0.211     2580.
#> 3 optimal  0.115 0.115  853.    0.417    0.582     2933.
ypr_tabulate_sr(ypr_population(BH = 0L)) # Ricker
#> # A tibble: 3 × 7
#>   Type        pi     u  Eggs Recruits Spawners Fecundity
#>   <chr>    <dbl> <dbl> <dbl>    <dbl>    <dbl>     <dbl>
#> 1 unfished 0     0     3563.    0.995    1.98      3600.
#> 2 actual   0.2   0.2    667.    0.455    0.517     2580.
#> 3 optimal  0.135 0.135 1485.    0.787    1.04      2844.
ypr_tabulate_sr(ypr_populations(Rk = c(2.5, 4.6)))
#> # A tibble: 6 × 8
#>   Type         pi      u   Eggs Recruits Spawners Fecundity    Rk
#>   <chr>     <dbl>  <dbl>  <dbl>    <dbl>    <dbl>     <dbl> <dbl>
#> 1 unfished 0      0      2148.    0.6      1.19       3600.   2.5
#> 2 actual   0.2    0.2      33.6   0.0230   0.0261     2580.   2.5
#> 3 optimal  0.0936 0.0936  818.    0.364    0.538      3041.   2.5
#> 4 unfished 0      0      2801.    0.783    1.56       3600.   4.6
#> 5 actual   0.2    0.2     687.    0.469    0.533      2580.   4.6
#> 6 optimal  0.171  0.171   851.    0.522    0.633      2688.   4.6
```

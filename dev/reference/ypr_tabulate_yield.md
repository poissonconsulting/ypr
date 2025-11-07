# Tabulate Yield

Tabulate Yield

## Usage

``` r
ypr_tabulate_yield(object, ...)

# Default S3 method
ypr_tabulate_yield(
  object,
  Ly = 0,
  harvest = TRUE,
  biomass = FALSE,
  type = "both",
  all = FALSE,
  ...
)

# S3 method for class 'ypr_populations'
ypr_tabulate_yield(
  object,
  Ly = 0,
  harvest = TRUE,
  biomass = FALSE,
  type = "both",
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

- type:

  A string indicating whether to include 'both' or just the 'actual' or
  'optimal' yield.

- all:

  A flag specifying whether to include all parameter values.

## Value

A data frame.

## Methods (by class)

- `ypr_tabulate_yield(default)`: Tabulate Yield

- `ypr_tabulate_yield(ypr_populations)`: Tabulate Yield

## See also

Other tabulate:
[`ypr_detabulate_parameters()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_detabulate_parameters.md),
[`ypr_report()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_report.md),
[`ypr_tabulate_biomass()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_biomass.md),
[`ypr_tabulate_fish()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_fish.md),
[`ypr_tabulate_parameters()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_parameters.md),
[`ypr_tabulate_schedule()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_schedule.md),
[`ypr_tabulate_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_sr.md),
[`ypr_tabulate_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yields.md)

Other populations:
[`as_ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/as_ypr_populations.md),
[`chilliwack_bt_05`](https://poissonconsulting.github.io/ypr/dev/reference/chilliwack_bt_05.md),
[`ypr_plot_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_yield.md),
[`ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations.md),
[`ypr_populations_expand()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations_expand.md),
[`ypr_tabulate_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_sr.md),
[`ypr_tabulate_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yields.md)

Other yield:
[`ypr_plot_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_yield.md),
[`ypr_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_yield.md),
[`ypr_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_yields.md)

## Examples

``` r
ypr_tabulate_yield(ypr_population())
#> # A tibble: 2 × 8
#>   Type       pi     u  Yield   Age Length Weight Effort
#>   <chr>   <dbl> <dbl>  <dbl> <dbl>  <dbl>  <dbl>  <dbl>
#> 1 actual  0.2   0.2   0.0422  6.77   62.1  2580.   2.12
#> 2 optimal 0.115 0.115 0.0670  7.36   64.6  2933.   1.16
ypr_tabulate_yield(ypr_populations(Rk = c(3, 5)))
#> # A tibble: 4 × 9
#>   Type       pi     u  Yield   Age Length Weight Effort    Rk
#>   <chr>   <dbl> <dbl>  <dbl> <dbl>  <dbl>  <dbl>  <dbl> <dbl>
#> 1 actual  0.2   0.2   0.0422  6.77   62.1  2580.   2.12     3
#> 2 optimal 0.115 0.115 0.0670  7.36   64.6  2933.   1.16     3
#> 3 actual  0.2   0.2   0.116   6.77   62.1  2580.   2.12     5
#> 4 optimal 0.183 0.183 0.117   6.87   62.6  2641.   1.92     5
```

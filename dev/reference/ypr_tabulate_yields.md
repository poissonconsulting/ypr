# Tabulate Yields

Tabulate Yields

## Usage

``` r
ypr_tabulate_yields(object, ...)

# Default S3 method
ypr_tabulate_yields(
  object,
  pi = seq(0, 1, length.out = 100),
  Ly = 0,
  harvest = TRUE,
  biomass = FALSE,
  all = FALSE,
  ...
)

# S3 method for class 'ypr_populations'
ypr_tabulate_yields(
  object,
  pi = seq(0, 1, length.out = 100),
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

- pi:

  A vector of probabilities of capture to calculate the yield for.

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

A data frame.

## Methods (by class)

- `ypr_tabulate_yields(default)`: Tabulate Yields

- `ypr_tabulate_yields(ypr_populations)`: Tabulate Yields

## See also

Other tabulate:
[`ypr_detabulate_parameters()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_detabulate_parameters.md),
[`ypr_report()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_report.md),
[`ypr_tabulate_biomass()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_biomass.md),
[`ypr_tabulate_fish()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_fish.md),
[`ypr_tabulate_parameters()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_parameters.md),
[`ypr_tabulate_schedule()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_schedule.md),
[`ypr_tabulate_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_sr.md),
[`ypr_tabulate_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yield.md)

Other populations:
[`as_ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/as_ypr_populations.md),
[`chilliwack_bt_05`](https://poissonconsulting.github.io/ypr/dev/reference/chilliwack_bt_05.md),
[`ypr_plot_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_yield.md),
[`ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations.md),
[`ypr_populations_expand()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations_expand.md),
[`ypr_tabulate_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_sr.md),
[`ypr_tabulate_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yield.md)

## Examples

``` r
ypr_tabulate_yields(ypr_population())
#> # A tibble: 100 × 7
#>        pi      u  Yield   Age Length Weight Effort
#>     <dbl>  <dbl>  <dbl> <dbl>  <dbl>  <dbl>  <dbl>
#>  1 0      0      0      NA      NA      NA  0     
#>  2 0.0101 0.0101 0.0126  8.42   68.5  3532. 0.0964
#>  3 0.0202 0.0202 0.0236  8.30   68.0  3466. 0.194 
#>  4 0.0303 0.0303 0.0331  8.18   67.6  3402. 0.292 
#>  5 0.0404 0.0404 0.0413  8.07   67.2  3339. 0.391 
#>  6 0.0505 0.0505 0.0482  7.96   66.8  3279. 0.492 
#>  7 0.0606 0.0606 0.0539  7.86   66.5  3220. 0.593 
#>  8 0.0707 0.0707 0.0585  7.76   66.1  3163. 0.696 
#>  9 0.0808 0.0808 0.0620  7.66   65.7  3108. 0.800 
#> 10 0.0909 0.0909 0.0646  7.57   65.4  3054. 0.905 
#> # ℹ 90 more rows
ypr_tabulate_yields(
  ypr_populations(
    Rk = c(3, 5)
  ),
  pi = seq(0, 1, length.out = 10)
)
#> # A tibble: 20 × 8
#>       pi     u   Yield   Age Length Weight Effort    Rk
#>    <dbl> <dbl>   <dbl> <dbl>  <dbl>  <dbl>  <dbl> <dbl>
#>  1 0     0     0       NA      NA      NA    0        3
#>  2 0.111 0.111 0.0669   7.40   64.7  2953.   1.12     3
#>  3 0.222 0.222 0.0288   6.64   61.6  2504.   2.39     3
#>  4 0.333 0.333 0       NA      NA      NA    3.85     3
#>  5 0.444 0.444 0       NA      NA      NA    5.58     3
#>  6 0.556 0.556 0       NA      NA      NA    7.70     3
#>  7 0.667 0.667 0       NA      NA      NA   10.4      3
#>  8 0.778 0.778 0       NA      NA      NA   14.3      3
#>  9 0.889 0.889 0       NA      NA      NA   20.9      3
#> 10 1     1     0       NA      NA      NA  Inf        3
#> 11 0     0     0       NA      NA      NA    0        5
#> 12 0.111 0.111 0.103    7.40   64.7  2953.   1.12     5
#> 13 0.222 0.222 0.114    6.64   61.6  2504.   2.39     5
#> 14 0.333 0.333 0.0750   6.15   59.3  2196.   3.85     5
#> 15 0.444 0.444 0.00589  5.80   57.5  1979.   5.58     5
#> 16 0.556 0.556 0       NA      NA      NA    7.70     5
#> 17 0.667 0.667 0       NA      NA      NA   10.4      5
#> 18 0.778 0.778 0       NA      NA      NA   14.3      5
#> 19 0.889 0.889 0       NA      NA      NA   20.9      5
#> 20 1     1     0       NA      NA      NA  Inf        5
ypr_tabulate_yields(ypr_ecotypes(Linf = c(10, 20)))
#> # A tibble: 100 × 7
#>        pi      u    Yield   Age Length Weight Effort
#>     <dbl>  <dbl>    <dbl> <dbl>  <dbl>  <dbl>  <dbl>
#>  1 0      0      0         NA     NA     NA   0     
#>  2 0.0101 0.0101 9.03e-47  19.2   18.9   67.2 0.0964
#>  3 0.0202 0.0202 1.81e-46  19.2   18.9   67.2 0.194 
#>  4 0.0303 0.0303 2.71e-46  19.2   18.9   67.2 0.292 
#>  5 0.0404 0.0404 3.61e-46  19.2   18.9   67.2 0.391 
#>  6 0.0505 0.0505 4.52e-46  19.2   18.9   67.2 0.492 
#>  7 0.0606 0.0606 5.42e-46  19.2   18.9   67.2 0.593 
#>  8 0.0707 0.0707 6.32e-46  19.2   18.9   67.2 0.696 
#>  9 0.0808 0.0808 7.22e-46  19.2   18.9   67.2 0.800 
#> 10 0.0909 0.0909 8.13e-46  19.2   18.9   67.2 0.905 
#> # ℹ 90 more rows
```

# Stock-Recruitment Parameters

Returns a single rowed data frame of the SR parameters:

- alpha:

  Survival from egg to age tR at low density

- beta:

  Density-dependence

- Rk:

  Lifetime spawners per spawner at low density

- phi:

  Lifetime eggs deposited per recruit at unfished equilibrium

- phiF:

  Lifetime eggs deposited per recruit at the fished equilibrium

- R0:

  Age tR recruits at the unfished equilibrium

- R0F:

  Age tR recruits at the fished equilibrium

- S0:

  Spawners at the unfished equilibrium

- S0F:

  Spawners at the fished equilibrium

## Usage

``` r
ypr_sr(object)
```

## Arguments

- object:

  The population or populations.

## Value

A data frame of the SR parameters.

## See also

Other sr:
[`ypr_plot_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_sr.md),
[`ypr_tabulate_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_sr.md)

## Examples

``` r
ypr_sr(ypr_population()) # Beverton-Holt
#> # A tibble: 1 × 9
#>      alpha     beta    Rk   phi  phiF    R0   R0F    S0   S0F
#>      <dbl>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1 0.000838 0.000838     3 3579. 1465. 0.667 0.186  1.33 0.211
ypr_sr(ypr_population(BH = 0L)) # Ricker
#> # A tibble: 1 × 9
#>      alpha     beta    Rk   phi  phiF    R0   R0F    S0   S0F
#>      <dbl>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1 0.000838 0.000308     3 3579. 1465. 0.995 0.455  1.98 0.517
```

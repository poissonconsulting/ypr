# Plot Stock-Recruitment Curve

Plot Stock-Recruitment Curve

## Usage

``` r
ypr_plot_sr(
  population,
  Ly = 0,
  harvest = TRUE,
  biomass = FALSE,
  plot_values = TRUE
)
```

## Arguments

- population:

  An object of class
  [`ypr_population()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_population.md).

- Ly:

  The minimum length (trophy) fish to consider when calculating the
  yield (cm).

- harvest:

  A flag specifying whether to calculate the yield for harvested fish or
  captures.

- biomass:

  A flag specifying whether to calculate the yield in terms of the
  biomass versus number of individuals.

- plot_values:

  A flag specifying whether to plot the actual and optimal values.

## Value

A ggplot2 object.

## See also

Other sr:
[`ypr_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_sr.md),
[`ypr_tabulate_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_sr.md)

Other plot:
[`ypr_plot_biomass()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_biomass.md),
[`ypr_plot_fish()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_fish.md),
[`ypr_plot_schedule()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_schedule.md),
[`ypr_plot_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_yield.md)

## Examples

``` r
ypr_plot_sr(ypr_population(Rk = 10))

ypr_plot_sr(ypr_population(Rk = 10, BH = 0L))
```

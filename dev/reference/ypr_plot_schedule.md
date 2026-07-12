# Plot Population or Ecotypes Schedule Terms

Produces a bivariate line plot of two schedule terms.

## Usage

``` r
ypr_plot_schedule(population, x = "Age", y = "Length")
```

## Arguments

- population:

  An object of class
  [`ypr_population()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_population.md).

- x:

  A string of the term on the x-axis.

- y:

  A string of the term on the y-axis.

## Value

A ggplot2 object.

## See also

Other schedule:
[`ypr_tabulate_schedule()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_schedule.md)

Other plot:
[`ypr_plot_biomass()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_biomass.md),
[`ypr_plot_fish()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_fish.md),
[`ypr_plot_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_sr.md),
[`ypr_plot_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_yield.md)

## Examples

``` r
ypr_plot_schedule(ypr_population())
```

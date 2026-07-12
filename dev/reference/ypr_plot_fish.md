# Plot Fish

Produces a frequency histogram of the number of fish in the 'Survivors',
'Spawners', 'Caught', 'Harvested' or 'Released' categories by 'Length',
'Age' or 'Weight' class.

## Usage

``` r
ypr_plot_fish(
  population,
  x = "Age",
  y = "Survivors",
  percent = FALSE,
  binwidth = 1L,
  color = NULL
)
```

## Arguments

- population:

  An object of class
  [`ypr_population()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_population.md).

- x:

  The object to coerce.

- y:

  A string of the term on the y-axis.

- percent:

  A flag specifying whether to plot the number of fish as a percent or
  frequency (the default).

- binwidth:

  A positive integer of the width of the bins for grouping.

- color:

  A string of the color around each bar (or NULL).

## Value

A ggplot2 object.

## See also

[`ggplot2::geom_histogram()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html)

Other fish:
[`ypr_tabulate_fish()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_fish.md)

Other plot:
[`ypr_plot_biomass()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_biomass.md),
[`ypr_plot_schedule()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_schedule.md),
[`ypr_plot_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_sr.md),
[`ypr_plot_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_yield.md)

## Examples

``` r
ypr_plot_fish(ypr_population(), color = "white")
```

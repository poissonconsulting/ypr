# Plot Biomass

Produces a frequency histogram of the total fish 'Biomass' or 'Eggs'
deposition by 'Age' class.

## Usage

``` r
ypr_plot_biomass(population, y = "Biomass", color = NULL)
```

## Arguments

- population:

  An object of class
  [`ypr_population()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_population.md).

- y:

  A string of the term on the y-axis.

- color:

  A string of the color around each bar (or NULL).

## Value

A ggplot2 object.

## See also

[`ggplot2::geom_histogram()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html)

Other biomass:
[`ypr_tabulate_biomass()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_biomass.md)

Other plot:
[`ypr_plot_fish()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_fish.md),
[`ypr_plot_schedule()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_schedule.md),
[`ypr_plot_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_sr.md),
[`ypr_plot_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_yield.md)

## Examples

``` r
ypr_plot_biomass(ypr_population(), color = "white")
```

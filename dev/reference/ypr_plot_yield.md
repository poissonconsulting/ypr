# Plot Yield by Capture

Plots the 'Yield', 'Age', 'Length', 'Weight', 'Effort', or 'YPUE' by the
**annual interval** capture/exploitation probability.

## Usage

``` r
ypr_plot_yield(object, ...)

# Default S3 method
ypr_plot_yield(
  object,
  y = "Yield",
  pi = seq(0, 1, length.out = 100),
  Ly = 0,
  harvest = TRUE,
  biomass = FALSE,
  u = harvest,
  plot_values = TRUE,
  ...
)

# S3 method for class 'ypr_populations'
ypr_plot_yield(
  object,
  y = "Yield",
  pi = seq(0, 1, length.out = 100),
  Ly = 0,
  harvest = TRUE,
  biomass = FALSE,
  u = harvest,
  plot_values = TRUE,
  ...
)
```

## Arguments

- object:

  The population or populations.

- ...:

  These dots are for future extensions and must be empty.

- y:

  A string of the term on the y-axis.

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

- u:

  A flag specifying whether to plot the exploitation rate as opposed to
  the capture rate.

- plot_values:

  A flag specifying whether to plot the actual and optimal values.

## Value

A ggplot2 object.

## Methods (by class)

- `ypr_plot_yield(default)`: Plot Yield by Capture

- `ypr_plot_yield(ypr_populations)`: Plot Yield by Capture

## See also

Other populations:
[`as_ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/as_ypr_populations.md),
[`chilliwack_bt_05`](https://poissonconsulting.github.io/ypr/dev/reference/chilliwack_bt_05.md),
[`ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations.md),
[`ypr_populations_expand()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations_expand.md),
[`ypr_tabulate_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_sr.md),
[`ypr_tabulate_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yield.md),
[`ypr_tabulate_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yields.md)

Other yield:
[`ypr_tabulate_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yield.md),
[`ypr_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_yield.md),
[`ypr_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_yields.md)

Other plot:
[`ypr_plot_biomass()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_biomass.md),
[`ypr_plot_fish()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_fish.md),
[`ypr_plot_schedule()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_schedule.md),
[`ypr_plot_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_sr.md)

## Examples

``` r
if (FALSE) { # \dontrun{
ypr_plot_yield(
  ypr_populations(
    Rk = c(2.5, 4.6),
    Llo = c(0, 60)
  ),
  plot_values = FALSE
) +
  ggplot2::facet_wrap(~Llo) +
  ggplot2::aes(group = Rk, color = Rk) +
  ggplot2::scale_color_manual(values = c("black", "blue"))

ypr_plot_yield(ypr_populations(Rk = c(2.5, 4.6), Llo = c(0, 60))) +
  ggplot2::facet_grid(Rk ~ Llo)
} # }

ypr_plot_yield(ypr_population())
```

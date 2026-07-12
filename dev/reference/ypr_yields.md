# Yields

Calculates the yield(s) for a population based on one or more capture
rates.

## Usage

``` r
ypr_yields(
  object,
  pi = seq(0, 1, length.out = 100),
  Ly = 0,
  harvest = TRUE,
  biomass = FALSE
)
```

## Arguments

- object:

  The population or populations.

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

## Value

A numeric vector of the yields.

## See also

Other yield:
[`ypr_plot_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_yield.md),
[`ypr_tabulate_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yield.md),
[`ypr_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_yield.md)

Other calculate:
[`ypr_age_at_length()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_age_at_length.md),
[`ypr_exploitation()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_exploitation.md),
[`ypr_length_at_age()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_length_at_age.md),
[`ypr_optimize()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_optimize.md),
[`ypr_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_yield.md)

## Examples

``` r
pi <- seq(0, 1, length.out = 30)
plot(pi, ypr_yields(ypr_population(), pi), type = "l")
```

# Optimize Capture

Finds the **annual interval** capture probability (pi) that maximises
the yield for a given population.

## Usage

``` r
ypr_optimize(object, Ly = 0, harvest = TRUE, biomass = FALSE)
```

## Arguments

- object:

  The population or populations.

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

The **annual interval** capture probability (pi) that maximises the
yield.

## See also

Other calculate:
[`ypr_age_at_length()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_age_at_length.md),
[`ypr_exploitation()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_exploitation.md),
[`ypr_length_at_age()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_length_at_age.md),
[`ypr_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_yield.md),
[`ypr_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_yields.md)

## Examples

``` r
ypr_optimize(ypr_population())
#> [1] 0.115183
```

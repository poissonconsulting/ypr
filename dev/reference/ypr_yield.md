# Yield

Calculates the yield for a population.

## Usage

``` r
ypr_yield(object, Ly = 0, harvest = TRUE, biomass = FALSE, ...)
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

- ...:

  These dots are for future extensions and must be empty.

## Value

The yield as number of fish or biomass.

## Details

By default, with `Rmax = 1` the number of individuals is the proportion
of the recruits at the carrying capacity. If the yield is given in terms
of the biomass (kg) then the scaling also depends on the value of `Wa`
(g).

## See also

Other yield:
[`ypr_plot_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_yield.md),
[`ypr_tabulate_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yield.md),
[`ypr_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_yields.md)

Other calculate:
[`ypr_age_at_length()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_age_at_length.md),
[`ypr_exploitation()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_exploitation.md),
[`ypr_length_at_age()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_length_at_age.md),
[`ypr_optimize()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_optimize.md),
[`ypr_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_yields.md)

## Examples

``` r
ypr_yield(ypr_population())
#> [1] 0.04220691
#> attr(,"Age")
#> [1] 6.7687
#> attr(,"Length")
#> [1] 62.13068
#> attr(,"Weight")
#> [1] 2580.272
#> attr(,"Effort")
#> [1] 2.117905
ypr_yield(ypr_ecotypes(Linf = c(100, 200)))
#> [1] 0
#> attr(,"Age")
#> [1] NA
#> attr(,"Length")
#> [1] NA
#> attr(,"Weight")
#> [1] NA
#> attr(,"Effort")
#> [1] 2.117905
```

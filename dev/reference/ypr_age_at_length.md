# Age At Length

Age At Length

## Usage

``` r
ypr_age_at_length(population, length)
```

## Arguments

- population:

  An object of class
  [`ypr_population()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_population.md).

- length:

  A numeric vector of the length (cm).

## Value

A double vector of the lengths.

## See also

Other calculate:
[`ypr_exploitation()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_exploitation.md),
[`ypr_length_at_age()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_length_at_age.md),
[`ypr_optimize()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_optimize.md),
[`ypr_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_yield.md),
[`ypr_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_yields.md)

## Examples

``` r
ypr_age_at_length(ypr_population(), seq(0, 100, by = 10))
#>  [1]  0.0000000  0.7024034  1.4876237  2.3778330  3.4055042  4.6209812
#>  [7]  6.1086049  8.0264854 10.7295861 15.3505673        Inf
```

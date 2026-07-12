# Length At Age

Length At Age

## Usage

``` r
ypr_length_at_age(population, age)
```

## Arguments

- population:

  An object of class
  [`ypr_population()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_population.md).

- age:

  A numeric vector of the age (yr).

## Value

A double vector of the lengths.

## See also

Other calculate:
[`ypr_age_at_length()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_age_at_length.md),
[`ypr_exploitation()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_exploitation.md),
[`ypr_optimize()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_optimize.md),
[`ypr_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_yield.md),
[`ypr_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_yields.md)

## Examples

``` r
ypr_length_at_age(ypr_population(), seq(0, 5, by = 0.5))
#>  [1]  0.000000  7.225651 13.929202 20.148378 25.918178 31.271072 36.237185
#>  [8] 40.844464 45.118836 49.084358 52.763345
```

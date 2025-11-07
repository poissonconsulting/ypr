# Check Populations

Checks if an ypr_populations object with valid parameter values.

## Usage

``` r
check_populations(x, x_name = NULL)
```

## Arguments

- x:

  The object to check.

- x_name:

  A string of the name of object x or NULL.

## Value

An informative error if the test fails or an invisible copy of x.

## See also

Other check:
[`check_ecotypes()`](https://poissonconsulting.github.io/ypr/dev/reference/check_ecotypes.md),
[`check_population()`](https://poissonconsulting.github.io/ypr/dev/reference/check_population.md)

## Examples

``` r
check_populations(ypr_populations())
```

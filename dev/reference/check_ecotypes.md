# Check Ecotypes

Checks if an ypr_ecotypes object with valid parameter values.

## Usage

``` r
check_ecotypes(x, x_name = NULL)
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
[`check_population()`](https://poissonconsulting.github.io/ypr/dev/reference/check_population.md),
[`check_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/check_populations.md)

## Examples

``` r
check_ecotypes(ypr_ecotypes())
```

# Tests if is a Population, Populations or Ecotypes

Tests if is a Population, Populations or Ecotypes

## Usage

``` r
is.ypr_population(x)

is_ypr_population(x)

is.ypr_populations(x)

is_ypr_populations(x)

is.ypr_ecotypes(x)

is_ypr_ecotypes(x)
```

## Arguments

- x:

  The object to test.

## Functions

- `is_ypr_population()`: Test if is a Population

- `is.ypr_populations()`: Test if is a Populations

- `is_ypr_populations()`: Test if is a Populations

- `is.ypr_ecotypes()`: Test if is an Ecotypes

- `is_ypr_ecotypes()`: Test if is an Ecotypes

## Examples

``` r
is.ypr_population(ypr_population())
#> [1] TRUE
is_ypr_population(ypr_population())
#> [1] TRUE
is.ypr_populations(ypr_populations())
#> [1] TRUE
is_ypr_population(ypr_populations())
#> [1] FALSE
is.ypr_ecotypes(ypr_ecotypes())
#> [1] TRUE
is_ypr_ecotypes(ypr_ecotypes())
#> [1] TRUE
```

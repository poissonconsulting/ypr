# Population(s) or Ecotype Names

Generates set of unique names based on differences in parameter values.

## Usage

``` r
ypr_names(x, ...)

# S3 method for class 'ypr_population'
ypr_names(x, ...)

# S3 method for class 'ypr_populations'
ypr_names(x, ...)

# S3 method for class 'ypr_ecotypes'
ypr_names(x, ...)
```

## Arguments

- x:

  An object of class ypr_population, ypr_populations or ypr_ecotypes.

- ...:

  Unused.

## Value

A character vector of the unique parameter based names.

## Details

Parameter RPR is ignored because it is irrelevant to population(s) and
does not distinguish between ecotypes.

## Methods (by class)

- `ypr_names(ypr_population)`: Population Names

- `ypr_names(ypr_populations)`: Populations Names

- `ypr_names(ypr_ecotypes)`: Ecotypes Names

## Examples

``` r
ypr_names(ypr_population())
#> [1] "Pop_1"
ypr_names(ypr_populations())
#> [1] "Pop_1"
ypr_names(ypr_populations())
#> [1] "Pop_1"
```

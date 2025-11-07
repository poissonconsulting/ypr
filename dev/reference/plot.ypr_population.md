# Plot Population Schedule

Plot Population Schedule

## Usage

``` r
# S3 method for class 'ypr_population'
plot(x, type = "b", ...)
```

## Arguments

- x:

  The population to plot.

- type:

  A string specifying the plot type. Possible values include 'b', 'p'
  and 'l'.

- ...:

  Additional arguments passed to
  [graphics::plot](https://rdrr.io/r/graphics/plot.default.html)
  function.

## Value

An invisible copy of the original object.

## See also

[graphics::plot](https://rdrr.io/r/graphics/plot.default.html)

## Examples

``` r
if (FALSE) { # \dontrun{
plot(ypr_population())
} # }
```

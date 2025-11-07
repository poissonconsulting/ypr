# Report

Creates an Rmd file that can be used to generate a report.

## Usage

``` r
ypr_report(
  population,
  Ly = 0,
  harvest = TRUE,
  biomass = FALSE,
  title = "Population Report",
  description = "",
  date = Sys.Date(),
  file = "report",
  view = FALSE,
  ask = TRUE
)
```

## Arguments

- population:

  An object of class
  [`ypr_population()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_population.md).

- Ly:

  The minimum length (trophy) fish to consider when calculating the
  yield (cm).

- harvest:

  A flag specifying whether to calculate the yield for harvested fish or
  captures.

- biomass:

  A flag specifying whether to calculate the yield in terms of the
  biomass versus number of individuals.

- title:

  A string of the report title.

- description:

  A string describing the population.

- date:

  A date of the report date.

- file:

  A string of the path to the file (without the extension).

- view:

  A flag specifying whether to view the report (after rendering it to
  html).

- ask:

  A flag specifying whether to ask before overwriting or creating a
  file.

## Value

An invisible character vector of the contents of the file.

## See also

Other tabulate:
[`ypr_detabulate_parameters()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_detabulate_parameters.md),
[`ypr_tabulate_biomass()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_biomass.md),
[`ypr_tabulate_fish()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_fish.md),
[`ypr_tabulate_parameters()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_parameters.md),
[`ypr_tabulate_schedule()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_schedule.md),
[`ypr_tabulate_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_sr.md),
[`ypr_tabulate_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yield.md),
[`ypr_tabulate_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yields.md)

## Examples

``` r
if (FALSE) { # \dontrun{
ypr_report(ypr_population(), file = tempfile(), ask = FALSE)
} # }
```

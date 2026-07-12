# Populations

Populations

## Usage

``` r
ypr_populations(..., expand = TRUE, names = NULL)
```

## Arguments

- ...:

  These dots are for future extensions and must be empty.

- expand:

  A flag specifying whether to expand parameter combinations.

- names:

  A character vector of unique ecotype names.

## Value

A list of
[`ypr_population()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_population.md)
objects

## See also

Other populations:
[`as_ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/as_ypr_populations.md),
[`chilliwack_bt_05`](https://poissonconsulting.github.io/ypr/dev/reference/chilliwack_bt_05.md),
[`ypr_plot_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_yield.md),
[`ypr_populations_expand()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations_expand.md),
[`ypr_tabulate_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_sr.md),
[`ypr_tabulate_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yield.md),
[`ypr_tabulate_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yields.md)

## Examples

``` r
ypr_populations(Rk = c(2.5, 4.6), Hm = c(0.2, 0.05))
#> tmax:  20
#> k:     0.15
#> Linf:  100
#> t0:    0
#> k2:    0.15
#> Linf2: 100
#> L2:    1000
#> Wb:    3
#> Ls:    50
#> Sp:    100
#> es:    1
#> Sm:    0
#> fb:    1
#> tR:    1
#> BH:    1
#> Rk:    2.5, 4.6, 2.5, 4.6
#> n:     0.2
#> nL:    0.2
#> Ln:    1000
#> Lv:    50
#> Vp:    100
#> Llo:   0
#> Lup:   1000
#> Nc:    0
#> pi:    0.2
#> rho:   0
#> Hm:    0.05, 0.05, 0.2, 0.2
#> Rmax:  1
#> Wa:    0.01
#> fa:    1
#> q:     0.1
#> RPR:   1
```

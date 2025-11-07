# Expand Populations

An object of class
[`ypr_population()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_population.md)
of all unique combinations of parameter values.

## Usage

``` r
ypr_populations_expand(populations)
```

## Arguments

- populations:

  An object of class
  [`ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations.md).

## Value

An object of class `ypr_population`.

## See also

Other populations:
[`as_ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/as_ypr_populations.md),
[`chilliwack_bt_05`](https://poissonconsulting.github.io/ypr/dev/reference/chilliwack_bt_05.md),
[`ypr_plot_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_yield.md),
[`ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations.md),
[`ypr_tabulate_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_sr.md),
[`ypr_tabulate_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yield.md),
[`ypr_tabulate_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yields.md)

## Examples

``` r
ypr_populations_expand(
  ypr_populations(
    Rk = c(2.5, 4, 2.5),
    Hm = c(0.1, 0.2, 0.1)
  )
)
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
#> Rk:    2.5, 4, 2.5, 4
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
#> Hm:    0.1, 0.1, 0.2, 0.2
#> Rmax:  1
#> Wa:    0.01
#> fa:    1
#> q:     0.1
#> RPR:   1
```

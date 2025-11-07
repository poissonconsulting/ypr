# Coerce to a Populations Object

Coerce to a Populations Object

## Usage

``` r
as_ypr_populations(x, ...)

# S3 method for class 'ypr_population'
as_ypr_populations(x, ...)

# S3 method for class 'ypr_populations'
as_ypr_populations(x, ...)

# S3 method for class 'ypr_ecotypes'
as_ypr_populations(x, ...)
```

## Arguments

- x:

  The object to coerce.

- ...:

  Unused.

## Value

An object of class ypr_ecotypes.

## Methods (by class)

- `as_ypr_populations(ypr_population)`: Coerce a Population Object to an
  Population Object

- `as_ypr_populations(ypr_populations)`: Coerce a Populations Object of
  length 1 to a Population Object

- `as_ypr_populations(ypr_ecotypes)`: Coerce a Ecotypes Object of length
  1 to a Population Object

## See also

Other populations:
[`chilliwack_bt_05`](https://poissonconsulting.github.io/ypr/dev/reference/chilliwack_bt_05.md),
[`ypr_plot_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_yield.md),
[`ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations.md),
[`ypr_populations_expand()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations_expand.md),
[`ypr_tabulate_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_sr.md),
[`ypr_tabulate_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yield.md),
[`ypr_tabulate_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yields.md)

## Examples

``` r
as_ypr_populations(ypr_population())
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
#> Rk:    3
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
#> Hm:    0
#> Rmax:  1
#> Wa:    0.01
#> fa:    1
#> q:     0.1
#> RPR:   1
as_ypr_populations(ypr_populations())
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
#> Rk:    3
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
#> Hm:    0
#> Rmax:  1
#> Wa:    0.01
#> fa:    1
#> q:     0.1
#> RPR:   1
as_ypr_populations(ypr_ecotypes())
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
#> Rk:    3
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
#> Hm:    0
#> Rmax:  1
#> Wa:    0.01
#> fa:    1
#> q:     0.1
#> RPR:   1
```

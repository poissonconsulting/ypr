# Coerce to an Ecotypes Object

Coerce to an Ecotypes Object

## Usage

``` r
as_ypr_ecotypes(x, ...)

# S3 method for class 'data.frame'
as_ypr_ecotypes(x, ...)

# S3 method for class 'ypr_population'
as_ypr_ecotypes(x, ...)

# S3 method for class 'ypr_populations'
as_ypr_ecotypes(x, ...)

# S3 method for class 'ypr_ecotypes'
as_ypr_ecotypes(x, ...)
```

## Arguments

- x:

  The object to coerce.

- ...:

  Additional arguments.

## Value

An object of class ypr_ecotypes.

## Methods (by class)

- `as_ypr_ecotypes(data.frame)`: Coerce a data.frame to an Ecotypes
  Object

- `as_ypr_ecotypes(ypr_population)`: Coerce a Population Object to an
  Ecotypes Object

- `as_ypr_ecotypes(ypr_populations)`: Coerce a Populations Object to an
  Ecotypes Object

- `as_ypr_ecotypes(ypr_ecotypes)`: Coerce an Ecotypes Object to an
  Ecotypes Object

## See also

Other ecotypes:
[`ypr_ecotypes()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_ecotypes.md)

## Examples

``` r
as_ypr_ecotypes(as.data.frame(ypr_ecotypes(Ls = c(10, 15, 20))))
#> tmax:  20
#> k:     0.15
#> Linf:  100
#> t0:    0
#> k2:    0.15
#> Linf2: 100
#> L2:    1000
#> Wb:    3
#> Ls:    10, 15, 20
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
#> Ecotype: Ls_10, Ls_15, Ls_20
as_ypr_ecotypes(ypr_population())
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
as_ypr_ecotypes(ypr_populations(Ls = c(10, 15, 20)))
#> tmax:  20
#> k:     0.15
#> Linf:  100
#> t0:    0
#> k2:    0.15
#> Linf2: 100
#> L2:    1000
#> Wb:    3
#> Ls:    10, 15, 20
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
#> Ecotype: Ls_10, Ls_15, Ls_20
as_ypr_ecotypes(ypr_ecotypes(Ls = c(10, 15, 20)))
#> tmax:  20
#> k:     0.15
#> Linf:  100
#> t0:    0
#> k2:    0.15
#> Linf2: 100
#> L2:    1000
#> Wb:    3
#> Ls:    10, 15, 20
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
#> Ecotype: Ls_10, Ls_15, Ls_20
```

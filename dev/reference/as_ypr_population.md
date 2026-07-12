# Coerce to a Population Object

Coerce to a Population Object

## Usage

``` r
as_ypr_population(x, ...)

# S3 method for class 'data.frame'
as_ypr_population(x, ...)

# S3 method for class 'ypr_population'
as_ypr_population(x, ...)

# S3 method for class 'ypr_populations'
as_ypr_population(x, ...)

# S3 method for class 'ypr_ecotypes'
as_ypr_population(x, ...)

# S3 method for class 'data.frame'
as_ypr_populations(x, ...)
```

## Arguments

- x:

  The object to coerce.

- ...:

  Unused.

## Value

An object of class ypr_population.

## Methods (by class)

- `as_ypr_population(data.frame)`: Coerce a data.frame to an Population
  Object

- `as_ypr_population(ypr_population)`: Coerce a Population Object to an
  Population Object

- `as_ypr_population(ypr_populations)`: Coerce a Populations Object of
  length 1 to a Population Object

- `as_ypr_population(ypr_ecotypes)`: Coerce a Ecotypes Object of length
  1 to a Population Object

## Functions

- `as_ypr_populations(data.frame)`: Coerce a data.frame to a Populations
  Object

## Examples

``` r
as_ypr_population(as.data.frame(ypr_population()))
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
as_ypr_population(ypr_populations())
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
as_ypr_population(ypr_populations())
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
as_ypr_population(ypr_ecotypes())
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
as_ypr_populations(as.data.frame(ypr_populations(Rk = c(3, 4))))
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
#> Rk:    3, 4
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

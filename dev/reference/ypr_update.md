# Update a YPR Object Currently just works with scalar parameters for populations and ecotypes.

Update a YPR Object Currently just works with scalar parameters for
populations and ecotypes.

## Usage

``` r
ypr_update(x, ...)

# S3 method for class 'ypr_population'
ypr_update(x, ...)

# S3 method for class 'ypr_populations'
ypr_update(x, ...)

# S3 method for class 'ypr_ecotypes'
ypr_update(x, ...)
```

## Arguments

- x:

  A population, populations or ecotypes object to update.

- ...:

  One or more parameter values from
  [`ypr_population()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_population.md).

## Methods (by class)

- `ypr_update(ypr_population)`: Update Population Parameters

- `ypr_update(ypr_populations)`: Update Populations Parameters

- `ypr_update(ypr_ecotypes)`: Update Populations Parameters

## Examples

``` r
ypr_update(ypr_population(), Rk = 2.5)
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
#> Rk:    2.5
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
ypr_update(ypr_populations(Rk = c(2.5, 4)), Rk = 2.5)
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
#> Rk:    2.5
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
ypr_update(ypr_ecotypes(Linf = c(2.5, 4)), k = 1.5)
#> tmax:  20
#> k:     1.5
#> Linf:  2.5, 4
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
#> Ecotype: Linf_2_5, Linf_4
```

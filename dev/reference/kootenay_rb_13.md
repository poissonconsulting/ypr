# Kootenay Lake Rainbow Trout Population Parameters (2013)

The population parameters for Rainbow Trout in Kootenay Lake from
Andrusak and Thorley (2013)

## Usage

``` r
kootenay_rb_13
```

## Format

An object of class
[`ypr_population()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_population.md).

## Details

The estimates should not be used for management.

## References

Andrusak, G.F., and Thorley, J.L. 2013. Kootenay Lake Exploitation
Study: Fishing and Natural Mortality of Large Rainbow Trout and Bull
Trout: 2013 Annual Report. A Poisson Consulting Ltd. and Redfish
Consulting Ltd. Report, Habitat Conservation Trust Foundation, Victoria,
BC.

## See also

Other data:
[`adams_bt_03`](https://poissonconsulting.github.io/ypr/dev/reference/adams_bt_03.md),
[`chilliwack_bt_05`](https://poissonconsulting.github.io/ypr/dev/reference/chilliwack_bt_05.md),
[`kootenay_bt_13`](https://poissonconsulting.github.io/ypr/dev/reference/kootenay_bt_13.md),
[`kootenay_rb`](https://poissonconsulting.github.io/ypr/dev/reference/kootenay_rb.md),
[`quesnel_bt`](https://poissonconsulting.github.io/ypr/dev/reference/quesnel_bt.md),
[`quesnel_lt`](https://poissonconsulting.github.io/ypr/dev/reference/quesnel_lt.md),
[`quesnel_rb`](https://poissonconsulting.github.io/ypr/dev/reference/quesnel_rb.md)

## Examples

``` r
kootenay_rb_13
#> tmax:  20
#> k:     0.25
#> Linf:  100
#> t0:    0.75
#> k2:    0.15
#> Linf2: 100
#> L2:    1000
#> Wb:    3.39
#> Ls:    60
#> Sp:    100
#> es:    1
#> Sm:    0
#> fb:    1
#> tR:    1
#> BH:    1
#> Rk:    10
#> n:     0.38
#> nL:    0.2
#> Ln:    1000
#> Lv:    40
#> Vp:    5
#> Llo:   0
#> Lup:   1000
#> Nc:    0
#> pi:    0.1
#> rho:   0
#> Hm:    0
#> Rmax:  1
#> Wa:    0.01
#> fa:    1
#> q:     0.1
#> RPR:   1
ypr_plot_yield(kootenay_rb_13)
```

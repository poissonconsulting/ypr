# Kootenay Lake Rainbow Trout Population Parameters

The population parameters for Rainbow Trout in Kootenay Lake.

## Usage

``` r
kootenay_rb
```

## Format

An object of class
[`ypr_population()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_population.md).

## Details

The estimates are liable to change and should not be used for
management.

## References

Thorley, J.L., and Andrusak, G.F. 2017. The fishing and natural
mortality of large, piscivorous Bull Trout and Rainbow Trout in Kootenay
Lake, British Columbia (2008–2013). PeerJ 5: e2874.
doi:10.7717/peerj.2874.

## See also

Other data:
[`adams_bt_03`](https://poissonconsulting.github.io/ypr/dev/reference/adams_bt_03.md),
[`chilliwack_bt_05`](https://poissonconsulting.github.io/ypr/dev/reference/chilliwack_bt_05.md),
[`kootenay_bt_13`](https://poissonconsulting.github.io/ypr/dev/reference/kootenay_bt_13.md),
[`kootenay_rb_13`](https://poissonconsulting.github.io/ypr/dev/reference/kootenay_rb_13.md),
[`quesnel_bt`](https://poissonconsulting.github.io/ypr/dev/reference/quesnel_bt.md),
[`quesnel_lt`](https://poissonconsulting.github.io/ypr/dev/reference/quesnel_lt.md),
[`quesnel_rb`](https://poissonconsulting.github.io/ypr/dev/reference/quesnel_rb.md)

## Examples

``` r
kootenay_rb
#> tmax:  20
#> k:     0.26
#> Linf:  100
#> t0:    0.5
#> k2:    0.15
#> Linf2: 100
#> L2:    1000
#> Wb:    3.2
#> Ls:    75
#> Sp:    20
#> es:    0.9
#> Sm:    0.53
#> fb:    0.86
#> tR:    1
#> BH:    1
#> Rk:    17.65
#> n:     0.23
#> nL:    0.2
#> Ln:    1000
#> Lv:    40
#> Vp:    10
#> Llo:   0
#> Lup:   1000
#> Nc:    0
#> pi:    0.14
#> rho:   0.62
#> Hm:    0.25
#> Rmax:  115000
#> Wa:    0.005
#> fa:    3.9
#> q:     0.028
#> RPR:   1
ypr_plot_yield(kootenay_rb)
```

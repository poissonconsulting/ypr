# Chilliwack Lake Bull Trout Populations Parameters (2005)

The populations parameters for Bull Trout in Chilliwack Lake from Taylor
(2005)

## Usage

``` r
chilliwack_bt_05
```

## Format

An object of class
[`ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations.md).

## References

Taylor, J.L. 2005. Sustainability of the Chilliwack Lake Char Fishery.
Ministry of Water, Land and Air Protection, Surrey, B.C.

## See also

Other populations:
[`as_ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/as_ypr_populations.md),
[`ypr_plot_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_plot_yield.md),
[`ypr_populations()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations.md),
[`ypr_populations_expand()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_populations_expand.md),
[`ypr_tabulate_sr()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_sr.md),
[`ypr_tabulate_yield()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yield.md),
[`ypr_tabulate_yields()`](https://poissonconsulting.github.io/ypr/dev/reference/ypr_tabulate_yields.md)

Other data:
[`adams_bt_03`](https://poissonconsulting.github.io/ypr/dev/reference/adams_bt_03.md),
[`kootenay_bt_13`](https://poissonconsulting.github.io/ypr/dev/reference/kootenay_bt_13.md),
[`kootenay_rb`](https://poissonconsulting.github.io/ypr/dev/reference/kootenay_rb.md),
[`kootenay_rb_13`](https://poissonconsulting.github.io/ypr/dev/reference/kootenay_rb_13.md),
[`quesnel_bt`](https://poissonconsulting.github.io/ypr/dev/reference/quesnel_bt.md),
[`quesnel_lt`](https://poissonconsulting.github.io/ypr/dev/reference/quesnel_lt.md),
[`quesnel_rb`](https://poissonconsulting.github.io/ypr/dev/reference/quesnel_rb.md)

## Examples

``` r
chilliwack_bt_05
#> tmax:  20
#> k:     0.12
#> Linf:  86
#> t0:    0.018
#> k2:    0.15
#> Linf2: 100
#> L2:    1000
#> Wb:    2.8
#> Ls:    38.5
#> Sp:    100
#> es:    1
#> Sm:    0
#> fb:    1
#> tR:    1
#> BH:    1
#> Rk:    2.5, 4.6, 2.5, 4.6, 2.5, 4.6, 2.5, 4.6, 2.5, 4.6, 2.5, 4.6
#> n:     0.17
#> nL:    0.2
#> Ln:    1000
#> Lv:    36.5
#> Vp:    11.7
#> Llo:   0, 0, 60, 60, 1000, 1000, 0, 0, 60, 60, 1000, 1000
#> Lup:   1000
#> Nc:    0.15
#> pi:    0.2
#> rho:   0
#> Hm:    0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2
#> Rmax:  250
#> Wa:    0.022
#> fa:    2.29
#> q:     0.1
#> RPR:   1
yield <- ypr_tabulate_yield(chilliwack_bt_05, type = "optimal")
yield$pi <- round(yield$pi, 2)
yield <- yield[c("Llo", "Hm", "Rk", "pi")]
yield <- tidyr::spread(yield, Rk, pi)
yield <- yield[order(-yield$Hm), ]
yield
#> # A tibble: 6 × 4
#>     Llo    Hm `2.5` `4.6`
#>   <dbl> <dbl> <dbl> <dbl>
#> 1     0  0.2   0.08  0.14
#> 2    60  0.2   0.14  0.25
#> 3  1000  0.2   0.25  0.45
#> 4     0  0.05  0.08  0.14
#> 5    60  0.05  0.17  0.37
#> 6  1000  0.05  0.41  0.74
if (FALSE) { # \dontrun{
ypr_plot_yield(chilliwack_bt_05, plot_values = FALSE) +
  ggplot2::facet_grid(Rk ~ Hm) +
  ggplot2::aes(group = Llo, linetype = Llo)
} # }
```

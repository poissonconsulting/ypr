- Remove `Capture` (as covered by single value) and `TotalMortality` from schedule.
- Switched yield parameters `harvest` and `biomass` to `FALSE` by default.
- Added `ypr_yield_uncertainty()`, `ypr_yields_uncertainty()` and 
`ypr_optimize_uncertainty()` to account for uncertainty in parameters.
- Added `ypr_population_update()` to update population parameters.
- Added vulnerability power `Vp`.
- Added slot limit non-complicance parameter `Nc`.
- Increased upper limit for `Rk` from 10 to 100.
- Added scaling parameter `R0`.
- Renamed `a` to `Wa` and `b` to `Wb` and `eta` to `Hm` and `mu` to `pi` and `Rt` to `tR`.
- Added `ypr_instant2interval()` and `ypr_interval2instant()` to convert mortality rates.
- Switched `nu` for `M`.
- Added `Mb` to scale mortality by length and `BH` to distinguish between Beverton-Holt and Ricker curves and
`tau` for probability of a mature fish spawning and `Km` for spawning mortality probability and `Sp` for spawning power.
- Added `ypr_ggplot2()` to do customisable bivariate plot.

# ypr 0.0.1

- Initial Release

- Added `ypr_tabulate_parameters()` to get table of parameters, values and descriptions.
- Added `ypr_tabulate_sr()` to get table of eggs and recruits at unfished, actual and optimal rates.

# ypr 0.1.0

- Added `Mb` to scale mortality by length and `BH` to distinguish between Beverton-Holt and Ricker curves and `es` for probability of a mature fish spawning and `Sm` for spawning mortality probability and `Sp` for spawning power and vulnerability power `Vp` and  slot limit non-complicance parameter `Nc` and scaling parameter `R0`.
- Added `ypr_population_update()` to update population parameters.
- Added `ypr_yield_tabulate()` to tabulate actual and optimal yields.
- Added `ypr_sr()` to get stock recruitment parameters and `ypr_plot_sr()` to plot.
- Added `ypr_inst2inter()` and `ypr_inter2instant()` to convert mortality rates.
- Switched `nu` for `M` and `R0` for `Rmax`.
- Switched yield parameters `harvest` and `biomass` to `FALSE` by default.
- Renamed `a` to `Wa` and `b` to `Wb` and `eta` to `Hm` and `mu` to `pi` and `Rt` to `tR`.
- Removed `Capture` (as covered by single value) and `TotalMortality` from schedule and added `Spawning`.

# ypr 0.0.1

- Initial Release

- Added `ypr_sr()` to get stock recruitment parameters and `ypr_plot_sr()` to plot
- Remove `Capture` (as covered by single value) and `TotalMortality` from schedule and added `Spawning`.
- Switched yield parameters `harvest` and `biomass` to `FALSE` by default.
- Added `ypr_population_update()` to update population parameters.
- Renamed `a` to `Wa` and `b` to `Wb` and `eta` to `Hm` and `mu` to `pi` and `Rt` to `tR`.
- Added `ypr_inst2inter()` and `ypr_inter2instant()` to convert mortality rates.
- Switched `nu` for `M`.
- Added `Mb` to scale mortality by length and `BH` to distinguish between Beverton-Holt and Ricker curves and `es` for probability of a mature fish spawning and `Sm` for spawning mortality probability and `Sp` for spawning power and vulnerability power `Vp` and  slot limit non-complicance parameter `Nc` and scaling parameter `R0`.
- 

# ypr 0.0.1

- Initial Release

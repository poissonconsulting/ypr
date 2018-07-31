library(ypr)

.parameters <- read.csv("data-raw/parameters.csv", stringsAsFactors = FALSE)

.parameters$Upper <- as.numeric(.parameters$Upper)

.parameters <- .parameters[order(.parameters$Order),]

.parameters$Grouping <- ordered(.parameters$Grouping, levels = c("Ecological", "Fishery"))
.parameters$Subgrouping <- ordered(.parameters$Subgrouping,
                                   levels = c("Growth", "Reproduction", "Mortality", "Units"))

devtools::use_data(.parameters, internal = TRUE, overwrite = TRUE)

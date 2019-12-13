library(ypr)

.parameters <- read.csv("data-raw/parameters.csv", stringsAsFactors = FALSE)

.parameters$Upper <- as.numeric(.parameters$Upper)

.parameters$Grouping <- ordered(.parameters$Grouping, levels = c("Ecological", "Fishery"))
.parameters$Subgrouping <- ordered(.parameters$Subgrouping,
  levels = c("Growth", "Reproduction", "Mortality", "Capture", "Regulations", "Release", "Units")
)
.parameters$Importance <- ordered(.parameters$Importance, levels = c("Fundamental", "Advanced", "Scaling"))

usethis::use_data(.parameters, internal = TRUE, overwrite = TRUE)

library(tidyverse)
tol <- 10e-4
types <- c("parametric_adjusted",
	"parametric_unadjusted",
	"nonparametric_adjusted",
	"nonparametric_unadjusted",
	"parametric_adjusted_noeb",
	"parametric_unadjusted_noeb",
	"nonparametric_adjusted_noeb",
	"nonparametric_unadjusted_noeb",
	"parametric_adjusted_meanonly",
	"parametric_unadjusted_meanonly",
	"nonparametric_adjusted_meanonly",
	"nonparametric_unadjusted_meanonly",
	"parametric_adjusted_noeb_meanonly",
	"parametric_unadjusted_noeb_meanonly",
	"nonparametric_adjusted_noeb_meanonly",
	"nonparametric_unadjusted_noeb_meanonly"
)
files.r <- paste0("testdata_combat_", types, "_r.csv")
files.matlab <- paste0("testdata_combat_", types, "_matlab.csv")
files.python <- paste0("testdata_combat_", types, "_python.csv")

# Matlab vs R
avail <- 1:4
for (i in avail){
	data_r <- read.csv(file.path("outputData", files.r[i])) %>% as.matrix
	data_matlab <- read.csv(file.path("outputData", files.matlab[i]), head=FALSE) %>% as.matrix
	similarity <- sum((data_r-data_matlab)<tol)/ncol(data_r)/nrow(data_r)*100
	print(similarity)
}

# Python vs R
avail <- c(1:16)
for (i in avail){
	data_r <- read.csv(file.path("outputData", files.r[i])) %>% as.matrix
	data_python <- read.csv(file.path("outputData", files.python[i]), head=FALSE) %>% as.matrix
	similarity <- sum((data_r-data_python)<tol)/ncol(data_r)/nrow(data_r)*100
	print(similarity)
}



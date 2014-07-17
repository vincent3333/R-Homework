data <- read.fwf(file=".\\getdata-wksst8110.for",
                 header = FALSE,
                 skip=4,
                 sep="\t",
                 widths=c(12,7,4,9,4,9,4))
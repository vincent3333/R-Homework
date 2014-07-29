fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl,destfile=".\\gdp.csv",method="auto")
data <- read.csv(".\\gdp.csv")
gdp <- data[grepl("[0-9]+",data$Gross.domestic.product.2012),]
money <- gdp[grepl("[0-9]+",gdp$X.3),"X.3"]
filterm <- gsub(",","",money)
mean(as.numeric(filterm))
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl,destfile=".\\gdp.csv",method="auto")
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl1,destfile=".\\edu.csv",method="auto")
grpdata <- read.csv(".\\gdp.csv")
edudata<- read.csv(".\\edu.csv")
edudata <- edudata[,c("CountryCode","Special.Notes")]
grpdata <- grpdata[,1:2]
colnames(grpdata) <- c("CountryCode","rank")
mergedata <- merge(edudata,grpdata)
fy <- mergedata[grepl("^Fiscal year end(.*)June",mergedata$Special.Notes),"Special.Notes"]
length(fy)
13
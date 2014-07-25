url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url1,destfile=".\\gdp.csv",method="auto")
download.file(url2,destfile=".\\fedstat.csv",method="auto")
gdp <- read.csv(".\\gdp.csv")
gdpData <- gdp[,1:2]
colnames(gdpData) <- c("CountryCode","rank")
fed <- read.csv(".\\fedstat.csv")
library(plyr)
x <- join(gdpData[!is.na(gdpData$CountryCode) & gdpData$CountryCode !="",],fed,by="CountryCode")
y <- x[!is.na(x$rank) & x$rank != "",]
z <- y[order(as.numeric(as.character(y$rank))),]
ic <- x[x$Income.Group != "" & !is.na(x$rank) & x$rank != "",]
tapply(as.numeric(as.character(ic$rank)),ic$Income.Group,mean)

grp = cut(as.numeric(as.character(ic$rank)),breaks=quantile(as.numeric(as.character(ic$rank)),probs=seq(0,1,0.2)))
table(grp,ic$Income.Group)

gp2 <- merge(fed,gdp,by.y="X",by.x="CountryCode")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl,destfile=".\\jeff.jpg",method="auto")
library(jpeg)
jpg <- readJPEG(".\\jeff1.jpg",native=TRUE)
quantile(jpg,probs=c(0.3,0.8))
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile=".\\hid.csv",method="auto")
data <- read.csv(".\\hid.csv")
splitName = strsplit(names(data),"wgtp")
splitName[[123]]
pollutantmean <- function(directory, pollutant, id = 1:332) {
  means <- c()
  for(i in id){
    file <- paste(directory,"/",formatC(i, width = 3, flag = "0"),".csv",sep="")
    data <- read.csv(file, header = TRUE)  
    if(pollutant == "sulfate"){
      pollute <- data[,2]
    }else if(pollutant == "nitrate"){
      pollute <- data[,3]
    }
    good <- complete.cases(pollute)
    pollute[good]
    means <- c(means, pollute[good])
  }  
  means <- as.numeric(mean(means))
  print(round(means,3))
}



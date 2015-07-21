pValue<-function(temp){
  tempAOV <- aov(Counts~Diets, data=temp)
  testP<-summary(tempAOV)[[1]][["Pr(>F)"]][[1]]  
}
filenames <- list.files(pattern="21_samples-HQ-LQ")
for (f in filenames) {
  fd<-read.table(f, header=TRUE)
  result<-pValue(fd)
  rest<-c(f,":",result)
  print(rest)
}

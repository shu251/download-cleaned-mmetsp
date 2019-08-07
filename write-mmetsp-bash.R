# Extract list of MMETSP fasta reads
extract_source <- list.files(pattern="_list.txt")
extract_source

for (i in extract_source){
  imported <- read.table(i, header=F)
  # imported
  partI<-imported[1,1]
  partI <-gsub(":", "/", partI)
  # partI
  partII <- subset(imported, grepl("_clean", imported$V1))
  # partII
  compile <- paste(partI, partII[,1], sep="")
  # compile <- gsub(" ","", compile)
  # compile
  if (!exists("final_list")){
    final_list<-compile # creates the final list of files to import
  } else {
    final_list <-rbind(final_list, compile) # Adds to existing final table
  }
  makecmd <- paste("iget -PT", final_list, "mmetsp_clean/", sep=" ")
  makecmd <- as.data.frame(makecmd)
  rm(compile) # remove excess df
  write.table(makecmd, file="download-mmetsp.sh", row.names = FALSE, col.names = FALSE, quote = FALSE)
}

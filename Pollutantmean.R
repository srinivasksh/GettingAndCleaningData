  pollutantmean <- function(directory, pollutant, id = 1:332) {
      for (i in id) {
            id_pad <- str_pad(i, width=3, pad="0")
            filepath <- paste(directory, (paste(id_pad, "csv", sep = ".")), sep = "\\")
            if (!exists("fileset")) {
                fileset <- read.table(filepath, header = TRUE, sep = ",")
            }
            else {
                tempset <- read.table(filepath, header=TRUE, sep = ",")
                fileset <- rbind(fileset, tempset)  
            }
      }
      mean_col <- mean(fileset[, pollutant], na.rm = TRUE)
      mean_col
  }
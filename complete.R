complete <- function(directory, id = 1:332) {
  for (i in id) {
    id_pad <- str_pad(i, width=3, pad="0")
    filepath <- paste(directory, (paste(id_pad, "csv", sep = ".")), sep = "\\")
    fileset <- read.table(filepath, header = TRUE, sep = ",")
    comp_stat <- sum(complete.cases(fileset))
    fs_comp <- c(i, comp_stat)
    if (!exists("fs_comp_stat")) {
      fs_comp_stat <- rbind(fs_comp, NULL)
    }
    else {
      fs_comp_stat <- rbind(fs_comp_stat, fs_comp)  
    }
  }
  row.names(fs_comp_stat) <- 1:nrow(fs_comp_stat)
  colnames(fs_comp_stat) <- c("id", "nobs")
  fs_comp_stat
}
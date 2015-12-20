con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode <- readLines(con)
close(con)

##return list with all lines of html file
return(htmlcode)

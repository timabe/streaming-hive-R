#! /usr/bin/env Rscript

con <-file('stdin', open = 'r')
while (length(line <- readLines(con, n = 1, warn = FALSE)) > 0) {
    fields <- unlist(strsplit(line, '\t'))
      if (identical(fields[[3]], 'A')) {
            rating<-as.numeric(fields[[2]])/2}
      else {
            rating<-as.numeric(fields[[2]])}
      cat(fields[[1]], '\t', rating, '\t',  fields[[3]], '\n')
}

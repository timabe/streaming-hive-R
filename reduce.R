#! /usr/bin/env Rscript

con <-file('stdin', open = 'r')
means <- numeric(0)
lastKey <- ""
while(length(line<-readLines(con, n = 1, warn = FALSE))>0) {
  fields <- unlist(strsplit(line, '\t'))
    key <- fields[[1]]
    user.rating <- as.numeric(fields[[2]])

    if (!(identical(lastKey, "")) & (!(identical(lastKey, key)))) {
      cat(lastKey, '\t', (mean(means)), '\n')
      lastKey <- key
      means <-c(user.rating)
      } else {
        lastKey <- key
        means <- c(means, user.rating)
      }
}
  cat(paste(lastKey, '\t', mean(means), '\n'))

close(con)

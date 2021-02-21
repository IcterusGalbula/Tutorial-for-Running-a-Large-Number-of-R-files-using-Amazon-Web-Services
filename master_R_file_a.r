
#
# the four lines below are for counting errors
#

.error.count <- 0
old.error.fun <- getOption("error")
new.error.fun <- quote(.error.count <- .error.count + 1)
options(error = new.error.fun, width=2400)

#############################################################################################################

setwd('/home/ubuntu/')

library(doParallel)

detectCores()

my.AWS.n.cores <- detectCores()

registerDoParallel(my.cluster <- makeCluster(my.AWS.n.cores))


folderName <- 'R_files_a'


files <- list.files(folderName, full.names=TRUE)

start.time <- Sys.time()

foreach(file = files, .errorhandling = "remove") %dopar% {
  source(file)
}

stopCluster(my.cluster)

end.time <- Sys.time()
total.time.c <- end.time-start.time
total.time.c


#############################################################################################################

#
# the three lines below count the number of errors in the code above
#

cat("ERROR COUNT:", .error.count, "\n")
options(error = old.error.fun)
rm(.error.count, old.error.fun, new.error.fun)

##########


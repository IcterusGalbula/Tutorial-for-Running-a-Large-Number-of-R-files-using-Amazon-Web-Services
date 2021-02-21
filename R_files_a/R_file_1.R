
#
# the four lines below are for counting errors
#

.error.count <- 0
old.error.fun <- getOption("error")
new.error.fun <- quote(.error.count <- .error.count + 1)
options(error = new.error.fun, width=2400)

##############################################################################################################################

my.model.number <- 1
my.group        <- 'a'

# working directory for laptop
# setwd('C:/Users/mark_/Documents/R_on_the_cloud/Tutorial_for_Running_a_Large_Number_of_R_files_using_Amazon_Web_Services_on_the_Cloud_to_GitHub/')

# working directory for AWS cloud
  setwd('/home/ubuntu/')

##############################################################################################################################

my.data <- read.csv(paste0('Input_data_files_', my.group, '/Input_data_file_', my.model.number, '.csv'), header = TRUE, stringsAsFactors = FALSE, na.strings = "NA")

my.data$c <- my.data$a + my.data$b
my.data

head(my.data)
 
write.csv(my.data, paste0('Output_data_files_', my.group, '/Output_data_file_', my.model.number, '.csv'), row.names = FALSE, quote = FALSE)

##############################################################################################################################
##############################################################################################################################

#
# the three lines below count the number of errors in the code above
#

cat("ERROR COUNT:", .error.count, "\n")
options(error = old.error.fun)
rm(.error.count, old.error.fun, new.error.fun)

##########

# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

merge_data <- function(input.subject = "subject_train.txt", input.activity = "y_train.txt", 
                       input.train = "X_train.txt", names.train = "features.txt"){ 
  
  # named activity value, e.g. 1 ... WALKING, 2 ... WALKING_UPSTAIRS ...
  activities.desc <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
  
  # read subject data
  df.combine.1 <- read.csv(input.subject, sep = "", header=F, stringsAsFactors=F)
  colnames(df.combine.1) <- "subject"
  # read activity data
  df.combine.2 <- read.csv(input.activity, sep = "",  header=F, stringsAsFactors=F)
  colnames(df.combine.2) <- "activity"  
  for(i in (1:6)) {
    df.combine.2[df.combine.2==i] <- activities.desc[i]
  }
  # read training data
  df.combine.3 <- read.csv(input.train, sep = "", header=F, stringsAsFactors=F)
  df.combine.3.colnames <- read.csv(names.train, sep="", header=F, stringsAsFactors=F)
  li.combine.3.colnames <- as.list(df.combine.3.colnames[,2])  
  colnames(df.combine.3) <- li.combine.3.colnames
  # combine subject, activity and training data into one df
  df.combine <- data.frame(df.combine.1,df.combine.2,df.combine.3)
  # remove objects that are no longer needed
  rm.list = c("df.combine.1", "df.combine.2", "df.combine.3", "df.combine.3.colnames", "li.combine.3.colnames")
  rm(list = rm.list)
  # return combine
  df.combine  
}

merge_both_datasets <- function() {
  df.train = merge_data(input.subject = "subject_train.txt", input.activity = "y_train.txt", 
              input.train = "X_train.txt", names.train = "features.txt")
  df.test = merge_data(input.subject = "subject_test.txt", input.activity = "y_test.txt", 
                       input.train = "X_test.txt", names.train = "features.txt")
  
  # append test data set to training set
  df.full <- rbind(df.train, df.test)
  
  # select columns containing the word mean or std
  df.selected <- df.full[,grepl("(subject|activity|mean|std)", colnames(df.full))]      
  
  # return selected
  df.selected
  
}

do_all_assignment_steps <- function() {
  # merge trainings and test dataset
  df.selected <- merge_both_datasets()
  # write result to file
  write.table(df.selected, file = "df.selected.txt", row.name=FALSE )
  
  df.calc <- df.selected %>% group_by(subject, activity) %>% summarise_each(funs(mean))
  write.table(df.calc, file = "df.calc.txt", row.name=FALSE )
}


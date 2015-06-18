# GetData-015
Getting and Cleaning Data

Assignment:
  You should create one R script called run_analysis.R that does the following. 
  Merges the training and the test sets to create one data set.
  Extracts only the measurements on the mean and standard deviation for each measurement. 
  Uses descriptive activity names to name the activities in the data set
  Appropriately labels the data set with descriptive variable names. 
  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
Prerequisite 
  Copy the following files out of https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into your working directory of R:
  - /features.txt which contains all feature names captured
  - /test/subject_test.txt
  - /test/X_test.txt
  - /test/y_test.txt
  - /train/subject_train.txt
  - /train/X_train.txt
  - /train/y_train.txt

Description
  The script run_analysis.R contains three functions: 
  - merge_data() which combines the three files subject_*, X_* and y_* to one dataset
  - merge_both_datasets() combines the training and the test dataset to one comprehensive dataset
  - do_all_assignment_steps() calls the merge_both_dataset function and stores the result in a file called df.selected.txt which contains only subject, activity and columns containing mean or std values. Furthermore, it creates an df.calc.txt which contains the mean values of all mean and std parameter grouped by subject and activity

Detailed information about the inital data set can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

In order to create the result data set the following steps have been performed for first the training data and then the test data.

First, all subjects (subject_test.txt, subject_train.txt) have been loaded into a dataframe. the column has been labeled with the heading subject
Second, the activities (y_test.txt, y_train.txt) performed have been loaded into a dataframe and the value 1...6 have been replaced by meaningful names of the activity "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING". the column has been labeld with the heading activity
Third, the training data has been loaded into a dataframe. In order to name the columns features.txt was used

After having to sets containing training and test data, the test data has been appended to the training data. In the last step all columns containing the values subject, activity, mean or std have been filtered and finally stored to a file called "df.selected.txt"

Further refinements of the set by grouping the data by subject and activity have been carried. For each group of subject and activity the mean values of all other columns have been taken. The result is stored in file "df.calc.txt"

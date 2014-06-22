Getting and Cleaning Data Course Project CodeBook
-------------------------------------------------
This file describes the data, the variables, and code implementation that I have performed to clean up the data.  
* The data has been obtained from below site: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
The data for the project has been retrieved from below site and copied into folder Dataset:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* The run_analysis.R script performs the following steps to clean the data:   
 1. Read X_test.txt, y_test.txt and subject_test.txt from the Dataset folder and store them in *test_Data*, *test_Label* and *test_Subject* variables respectively.  
 2. Read X_train.txt, y_train.txt and subject_train.txt from the Dataset folder and store them in *train_Data*, *train_Label* and *train_Subject* variables respectively.
 3. Concatenate *test_Data* to *train_Data* to generate a 10299x561 data frame, *merge_Data*; concatenate *test_Label* to *train_Label* to generate a 10299x1 data frame, *merge_Label*; concatenate *test_Subject* to *train_Subject* to generate a 10299x1 data frame, *merge_Subject*.  
 4. Read the features.txt file from the Dataset folder and store the data in a variable called *features*. 
 5. Extract the measurements on the mean and standard deviation. This results in a 66 indices list. We get a subset of *merge_Data* with the 66 corresponding columns.  
 6. Clean the column names of the subset. Remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.   
 7. Read the activity_labels.txt file from the Dataset folder and store the data in a variable called *activity*.  
 8. Clean the activity names in the second column of *activity*. Make all names to lower cases. If the name has an underscore between letters, remove the underscore and capitalize the letter immediately after the underscore.  
 9. Transform the values of *merge_Label* according to the *activity* data frame.  
 10. Combine the *merge_Subject*, *merge_Label* and *merge_Data* by column to get a new cleaned 10299x68 data frame, *cleaned_Data*. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.  
 11. Write the *cleaned_Data* out to "cleaned_data.txt" file in current working directory.  
 12. Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the *result* data frame and performing the two for-loops, we get a 180x68 data frame.
 13. Write the *result* out to "average_data.txt" file in current working directory. 
 
© Srikanth Kamineni 2014 All Rights reserved.

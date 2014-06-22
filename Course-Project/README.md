Getting and Cleaning Data Course Project
----------------------------------------
This file describes how run_analysis.R script functions.
1. Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Rename the folder with "Dataset".
3. Create "run_analysis.R" script to implement the code.
4. Make sure the folder "Dataset" and the "run_analysis.R" script are both in the current working directory.
5. Use source("run_analysis.R") command in RStudio console to compile. 
6. After completion of implement, compile and debug, two outfiles are generated in the current working directory.
    - cleaned_data.txt: The file contains a data frame called cleaned_Data with 10299*68 dimension.
    - average_data.txt: The file contains a data frame called result with 180*68 dimension.
7. Finally, use average_data <- read.table("average_data.txt") command in RStudio to read the file. As we are required to      get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects    in total, we have 180 rows with all combinations for each of the 66 features. 

© Srikanth Kamineni 2014 All Rights reserved.

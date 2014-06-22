#1. Merges the training and the test sets to create one data set.

#1.a Read data in test folder
test_Data <- read.table("c:/Srikanth/Coursera/Getting and Cleaning Data/Assignment/Dataset/test/X_test.txt")
test_Label <- read.table("c:/Srikanth/Coursera/Getting and Cleaning Data/Assignment/Dataset/test/y_test.txt")
test_Subject <- read.table("c:/Srikanth/Coursera/Getting and Cleaning Data/Assignment/Dataset/test/subject_test.txt")

#1.b Read data in train folder
train_Data <- read.table("c:/Srikanth/Coursera/Getting and Cleaning Data/Assignment/Dataset/train/X_train.txt")
train_Label <- read.table("c:/Srikanth/Coursera/Getting and Cleaning Data/Assignment/Dataset/train/y_train.txt")
train_Subject <- read.table("c:/Srikanth/Coursera/Getting and Cleaning Data/Assignment/Dataset/train/subject_train.txt")

#1.c Merge into one data set
merge_Data <- rbind(test_Data, train_Data)
merge_Label <- rbind(test_Label, train_Label)
merge_Subject <- rbind(test_Subject, train_Subject)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("c:/Srikanth/Coursera/Getting and Cleaning Data/Assignment/Dataset/features.txt")
mean_std <- grep("mean\\(\\)|std\\(\\)", features[, 2])
merge_Data <- merge_Data[, mean_std]
names(merge_Data) <- gsub("\\(\\)", "", features[mean_std, 2])
names(merge_Data) <- gsub("mean", "Mean", names(merge_Data))
names(merge_Data) <- gsub("std", "Std", names(merge_Data))
names(merge_Data) <- gsub("-", "", names(merge_Data))

#3. Uses descriptive activity names to name the activities in the data set
activity <- read.table("c:/Srikanth/Coursera/Getting and Cleaning Data/Assignment/Dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activity_Label <- activity[merge_Label[, 1], 2]
merge_Label[, 1] <- activity_Label
names(merge_Label) <- "activity"

#4. Appropriately labels the data set with descriptive variable names.
names(merge_Subject) <- "subject"
cleaned_Data <- cbind(merge_Subject, merge_Label, merge_Data)
write.table(cleaned_Data, "c:/Srikanth/Coursera/Getting and Cleaning Data/Assignment/Dataset/cleaned_data.txt")

#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
subject_Len <- length(table(merge_Subject))
activity_Len <- dim(activity)[1]
column_Len <- dim(cleaned_Data)[2]
result <- matrix(NA, nrow=subject_Len*activity_Len, ncol=column_Len) 
result <- as.data.frame(result)
row <- 1
for(i in 1:subject_Len) {
        for(j in 1:activity_Len) {
                result[row, 1] <- sort(unique(merge_Subject)[, 1])[i]
                result[row, 2] <- activity[j, 2]
                bool1 <- i == cleaned_Data$subject
                bool2 <- activity[j, 2] == cleaned_Data$activity
                result[row, 3:column_Len] <- colMeans(cleaned_Data[bool1&bool2, 3:column_Len])
                row <- row + 1
        }
}
head(result)
write.table(result, "c:/Srikanth/Coursera/Getting and Cleaning Data/Assignment/Dataset/average_data.txt")

#1. Merge the training and the test sets to create one data set.

testTemp <- read.table("test/X_test.txt")
trainTemp <- read.table("train/X_train.txt")
merge_X <- rbind(trainTemp, testTemp)
trainTemp <- read.table("train/subject_train.txt")
testTemp <- read.table("test/subject_test.txt")
merge_subject <- rbind(trainTemp, testTemp)
trainTemp <- read.table("train/y_train.txt")
testTemp <- read.table("test/y_test.txt")
merge_y <- rbind(trainTemp, testTemp)

#2.Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("features.txt")
goodFeatures <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])


#Load DataSets
merge_X <- merge_X[, goodFeatures]
names(merge_X) <- features[goodFeatures, 2]
names(merge_X) <- gsub("\\(|\\)", "", names(merge_X))
names(merge_X) <- gsub('-std', '-Std', names(merge_X))
names(merge_X) <- gsub('-mean', '-Mean', names(merge_X))

# 3. Use descriptive activity names to name the activities in the data set.
activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", as.character(activities[, 2]))

merge_y[,1]= activities[merge_y[,1],2]
names(merge_y) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names.

names(merge_subject)<- "Subject"
cleanData <- cbind(merge_X, merge_y, merge_subject)
write.table(cleanData, "cleanData.txt")

# 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

average_data <- ddply(cleanData, .(Subject, activity), function(x) colMeans(x[, 1:66]))
write.table(average_data, "averages_data.txt", row.name=FALSE)


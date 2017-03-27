#Code Book

Script run_analysis.R performs the following to clean up the source dat obtained from the following source:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description of data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

1. Merge training and test dataset using rbind() function.
2. Reads Features.txt and extracts only the measurements on the mean and Standard deviation. Measurements are floating point number types in the range -1,1
3. Applies descriptive labels by reading activity_labels.txt in order to name the activities in the dataset. Script also labels feature names, Underscore(_) and parentheses are removed from activity names.
4. Merge dataframe containing features, activity labels and subject IDs.The merged data is saved in "cleanData.txt"
4. Generate a new dataset with all the average measures for each subject and activity types


Variables:

1. testTemp, trainTemp contain data from the downloaded files. As seen the variables are reused multiple times.
2. merge_X, merge_y and merge_subject contain all the merged dataset downloaded from the files.
3. "features" contain the correct names for "merge_X"
4. Similarly "activities" contain the correct names for "merge_y"
5. "cleanData" contains the result after merging  merge_X, merge_y and merge_subject
6. "average_data" contains the averages which is later stored in txt file.
7. Using ddply() from the dplyr package we find averages by applying colMean().
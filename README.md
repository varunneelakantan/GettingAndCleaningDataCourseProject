Project- Week 4 Getting and Cleaning Data Get the source files from the below url:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

1.Unzip the downloaded file to a directory of your choice. 

2.Download run_analysis.R to the unzipped directory. 

3. Execute the script.

run_analysis.R script is to create 1 tidy data table from the data files which is downloaded using the above URL.

run_analysis.R contains the following execution steps:

1. Read all data from the files and store them in R variables. Script reuses the same two temp variables(testTemp and trainTemp) to temporarily store X, Subject and Y data files.

2. Merge test and train data using rbind function and store them in merge_X,merge_Y and merge_subject

3. Extract measurements from features.txt files and store in features variable

4. Search and store the required/good features in goodFeatures variable.

5. subset merge_X on the columns using goodfeatures

6. Appropriately name the columns.

7. Read activity labels from activity_labels.txt files and store in activities variables

8. Use activities variable to appropriately name columns in merge_y

9. Tidy data after merging merge_x,merge_y and merge_subject is stored in cleanData variable and the output is written to cleanData.txt.

10. Average data is found using ddply package by applying colmeans functions and the output is written to averages_data.txt

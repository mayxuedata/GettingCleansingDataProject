# Introduction
This repository is for the course project of Getting and Cleansing Data from Coursera. 

The project uses data collected from the accelerometers from the Samsung Galaxy S smartphone, performs operations to cleanse the datasets and creates a tidy dataset as required. 

# File Descriptions
##CodeBook.md
Describes how data files are read, merged, transformed into the tidy data set. 

## UCI HAR Dataset
The accelerometer data from the Samsung Galaxy S smartphone downloaded and unzipped from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##run_analysis.R
The R script that creates a tidy data set from the given data sets, the script does the following:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##tidy_data.txt
The tidy data set after the transformations has been written to tidy_data.txt, with fields separated by commas, without row headers, as required by the assignment. 
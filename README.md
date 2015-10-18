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

## How the Script Works
The following transformations have been done to the data set:
- The data set is downloaded from the URL given, and is saved to local as dataset.zip
- The file is unzipped
- Read the activity, subject and feature files for both training and testing sets into dataframes
- Merge the training and testing data
- Read the features.txt file and add column names to activity, subject and feature data
- Merge the activity, subject and feature data
- Extract only mean and standard deviation measurements
- Get activity names from activity_labels.txt and use the descriptive activity names to name the activities in the data set
- Calculate the average of each variable for each activity and each subject
- Write the tidy dataset to a txt file named tidy_data.txt without row names

##tidy_data.txt
The tidy data set after the transformations has been written to tidy_data.txt, with fields separated by commas, without row headers, as required by the assignment. 
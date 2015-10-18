#Set working directory if needed

#Download file
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file_url, destfile="./dataset.zip", method="curl")

#Unzip the data file
unzip(zipfile="./dataset.zip")

#Set the path of the data folder
data_path <- "./UCI HAR Dataset"

#Read activity files
training_activity <- read.table(file.path(data_path, "train", "Y_train.txt"), header = FALSE)
testing_activity  <- read.table(file.path(data_path, "test" , "Y_test.txt" ), header = FALSE)

#Read subject files
training_subject <- read.table(file.path(data_path, "train", "subject_train.txt"), header = FALSE)
testing_subject  <- read.table(file.path(data_path, "test" , "subject_test.txt"), header = FALSE)

#Read feature files
training_feature <- read.table(file.path(data_path, "train", "X_train.txt"), header = FALSE)
testing_feature  <- read.table(file.path(data_path, "test" , "X_test.txt" ), header = FALSE)

#Merge training and testing data
all_activity <- rbind(training_activity, testing_activity)
all_subject <- rbind(training_subject, testing_subject)
all_feature <- rbind(training_feature, testing_feature)

#Add column names
feature_names <- read.table(file.path(data_path, "features.txt"), head=FALSE)

names(all_activity) <- "activity"
names(all_subject) <- "subject"
names(all_feature) <- feature_names$V2

#Merge the activity, subject and feature data
all_data <- cbind(cbind(all_activity, all_subject), all_feature)

#Extract mean and standard deviation measurements
extracted_data <- subset(all_data, select = grep("mean|std|activity|subject", names(all_data)))

#Get activity names
activity_names <- read.table(file.path(data_path, "activity_labels.txt"), header = FALSE)

#Uses descriptive activity names to name the activities in the data set
extracted_data$activity <- factor(extracted_data$activity, levels=activity_names$V1, labels=activity_names$V2)

#Create a tidy dataset with the average of each variable for each activity and each subject
library(data.table)
tidy_data <- data.table(extracted_data)[, lapply(.SD, mean), by="subject,activity"]
write.table(tidy_data, file="tidy_data.txt", sep=",", row.names = FALSE)

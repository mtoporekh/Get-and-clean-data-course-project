## Course project script
## Author: Moises Toporek
## Script creates a tidy data that can be used for future analysis-

## 1. Setting the working directory
setwd("~/Coursera R Programming/get_and_clean_assignment/project")

## 2. Loads librery deplyr for selects, filters and grouping data
library("dplyr")

## 3. Load of all datasets to use
## 3.1 Activity labels
activity_labels_file <- read.table("activity_labels.txt",col.names=c("Activity_ID","Activity"))
## 3.2 Features messured for using as a column names
cnames_file <- read.table("features.txt")
## 3.3 Subjects, activities IDs and values for the Test group
subjects_test_file <- read.table("subject_test.txt",col.names="Subject")
activities_test_file <- read.table("y_test.txt",col.names="Activity_ID")
values_test_file <- read.table("X_test.txt",col.names=cnames_file[,2])
## 3.4 Subjects, activities IDs and values for the Training group
subjects_train_file <- read.table("subject_train.txt",col.names="Subject")
activities_train_file <- read.table("y_train.txt",col.names="Activity_ID")
values_train_file <- read.table("X_train.txt",col.names=cnames_file[,2])

## 4. Getting all files together in one big Dataset
DF_temp <- rbind(cbind(subjects_test_file,activities_test_file,values_test_file),cbind(subjects_train_file,activities_train_file,values_train_file))

## 5. Merging to add the activity labels for each row
DF <- merge(DF_temp,activity_labels_file,by=intersect(names(DF_temp),names(activity_labels_file)))

## 6. Just to remove and release memory
rm(activity_labels_file,cnames_file,subjects_test_file,activities_test_file,values_test_file,subjects_train_file,activities_train_file,values_train_file,DF_temp)

## 7. Getting the tidy data for columns that meassures mean and standard deviation
mean_std_set<-select(DF,Subject,Activity,contains("mean"),contains("std"),-contains("meanfreq"),-starts_with("angle"))

## 8. Grouping by Subject and Activity, and compute the average for each column
AVG_DS <- mean_std_set %>%
  group_by(Subject,Activity) %>%
  summarise_each(funs(mean))

## 9. Writing to a txt file
write.table(AVG_DS,file="Tidy_data.txt",row.names=FALSE)
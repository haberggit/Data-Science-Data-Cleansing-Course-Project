## This is an R script called run_analysis.R

## The purpose of this program is:
##  1.  Merge two data sets (training and test) into one data set
##  2.  Extract only the measurements on the mean and SD for each measurement
##  3.  Record descriptive activity names in the data set
##  4.  Appropriate labels data set w descriptive variable names
##  5.  From #4, creata second, independent tidy data set w/ 
##      the average of each variable for each activity and each subject.

## First let's save the working directory so we can restore when fininished
start_wd <- getwd()

## This is the directory where the analysis will be conducted
## This requires that the Samsung data is in this directory
## To be clear, this is where the zip file is downloaded to
## Once the zip file is uncompressed, it creates multiple subdirectories
##    which must be present for this code to work correctly!!!!
##    Here is the expected directory hierarchy:
##       "./UCI HAR Dataset" (this is created during the unzip)
##      and where the run_analysis program should be executed from.
##      NOTE:  It is not necessary to be called "UCI HAR Dataset", 
##      BUT THE EXPECTED FILES FROM THE UNZIP AND THE FOLLOWING SUBDIRECTORIES MUST EXIST!!
##      the unzip creates two subdirectories:  "test" and "train"


## These files contain the activity labels and features labels
file_features <- "features.txt"
file_activ_labels <- "activity_labels.txt"

## Let's get the common data first -- feature labels and activity labels
## Then we can apply these labels to the test and train data
features_df <- read.table(file_features, colClasses=c("numeric", "character"), col.names=c("feat_nbr", "feat_label"))
activ_labels_df <- read.table(file_activ_labels, colClasses=c("numeric", "character"), col.names=c("activ_nbr", "activ_label"))

## This subdirectory is where the test and train files were unzipped into
file_test_subject <- "./test/subject_test.txt" ## the subject numbers
file_test_activ <- "./test/y_test.txt" ## the activity codes
file_test_data <- "./test/X_test.txt"  ## the data measurements

## Now let's get the test data -- three files -- subject nbr, activ nbr & observations
test_subj_df <- read.table(file_test_subject, col.names="subj_nbr")
test_activ_df <- read.table(file_test_activ, col.names="activ_nbr")
test_activ_df_labels <- merge(test_activ_df, activ_labels_df)
test_data_df <- read.table(file_test_data, col.names=features_df$feat_label)

test_comb_df <- cbind(test_subj_df, test_activ_df_labels, test_data_df)

## Also subset so only the measurements on the mean and std included
## Note, this also removes the activ_nbr since we already have the name
## to make it more tidy (no duplicate data)
## Extract only the mean and std measurements
## But keep the subject number and activity labels
test_comb_df_mstd <- select(test_comb_df, subj_nbr, activ_label, contains("mean"), contains("std"))

## Now let's get the train data
file_train_subject <- "./train/subject_train.txt" ## the subject numbers
file_train_activ <- "./train/y_train.txt" ## the activity codes
file_train_data <- "./train/X_train.txt"  ## the data measurements

train_subj_df <- read.table(file_train_subject, col.names="subj_nbr")
train_activ_df <- read.table(file_train_activ, col.names="activ_nbr")
train_activ_df_labels <- merge(train_activ_df, activ_labels_df)
train_data_df <- read.table(file_train_data, col.names=features_df$feat_label)

train_comb_df <- cbind(train_subj_df, train_activ_df_labels, train_data_df)

## Also subset so only the measurements on the mean and std included
## Note, this also removes the activ_nbr since we already have the name
## to make it more tidy (no duplicate data)
## Extract only the mean and std measurements
## But keep the subject number and activity labels
train_comb_df_mstd <- select(train_comb_df, subj_nbr, activ_label, contains("mean"), contains("std"))

## Combine the test and the train data into 1 df
comb_df_mstd <- rbind(test_comb_df_mstd, train_comb_df_mstd)

## Group by subject number and activity, then summarize to get the means
temp_result_df <- group_by(comb_df_mstd, subj_nbr, activ_label)
result_df <- summarise_each(temp_result_df, funs(mean))

## Write the result to a csv file so can be loaded to Excel to verify results more easily
write.csv(result_df, file="course_proj.csv")

## Write the result using write.table as txt for submission
write.table(result_df, file="course_proj.txt", row.names=FALSE)

## Return working directory to starting dir
setwd(start_wd)


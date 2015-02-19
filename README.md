# Data-Science-Data-Cleansing-Course-Project
Course Project - Johns Hopkins Data Science

There are 3 files that make up the main deliverables of this project 
*  1. R script called run_analysis.R (details below)
*  2. This README file which gives explanation of the R script
*  3. A Code Book which describes the variables of the output tidy data set

The purpose of the run_analysis R script is:
*  1.  Merge two data sets (training and test) into one data set
*  2.  Extract only the measurements on the mean and SD for each measurement
*  3.  Record descriptive activity names in the data set
*  4.  Appropriate labels data set w descriptive variable names
*  5.  From #4, creata second, independent tidy data set w/ 
*      the average of each variable for each activity and each subject.

The input data was downloaded from:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The zip file uncompresses and creates multiple subdirectories
    which must be present for this code to work correctly!!!!
    Here is the expected directory hierarchy:
       "./UCI HAR Dataset" (this is created during the unzip)
      and where the run_analysis program should be executed from.
      NOTE:  It is not necessary for the directory to be called "UCI HAR Dataset", 
      BUT THE EXPECTED FILES FROM THE UNZIP AND THE FOLLOWING SUBDIRECTORIES MUST EXIST!!
      the unzip creates two subdirectories:  "test" and "train"

 
There some common data (works for "test" and "train") -- feature labels and activity labels
So we begin by reading that in first into two data frames called:
* features_df (created from "features.txt")
* activ_labels_df (created from "activity_labels.txt")

Next, data frames are created for the "test" data -- subject numbers, activity numbers, and observations
* test_subj_df (created from "./test/subject_test.txt") the subject numbers
* test_activ_df (created from "./test/y_test.txt") the activity codes
* test_activ_df_labels <- a temp df created by merging activity codes and activity labels
* test_data_df (created from "./test/X_test.txt") the test data measurements

The above "raw" test data is combined into the following data frame:
* test_comb_df 

Extract only the mean and std measurements since that is what we are interested in (makes more tidy)
But keep the subject number and activity labels
The resulting data frame for the "test" data is:
* test_comb_df_mstd 

The same steps are completed for the "train" data resulting in the following data frame:
* train_comb_df_mstd

Combined test and the train data into 1 df:
* comb_df_mstd 

The combined data is then grouped by subject number and activity, then summarized to get the means
* temp_result_df (a temp df as a result of grouping)
* result_df (the result df that is summarized to get the means of the groups)

Write the result_df using write.table as txt for submission
The name of the output file="course_proj.txt"



### This is the code book for the tidy data set that was created from run_analysis.R

The origin of the data was the Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
Full details of all the original data and their descriptions can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The original data sets were:
```
* features.txt -- labels for all of the 561 features in the observation data sets
* activity_labels.txt -- labels for the 6 activities measured
* X_test.txt -- the actual data measurements for the "test" subjects
* y_test.txt -- the activity codes relating to the "test" data observations
* subject_test.txt -- the subject codes relating to the "test" data observations
* X_train.txt  -- the actual data measurements for the "train" subjects
* y_train.txt  -- the activity codes relating to the "train" data observations
* subject_train.txt -- -- the subject codes relating to the "train" data observations
```
```
The original data were transformed as follows:
1.  A single data frame for each "test" and "train" was created by 
    merging (merge()) the activty codes and labels
    and then column binding (cbind()) the subject data, activity labels, and observations 
2.  Each data set was then subset using select() to extract only the relevant data for analysis:
    subject, activity, and the observations containining mean and standard deviation data
3.  The "test" and "train" df's were then combined into a single df for further analysis
4.  The data were then grouped (group_by()) by subject and activity, 
    then summarized (summarise_each()) to get the mean for each numeric observation
```
The resulting tidy data set created by run_analysis.R is called "course_proj.txt" and contains the following 88 variables.  
[1] "sub_nbr" - integer - the subject number - valid subject numbers are 1-30
[2] "activ_label" - character - the label describing the activity - valid activities are
                 WALKING
                 WALKING_UPSTAIRS
                 WALKING_DOWNSTAIRS
                 SITTING
                 STANDING
                 LAYING
[3:88] -  numeric - contains calcluated mean() for the subject/activity.  Each of the following 86 variables contains a calculated mean of the time and frequency domain variables that were denoted as a mean or standard deviation variable in the original data sets (note: details of the original data are described at the url cited above.)

 [3] "tBodyAcc.mean...X"                    "tBodyAcc.mean...Y"                   
 [5] "tBodyAcc.mean...Z"                    "tGravityAcc.mean...X"                
 [7] "tGravityAcc.mean...Y"                 "tGravityAcc.mean...Z"                
 [9] "tBodyAccJerk.mean...X"                "tBodyAccJerk.mean...Y"               
[11] "tBodyAccJerk.mean...Z"                "tBodyGyro.mean...X"                  
[13] "tBodyGyro.mean...Y"                   "tBodyGyro.mean...Z"                  
[15] "tBodyGyroJerk.mean...X"               "tBodyGyroJerk.mean...Y"              
[17] "tBodyGyroJerk.mean...Z"               "tBodyAccMag.mean.."                  
[19] "tGravityAccMag.mean.."                "tBodyAccJerkMag.mean.."              
[21] "tBodyGyroMag.mean.."                  "tBodyGyroJerkMag.mean.."             
[23] "fBodyAcc.mean...X"                    "fBodyAcc.mean...Y"                   
[25] "fBodyAcc.mean...Z"                    "fBodyAcc.meanFreq...X"               
[27] "fBodyAcc.meanFreq...Y"                "fBodyAcc.meanFreq...Z"               
[29] "fBodyAccJerk.mean...X"                "fBodyAccJerk.mean...Y"               
[31] "fBodyAccJerk.mean...Z"                "fBodyAccJerk.meanFreq...X"           
[33] "fBodyAccJerk.meanFreq...Y"            "fBodyAccJerk.meanFreq...Z"           
[35] "fBodyGyro.mean...X"                   "fBodyGyro.mean...Y"                  
[37] "fBodyGyro.mean...Z"                   "fBodyGyro.meanFreq...X"              
[39] "fBodyGyro.meanFreq...Y"               "fBodyGyro.meanFreq...Z"              
[41] "fBodyAccMag.mean.."                   "fBodyAccMag.meanFreq.."              
[43] "fBodyBodyAccJerkMag.mean.."           "fBodyBodyAccJerkMag.meanFreq.."      
[45] "fBodyBodyGyroMag.mean.."              "fBodyBodyGyroMag.meanFreq.."         
[47] "fBodyBodyGyroJerkMag.mean.."          "fBodyBodyGyroJerkMag.meanFreq.."     
[49] "angle.tBodyAccMean.gravity."          "angle.tBodyAccJerkMean..gravityMean."
[51] "angle.tBodyGyroMean.gravityMean."     "angle.tBodyGyroJerkMean.gravityMean."
[53] "angle.X.gravityMean."                 "angle.Y.gravityMean."                
[55] "angle.Z.gravityMean."                 "tBodyAcc.std...X"                    
[57] "tBodyAcc.std...Y"                     "tBodyAcc.std...Z"                    
[59] "tGravityAcc.std...X"                  "tGravityAcc.std...Y"                 
[61] "tGravityAcc.std...Z"                  "tBodyAccJerk.std...X"                
[63] "tBodyAccJerk.std...Y"                 "tBodyAccJerk.std...Z"                
[65] "tBodyGyro.std...X"                    "tBodyGyro.std...Y"                   
[67] "tBodyGyro.std...Z"                    "tBodyGyroJerk.std...X"               
[69] "tBodyGyroJerk.std...Y"                "tBodyGyroJerk.std...Z"               
[71] "tBodyAccMag.std.."                    "tGravityAccMag.std.."                
[73] "tBodyAccJerkMag.std.."                "tBodyGyroMag.std.."                  
[75] "tBodyGyroJerkMag.std.."               "fBodyAcc.std...X"                    
[77] "fBodyAcc.std...Y"                     "fBodyAcc.std...Z"                    
[79] "fBodyAccJerk.std...X"                 "fBodyAccJerk.std...Y"                
[81] "fBodyAccJerk.std...Z"                 "fBodyGyro.std...X"                   
[83] "fBodyGyro.std...Y"                    "fBodyGyro.std...Z"                   
[85] "fBodyAccMag.std.."                    "fBodyBodyAccJerkMag.std.."           
[87] "fBodyBodyGyroMag.std.."               "fBodyBodyGyroJerkMag.std.."      

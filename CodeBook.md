#CodeBook

## 1) Data source

Data was provided as part of the assignment
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



## 2) Tidydata

An object named tidydata was constructed with following columns. 

| Column | Original Variable |
|------------------------|-------------------------------------------------------------|
|Subject | Subject |
|Activity | Activity name (factored from activity_labels.txt) |
|Time.Body.Accelerometer.Mean.X | tBodyAcc-mean()-X |
|Time.Body.Accelerometer.Mean.Y | tBodyAcc-mean()-Y |
|Time.Body.Accelerometer.Mean.Z | tBodyAcc-mean()-Z |
|Time.Body.Accelerometer.StandardDeviation.X | tBodyAcc-std()-X |
|Time.Body.Accelerometer.StandardDeviation.Y | tBodyAcc-std()-Y |
|Time.Body.Accelerometer.StandardDeviation.Z | tBodyAcc-std()-Z |
|Time.Gravity.Accelerometer.Mean.X | tGravityAcc-mean()-X |
|Time.Gravity.Accelerometer.Mean.Y | tGravityAcc-mean()-Y |
|Time.Gravity.Accelerometer.Mean.Z | tGravityAcc-mean()-Z |
|Time.Gravity.Accelerometer.StandardDeviation.X | tGravityAcc-std()-X |
|Time.Gravity.Accelerometer.StandardDeviation.Y | tGravityAcc-std()-Y |
|Time.Gravity.Accelerometer.StandardDeviation.Z | tGravityAcc-std()-Z |
|Time.Body.LinearAcceleration.Mean.X | tBodyAccJerk-mean()-X |
|Time.Body.LinearAcceleration.Mean.Y | tBodyAccJerk-mean()-Y |
|Time.Body.LinearAcceleration.Mean.Z | tBodyAccJerk-mean()-Z |
|Time.Body.LinearAcceleration.StandardDeviation.X | tBodyAccJerk-std()-X |
|Time.Body.LinearAcceleration.StandardDeviation.Y | tBodyAccJerk-std()-Y |
|Time.Body.LinearAcceleration.StandardDeviation.Z | tBodyAccJerk-std()-Z |
|Time.Body.Gyroscope.Mean.X | tBodyGyro-mean()-X |
|Time.Body.Gyroscope.Mean.Y | tBodyGyro-mean()-Y |
|Time.Body.Gyroscope.Mean.Z | tBodyGyro-mean()-Z |
|Time.Body.Gyroscope.StandardDeviation.X | tBodyGyro-std()-X |
|Time.Body.Gyroscope.StandardDeviation.Y | tBodyGyro-std()-Y |
|Time.Body.Gyroscope.StandardDeviation.Z | tBodyGyro-std()-Z |
|Time.Body.AngularVelocity.Mean.X | tBodyGyroJerk-mean()-X |
|Time.Body.AngularVelocity.Mean.Y | tBodyGyroJerk-mean()-Y |
|Time.Body.AngularVelocity.Mean.Z | tBodyGyroJerk-mean()-Z |
|Time.Body.AngularVelocity.StandardDeviation.X | tBodyGyroJerk-std()-X |
|Time.Body.AngularVelocity.StandardDeviation.Y | tBodyGyroJerk-std()-Y |
|Time.Body.AngularVelocity.StandardDeviation.Z | tBodyGyroJerk-std()-Z |
|Time.Body.Accelerometer.Magnitude.Mean | tBodyAccMag-mean() |
|Time.Body.Accelerometer.Magnitude.StandardDeviation | tBodyAccMag-std() |
|Time.Gravity.Accelerometer.Magnitude.Mean | tGravityAccMag-mean() |
|Time.Gravity.Accelerometer.Magnitude.StandardDeviation | tGravityAccMag-std() |
|Time.Body.LinearAcceleration.Magnitude.Mean | tBodyAccJerkMag-mean() |
|Time.Body.LinearAcceleration.Magnitude.StandardDeviation | tBodyAccJerkMag-std() |
|Time.Body.Gyroscope.Magnitude.Mean | tBodyGyroMag-mean() |
|Time.Body.Gyroscope.Magnitude.StandardDeviation | tBodyGyroMag-std() |
|Time.Body.AngularVelocity.Magnitude.Mean | tBodyGyroJerkMag-mean() |
|Time.Body.AngularVelocity.Magnitude.StandardDeviation | tBodyGyroJerkMag-std() |
|Frequency.Body.Accelerometer.Mean.X | fBodyAcc-mean()-X |
|Frequency.Body.Accelerometer.Mean.Y | fBodyAcc-mean()-Y |
|Frequency.Body.Accelerometer.Mean.Z | fBodyAcc-mean()-Z |
|Frequency.Body.Accelerometer.StandardDeviation.X | fBodyAcc-std()-X |
|Frequency.Body.Accelerometer.StandardDeviation.Y | fBodyAcc-std()-Y |
|Frequency.Body.Accelerometer.StandardDeviation.Z | fBodyAcc-std()-Z |
|Frequency.Body.LinearAcceleration.Mean.X | fBodyAccJerk-mean()-X |
|Frequency.Body.LinearAcceleration.Mean.Y | fBodyAccJerk-mean()-Y |
|Frequency.Body.LinearAcceleration.Mean.Z | fBodyAccJerk-mean()-Z |
|Frequency.Body.LinearAcceleration.StandardDeviation.X | fBodyAccJerk-std()-X |
|Frequency.Body.LinearAcceleration.StandardDeviation.Y | fBodyAccJerk-std()-Y |
|Frequency.Body.LinearAcceleration.StandardDeviation.Z | fBodyAccJerk-std()-Z |
|Frequency.Body.Gyroscope.Mean.X | fBodyGyro-mean()-X |
|Frequency.Body.Gyroscope.Mean.Y | fBodyGyro-mean()-Y |
|Frequency.Body.Gyroscope.Mean.Z | fBodyGyro-mean()-Z |
|Frequency.Body.Gyroscope.StandardDeviation.X | fBodyGyro-std()-X |
|Frequency.Body.Gyroscope.StandardDeviation.Y | fBodyGyro-std()-Y |
|Frequency.Body.Gyroscope.StandardDeviation.Z | fBodyGyro-std()-Z |
|Frequency.Body.Accelerometer.Magnitude.Mean | fBodyAccMag-mean() |
|Frequency.Body.Accelerometer.Magnitude.StandardDeviation | fBodyAccMag-std() |
|Frequency.Body.LinearAcceleration.Magnitude.Mean | fBodyBodyAccJerkMag-mean() |
|Frequency.Body.LinearAcceleration.Magnitude.StandardDeviation | fBodyBodyAccJerkMag-std() |
|Frequency.Body.Gyroscope.Magnitude.Mean | fBodyBodyGyroMag-mean() |
|Frequency.Body.Gyroscope.Magnitude.StandardDeviation | fBodyBodyGyroMag-std() |
|Frequency.Body.AngularVelocity.Magnitude.Mean | fBodyBodyGyroJerkMag-mean() |
|Frequency.Body.AngularVelocity.Magnitude.StandardDeviation | fBodyBodyGyroJerkMag-std() |

### 2a) Work and transformations

Data was subseted to list only standard deviation and mean.
Labels of the variables were changed to more descriptive.
Activities Ids were replaced with descriptive activity names

It was exported to tidy.txt file.



## 3) Tidymeans

Tidymeans is data.table that is based on tidymeans to calculate mean value of the variable per subject/activity.

| Column | Description | Type |
|------------------------|---------------|----------------------------------------------|
|Subject |  Id of the subject | factor |
|Activity | Name of the activity | factor |
|Variable | Name of the variable in tidy dataset | character |
|Value | Mean value for combination of this variable/subject/activity | numeric |

### 3a) Work and transformations
Data from tidydata was melted with mean function

It was exportd as tidymeans.txt

### 3b) Additional note
As there is ongoing discussion on format for the last assignment the same data was exported as means_not_tidy.txt file. 
This file contains not tidy but easier to read layout of data. Also this format is preferred by some reviewers.



## 4) Version

All above were performed using following environment:

```
platform       x86_64-w64-mingw32          
arch           x86_64                      
os             mingw32                     
system         x86_64, mingw32             
status                                     
major          3                           
minor          3.1                         
year           2016                        
month          06                          
day            21                          
svn rev        70800                       
language       R                           
version.string R version 3.3.1 (2016-06-21)
nickname       Bug in Your Hair            
```

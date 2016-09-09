# datascience_tidy
Peer reviewed assignment for Week 4 of "Getting and Cleaning Data"

## Requirements

The assignment required creating script run_analysis.R that do the following

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Additional requirement was to create Code book which is located in the same repository.

## Process

Following actions are performed by the run_analysis.R (all of them are explained in the file itself).
* Create function for loading files.
* Load files.
* Bind test and train data.
* Finds which features are for standard deviation and mean.
* subsets the data only for those features.
* Changes the Activity Id to decriptive names and factor it.
* Creates the list of variable names.
* Cleans the variablenames oand make them descriptive. 
* Applies new names to tidy data set
* Reshape/melt/dcast data to obtain tidy dataset with mean values.
* Writes files.

All above are done when executing script  run_analysis.R


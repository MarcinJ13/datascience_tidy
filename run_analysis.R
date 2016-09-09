library(plyr)


#=======================================================================
# PART 1: Merges the training and the test sets to create one data set.
#=======================================================================

#variable for directories containing data
UCIdir <- "UCI HAR Dataset"

#Check if directory exists
if (!file.exists(UCIdir)) {stop("Main directory does not exists. please navigate to correct parent directory")}

#function to load files. It checks the file in the path, loads it and assigns names.
mjload <- function(rootdir =NULL, subdir =NULL, filename, colnames=NULL){
    thispath = paste(rootdir,subdir,filename, sep="/")
    if (!file.exists(thispath)) {stop(paste("File",thispath,"not found"))}
    thisdata <- read.table(thispath, stringsAsFactors=FALSE)
    if(!is.null(names)) {
        names(thisdata)<-colnames
    }
    return(thisdata)
}
  
#load files
featurestable <- mjload(UCIdir,NULL,"features.txt",c('id', 'feature'))
activitytable <- mjload(UCIdir,NULL,"activity_labels.txt",c('id', 'activity'))
testdatas <- mjload(UCIdir,"test","subject_test.txt",c('subject'))
testdatax <- mjload(UCIdir,"test","X_test.txt")
testdatay <- mjload(UCIdir,"test","y_test.txt",c('activity'))
traindatas <- mjload(UCIdir,"train","subject_train.txt",c('subject'))
traindatax <- mjload(UCIdir,"train","X_train.txt")
traindatay <- mjload(UCIdir,"train","y_train.txt",c('activity'))


#Bind all three test sets by column   and all three train sets by column
# then binds them by row
ttdataset <- rbind( 
        cbind(testdatas,testdatay,testdatax),
        cbind(traindatas,traindatay,traindatax)
)        
                    
#remove temporary sets that are no longer needed                    
rm(testdatas)
rm(testdatax)
rm(testdatay)
rm(traindatas)
rm(traindatax)
rm(traindatay)


# at this point ttdataset contains merged train and test sets.

#=======================================================================
# PART 2: Extract only the measurements on the mean and standard deviation for each measurement.
#=======================================================================


#which features have std( or mean( in feature name
smfeatures = grep("(mean|std)\\(\\)", featurestable$feature)
#alternatively "mean\\(|std\\("

#as first two columns are added, then smfeatures have to be shifted by 2
tidydata <- ttdataset[,c(1,2,smfeatures+2)]

#at this point tidydata contains only measurements of standard deviation and mean.


#=======================================================================
# PART 3: Uses descriptive activity names to name the activities in the data set
#=======================================================================

#It takes from activity table (from file "activity_labels.txt") the id of the activity and name.
#Then it converts the tidydata$activity to factor using those levels and labels.
tidydata$activity = factor(tidydata$activity, levels=activitytable$id, labels=activitytable$activity)

#additionally change the Subject to factor as well - nor required by assignment.
tidydata$subject <- as.factor(tidydata$subject)


#At this point tidydata has activities with descriptive names.

#=======================================================================
# PART 4: Appropriately label the data set with descriptive variable names.
#=======================================================================

#get names of those features 
#it is using smfeatures indices that were used in part 2.
tidyfeatures <- featurestable[smfeatures,2]
  
#Replace parts of the strings with descriptive names.
#those are based on "featuresinfo.txt"

tidyfeatures <- gsub("^t", "Time", tidyfeatures)
tidyfeatures <- gsub("^f", "Frequency", tidyfeatures)
tidyfeatures <- gsub("Mag", ".Magnitude", tidyfeatures)
tidyfeatures <- gsub("Acc", ".Accelerometer", tidyfeatures)
tidyfeatures <- gsub("Gyro", ".Gyroscope", tidyfeatures)
tidyfeatures <- gsub(".AccelerometerJerk",".LinearAcceleration", tidyfeatures)
tidyfeatures <- gsub(".GyroscopeJerk",".AngularVelocity", tidyfeatures)
tidyfeatures <- gsub("Body", ".Body", tidyfeatures)
tidyfeatures <- gsub("Gravity", ".Gravity", tidyfeatures)
tidyfeatures <- gsub("\\-mean\\(\\)", ".Mean", tidyfeatures)
tidyfeatures <- gsub("\\-std\\(\\)", ".StandardDeviation", tidyfeatures)
tidyfeatures <- gsub(".Body.Body", ".Body", tidyfeatures)
tidyfeatures <- gsub("\\-", ".", tidyfeatures)


#optionally the dots can be removed (tidyfeatures2) and all labels lowercased (tidyfeatures3)
tidyfeatures2 <- gsub("[^[:alpha:]]", "", tidyfeatures)
tidyfeatures3 <- tolower(tidyfeatures2)

#As removing dots and lowercasing was not required by assignment I have left them as it improves readibility

names(tidydata) <- c("Subject", "Activity", tidyfeatures)

#At this point tidydata has descriptive variable names.

#=======================================================================
# PART 5: From the data set in step 4, creates a second, independent tidy data set 
#         with the average of each variable for each activity and each subject.
#=======================================================================


library(reshape2)

tidymeans = dcast(melt(tidydata, id = c("Subject", "Activity")), Subject + Activity ~ variable, mean)
tidymeans2 = melt(tidymeans,id = c("Subject", "Activity"))

#      =====================
#      IMPORTANT NOTE !!!
#      =====================
#
#      There was discussion pinned in discussion forum on Coursera regarding 
#      "Clarification on definition of a variable for Step 5 of the assignment"
#      Lot of people have different opinions how to understand requirements.
#
#      So one of the option is to list subject, activity and then mean values in columns named as variables.
#      For example
#         Subject  Activity   Time.Body.Accelerometer.Mean.X  Time.Body.LinearAcceleration.Mean.Y ...
#         1        WALKING    0.2773308                       1.489559e-02
#
#      The second option is to list each of those variables separately :
#
#         Subject  Activity   Variable                               Mean
#         1        WALKING      Time.Body.Accelerometer.Mean.X       0.2773308
#         1        WALKING      Time.Body.LinearAcceleration.Mean.Y  1.489559e-02
#         ...
#
#      I have chosen the second option as it is more in line with tidy data principles. 
#      However I still store the first option and it will be exported to file "means_not_tidy.txt".



#At this point tidymeans2 has average of each vairable for each activity and subject.

#=======================================================================
# PART 6: NOT PART OF ASSIGNMENT - write results to files
#=======================================================================

write.csv(tidydata, file = "tidy.txt",row.names = FALSE)
write.csv(tidymeans, file = "means_not_tidy.txt",row.names = FALSE)
write.csv(tidymeans2, file = "tidymeans.txt",row.names = FALSE)




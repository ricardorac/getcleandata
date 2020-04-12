---
title: "CodeBook"
author: "Ricardo Costa"
date: "11/04/2020"
output: html_document
---

## Data Set Information

This dataset was extracted from an experiment entitled "Human Activity Recognition Using Smartphones Data Set", which is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The experiments have been carried out with a group of 30 volunteers, called 'subjects'. Each subject performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone. Using its embedded accelerometer and gyroscope, it were captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

## Attribute Information:

After running the run_analysis.R using as input the original dataset, the resulting dataset (written in a file called `tidydataset.txt`) is grouped by subject and ACTIVITY and presents the mean of every other measured variable, as follows.

For each record in the dataset it is provided:

* An identifier of the subject who carried out the experiment.

* Its activity label.

* Mean, for the given subject and activity, of the variables listed above

    + tBodyAcc-mean()-X         

    + tBodyAcc-mean()-Z         

    + tBodyAcc-std()-Y          

    + tGravityAcc-mean()-X      

    + tGravityAcc-mean()-Z      

    + tGravityAcc-std()-Y       

    + tBodyAccJerk-mean()-X     

    + tBodyAccJerk-mean()-Z     

    + tBodyAccJerk-std()-Y      

    + tBodyGyro-mean()-X        

    + tBodyGyro-mean()-Z        

    + tBodyGyro-std()-Y         

    + tBodyGyroJerk-mean()-X    

    + tBodyGyroJerk-mean()-Z    

    + tBodyGyroJerk-std()-Y     

    + tBodyAccMag-mean()        

    + tGravityAccMag-mean()     

    + tBodyAccJerkMag-mean()    

    + tBodyGyroMag-mean()       

    + tBodyGyroJerkMag-mean()   

    + fBodyAcc-mean()-X         

    + fBodyAcc-mean()-Z         

    + fBodyAcc-std()-Y          

    + fBodyAccJerk-mean()-X     

    + fBodyAccJerk-mean()-Z     

    + fBodyAccJerk-std()-Y      

    + fBodyGyro-mean()-X        

    + fBodyGyro-mean()-Z        

    + fBodyGyro-std()-Y         

    + fBodyAccMag-mean()        

    + fBodyBodyAccJerkMag-mean()

    + fBodyBodyGyroMag-mean()   

    + fBodyBodyGyroJerkMag-mean()

    + tBodyAcc-mean()-Y          

    + tBodyAcc-std()-X           

    + tBodyAcc-std()-Z           

    + tGravityAcc-mean()-Y       

    + tGravityAcc-std()-X        

    + tGravityAcc-std()-Z        

    + tBodyAccJerk-mean()-Y      

    + tBodyAccJerk-std()-X       

    + tBodyAccJerk-std()-Z       

    + tBodyGyro-mean()-Y         

    + tBodyGyro-std()-X          

    + tBodyGyro-std()-Z          

    + tBodyGyroJerk-mean()-Y     

    + tBodyGyroJerk-std()-X      

    + tBodyGyroJerk-std()-Z      

    + tBodyAccMag-std()          

    + tGravityAccMag-std()       

    + tBodyAccJerkMag-std()      

    + tBodyGyroMag-std()         

    + tBodyGyroJerkMag-std()     

    + fBodyAcc-mean()-Y          

    + fBodyAcc-std()-X           

    + fBodyAcc-std()-Z           

    + fBodyAccJerk-mean()-Y      

    + fBodyAccJerk-std()-X       

    + fBodyAccJerk-std()-Z       

    + fBodyGyro-mean()-Y         

    + fBodyGyro-std()-X          

    + fBodyGyro-std()-Z          

    + fBodyAccMag-std()          

    + fBodyBodyAccJerkMag-std()  

    + fBodyBodyGyroMag-std()     

    + fBodyBodyGyroJerkMag-std() 
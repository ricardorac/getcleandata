# Peer-graded Assignment: Getting and Cleaning Data Course

In this README it is presented a brief explanation of each file in the repository. After that it describes the steps taken by run_analysis.R with some assumptions and explanations about operations. In this excercise I opted to use only the data.table package, as sometimes the dplyr package has some problemas selecting and merging data on data tables.

This project main goal is to get the dataset from [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and prepare it for analysis using an interactive R environment.

This repository contains:

* **README.md**: This file explaining the contents of the repository and the run_analysis explanation

* **CodeBook.md**: A file containing the description of the variables of the final dataset

* **run_analysis.R**: The R script which prepares the data set for analysis. This process is detailed on the next section.

## run_analysis description
On the following sections I explain the steps of the run_analysis.R.

### Reading test data
The first step is reading the following files contained in the "./UCI HAR Dataset/test/" directory:

```
testdata <- fread("./UCI HAR Dataset/test/X_test.txt")
testactivity <- fread("./UCI HAR Dataset/test/y_test.txt")
testsubject <- fread("./UCI HAR Dataset/test/subject_test.txt")
```

### Reading training data
Next it does the same for the files contained int directory "./UCI HAR Dataset/train/":

```
traindata <- fread("./UCI HAR Dataset/train/X_train.txt")
trainactivity <- fread("./UCI HAR Dataset/train/y_train.txt")
trainsubject <- fread("./UCI HAR Dataset/train/subject_train.txt")
```

### Reading and applying metadata
Next the script read two files containing metadata regarding the train and test data loaded on previous steps.
```
features <- fread("./UCI HAR Dataset/features.txt")
activity <- fread("./UCI HAR Dataset/activity_labels.txt")
```
Next it adds the column names to the original datasets.

```
names(testdata) <- features$V2
names(traindata) <- features$V2
```

Next the script adds a column indicating the subject for each observation.

```
testdata$subject <- testsubject$V1
traindata$subject <- trainsubject$V1
```

And finally it merges the activity labels with the activities recorded for train and test datasets and adds a column indicating the activity for each observation.
```
testactivity$V2 <- as.character(lapply(testactivity$V1, function(x) as.character(activity$V2[[x]])))
trainactivity$V2 <- as.character(lapply(trainactivity$V1, function(x) as.character(activity$V2[[x]])))
testdata$activity <- testactivity$V2
traindata$activity <- trainactivity$V2
```

### Merging the two separate datasets

As I opted to use two different data tables variabels, one with train data and the other with test data, I had to merge the two data tables at the end of the process.
```
tidydataset <- rbind(testdata,traindata)
```

This end steps 1, 3 and 4 of the exercise, as the tidydataset has a column for activity and for subject and also names for each variable.

### Removing subject and activity to keep mean and standard deviation measurements

To keep only the mean and standard deviation measurements I opted to remove the added columns (subject and activity) and save it in a new data table. After that I removed all measurements that had no mean or std in its name, readded the columns subject and activity and reassigned the datable to tidydataset

```
alldata <- tidydataset[,-c("subject","activity")]

allnames <- names(alldata)
keepnames <- allnames[grepl(allnames,pattern = ".*(mean|std).*")]

meanstddata <- alldata[,..keepnames]

meanstddata$subject <- tidydataset$subject
meanstddata$activity <- tidydataset$activity

tidydataset <- meanstddata
```

### Creating the tidy data set

To end the exercise, I used lapply to calculate the mean of every column, but only after grouping the data by subject and activity. And to improve visualization, I sorted the final data set by subject and activity, both ascending. The final result is written to a file called "tidydataset.txt" on the workspace.

```
meandataset <- tidydataset[, lapply(.SD,mean), by=list(subject,activity)]
meandataset <- meandataset[order(subject,activity)]
write.table(meandataset, file = "tidydataset.txt", row.name=FALSE)
```
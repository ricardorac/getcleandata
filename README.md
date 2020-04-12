# Peer-graded Assignment: Getting and Cleaning Data Course

In this README it is presented a brief explanation of each file in the repository. After that it describes the steps taken by run_analysis.R with some assumptions and explanations about operations. In this excercise I opted to use only the data.table package, as sometimes the dplyr package has some problemas selecting and merging data on data tables.

## run_analysis description
On the following sections I explain the steps of the run_analysis.R.

### Reading test data
The first step is reading the following files contained in the "./UCI HAR Dataset/test/" directory:

```{r}
testdata <- fread("./UCI HAR Dataset/test/X_test.txt")
testactivity <- fread("./UCI HAR Dataset/test/y_test.txt")
testsubject <- fread("./UCI HAR Dataset/test/subject_test.txt")
```

### Reading training data
Next it does the same for the files contained int directory "./UCI HAR Dataset/train/":

```{r}
traindata <- fread("./UCI HAR Dataset/train/X_train.txt")
trainactivity <- fread("./UCI HAR Dataset/train/y_train.txt")
trainsubject <- fread("./UCI HAR Dataset/train/subject_train.txt")
```

### Reading and applying metadata
Next the script read two files containing metadata regarding the train and test data loaded on previous steps.
```{r}
features <- fread("./UCI HAR Dataset/features.txt")
activity <- fread("./UCI HAR Dataset/activity_labels.txt")
```
Next it adds the column names to the original datasets.

```{r}
names(testdata) <- features$V2
names(traindata) <- features$V2
```

Next the script adds a column indicating the subject for each observation.

```{r}
testdata$subject <- testsubject$V1
traindata$subject <- trainsubject$V1
```

And finally it merges the activity labels with the activities recorded for train and test datasets and adds a column indicating the activity for each observation.
```{r}
testactivity <- merge(testactivity,activity)
trainactivity <- merge(trainactivity,activity)
testdata$activity <- testactivity$V2
traindata$activity <- trainactivity$V2
```

### Merging the two separate datasets

As I opted to use two different data tables variabels, one with train data and the other with test data, I had to merge the two data tables at the end of the process.
```{r}
tidydataset <- rbind(testdata,traindata)
```

This end steps 1, 3 and 4 of the exercise, as the tidydataset has a column for activity and for subject and also names for each variable.

### Removing subject and activity to calculate mean and standard deviation

To calculate the mean and standard deviation of each observation I had to remove the added columns (subject and activity) and save it in a new data table.
```{r}
rawmdata <- mergeddata[,-c("subject","activity")]
```

### Calculating mean and standard deviation for each variable
After stripping these two columns, I calculated mean and sd for each other column and merged the resulting vectors into a matrix, with all column names maintained and two rows, one for each measure.

```{r}
mean <- sapply(rawmdata,mean)
stddeviation <- sapply(rawmdata,sd)
sumdata <- rbind(mean = mean, sd = stddeviation)
```

### Creating the tidy data set

To end the exercise, I used lapply to calculate the mean of every column, but only after grouping the data by subject and activity. And to improve visualization, I sorted the final data set by subject and activity, both ascending. The final result is written to a file called "tidydataset.txt" on the workspace.

```{r}
meandataset <- tidydataset[, lapply(.SD,mean), by=list(subject,activity)]
meandataset <- meandataset[order(subject,activity)]
write.table(meandataset, file = "tidydataset.txt", row.name=FALSE)
```
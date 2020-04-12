library(data.table)

## Reading test data
testdata <- fread("./UCI HAR Dataset/test/X_test.txt")
testactivity <- fread("./UCI HAR Dataset/test/y_test.txt")
testsubject <- fread("./UCI HAR Dataset/test/subject_test.txt")

## Reading training data
traindata <- fread("./UCI HAR Dataset/train/X_train.txt")
trainactivity <- fread("./UCI HAR Dataset/train/y_train.txt")
trainsubject <- fread("./UCI HAR Dataset/train/subject_train.txt")

## Reading description of columns (features)
features <- fread("./UCI HAR Dataset/features.txt")

## Reading activity labels
activity <- fread("./UCI HAR Dataset/activity_labels.txt")

## Defining the names of columns based on the features of the dataset
names(testdata) <- features$V2
names(traindata) <- features$V2

## Adding a column indicating the subject for each observation
testdata$subject <- testsubject$V1
traindata$subject <- trainsubject$V1

## Adding labels to test and train activities
testactivity$V2 <- as.character(lapply(testactivity$V1, function(x) as.character(activity$V2[[x]])))
trainactivity$V2 <- as.character(lapply(trainactivity$V1, function(x) as.character(activity$V2[[x]])))

## Adding a column indicating the activity for each observation
testdata$activity <- testactivity$V2
traindata$activity <- trainactivity$V2

## Merging the two separate datasets
tidydataset <- rbind(testdata,traindata)

##
## This end steps 1, 3 and 4 (tidydataset has a column for activity and for
##                            subject and also names for each variable)
##

## Removing subject and activity to calculate mean, standard deviation and average
alldata <- tidydataset[,-c("subject","activity")]

allnames <- names(alldata)
keepnames <- allnames[grepl(allnames,pattern = ".*(mean\\(|std\\().*")]

meanstddata <- alldata[,..keepnames]

meanstddata$subject <- tidydataset$subject
meanstddata$activity <- tidydataset$activity


tidydataset <- meanstddata

##
## This ends step 2 (tidydataset has only rows with mean and rd measurements.
##                   The rowns are named and the variables also have names)
##

meandataset <- tidydataset[, lapply(.SD,mean), keyby=.(subject,activity)]
write.table(meandataset, file = "tidydataset.txt", row.name=FALSE)

##
## This ends step 5 and save the meandataset to the file.
##


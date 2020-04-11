library(data.table)
library(plyr)
library(dplyr)

testdata <- fread("./UCI HAR Dataset/test/X_test.txt")
testlabel <- fread("./UCI HAR Dataset/test/y_test.txt")
testsubject <- fread("./UCI HAR Dataset/test/subject_test.txt")

traindata <- fread("./UCI HAR Dataset/train/X_train.txt")
trainlabel <- fread("./UCI HAR Dataset/train/y_train.txt")
trainsubject <- fread("./UCI HAR Dataset/train/subject_train.txt")

features <- fread("./UCI HAR Dataset/features.txt")

names(testdata) <- features$V2
names(traindata) <- features$V2

testdata$subject <- testsubject$V1
testdata$window <- testlabel$V1

traindata$subject <- trainsubject$V1
traindata$window <- trainlabel$V1

mergeddata <- rbind(testdata,traindata)

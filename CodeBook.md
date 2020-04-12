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

* Mean for the given subject and activity of the triaxial acceleration from the accelerometer (total acceleration)

* Mean for the given subject and activity of the estimated body acceleration.

* Mean for the given subject and activity of the triaxial Angular velocity from the gyroscope.

* Mean for the given subject and activity of a 561-feature vector with time and frequency domain variables.


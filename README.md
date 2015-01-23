# Course Project 'Getting and Cleaning Data' 

These are my solutions to the course project of the Coursera 'Getting and Cleaning Data' lecture.

## Introduction

This project uses data collected from the accelerometers from the Samsung Galaxy S smartphone. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. The time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

A full description is available at the site where the data was obtained: 

<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">.

Here are the data for the project: 

<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">.

## The download script

If the source data has not been download to the current working directory, 
the `download_data.R` script can be used to download and extract the source file. The script downloads and unzips the data in the current working directory. 

## The clean-up and analysis script

The script `run_analysis.R` performs the cleanup and aggregation of the souce data.
The following steps are performed.

1. Merge the training and the test data sets</li>
2. Extract only the mean and standard deviation for each measurement</li>
3. Average of each variable for each activity and each subject</li>
4. Improve naming of variables and labels</li>

## The code book

The output of the script is the new data file `uci_har_tidy.txt`. The output contains 180 values of 66 parameters. The first two rows are the subject id and the performed activity.

The variable suffixes `X`, `Y` and `Z` are used to denote the signals in the x-, y- and z-directions. The variable prefix `t` denotes variables in the time space, where as the prefix `f` denotes variables in the frequency space after a FFT. Accelerations are measured in standard gravity units of `g` (about 9.81 meters/second^2). Angular velocities are measured in radians/second. However all variables have been normalized and bounded within [-1,1], so do not have units anymore.

* `subject`: subject id from 1 to 30
* `activity`: name of the activity (walking, walkingup, walkingdown, sitting, standing, laying)

* **BodyAcc**: acceleration of body (12 variables)
..* `tBodyAcc.[mean|std].[X|Y|Z]`
..* `fBodyAcc.[mean|std].[X|Y|Z]`

..* scalar acceleration of body (4 variables)
....* `tBodyAcc.[mean|std]`
....* `fBodyAcc.[mean|std]`

* **BodyJerk**: jerk of body (12 variables)
..* `tBodyJerk.[mean|std].[X|Y|Z]`
..* `fBodyJerk.[mean|std].[X|Y|Z]`

..* scalar jerk of body (4 variables)
....* `tBodyJerk.[mean|std]`
....* `fBodyJerk.[mean|std]`

* **GravityAcc**: gravitational acceleration (6 Variables)
..* `tGravityAcc.[mean|std].[X|Y|Z]`

..* scalar gravitational acceleration (2 Variables)
....* `tGravityAcc.[mean|std]`

* **BodyGyro**: rotation velocity of body (12 variables)
..* `tBodyGyro.[mean|std].[X|Y|Z]`
..* `fBodyGyro.[mean|std].[X|Y|Z]`

..* BodyGyro: scalar rotation velocity of body (4 variables)
....* `tBodyGyro.[mean|std]`
....* `fBodyGyro.[mean|std]`

* **BodyGyroJerk**: angular acceleration (jerk?) of body (6 variables)
..* `tBodyGyroJerk.[mean|std].[X|Y|Z]`

..* BodyGyroJerk: scalar angular acceleration (jerk?) of body (4 variables)
....* `tBodyGyroJerk.[mean|std]`
....* `fBodyGyroJerk.[mean|std]`

The following statistical numbers are given for each measured time interval.

* `mean()`: mean value
* `std()`: standard deviation
# Course Project 'Getting and Cleaning Data' 

These are my solutions to the Course Project of the Coursera 'Getting and Cleaning Data' lecture.

## Introduction

This project uses data collected from the accelerometers from the Samsung Galaxy S smartphone. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. The time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

A full description is available at the site where the data was obtained: 

<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"/>.

Here are the data for the project: 

<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"/>.

## The download script

If the source data are not available in the current working directory, 
the `download_data.R` script can be used download and extract the source file. The script downloads and unzips the data in the current working directory. 

## The clean-up and analysis script

The script`run_analysis.R` performs the cleanup and aggregation of the souce data.
The following steps are performed.

<ol>
<li>Merge the training and the test data sets</li>
<li>Extract only the mean and standard deviation for each measurement</li>
<li>Average of each variable for each activity and each subject</li>
<li>Improve naming of variables and labels</li>
</ol>

## The code book

The output of the script is the new data file `uci_har_tidy.txt`. It contains 10299 measurements of 79 variables. The first two rows are the subject id and the performed activity.

The variable suffixes `X`, `Y` and `Z` are used to denote the signals in the x-, y- and z-directions. The variable prefix `t` denotes variables in the time space, where as the prefix `f` denotes variables in the frequency space after a FFT. Accelerations are measured in standard gravity units of `g` (about 9.81 meters/second^2). Angular velocities are measured in radians/second. However all variables have been normalized and bounded within [-1,1], so do not have units anymore.

* `subject`: subject id from 1 to 30
* `activity`: name of the activity (walking, walkingup, walkingdown, sitting, standing, laying)

* BodyAcc: acceleration of body (15 variables)
** `tBodyAcc.[mean|std].[X|Y|Z]`
** `fBodyAcc.[mean|std|meanFreq].[X|Y|Z]`

** scalar acceleration of body (5 variables)
*** `tBodyAcc.[mean|std]`
*** `fBodyAcc.[mean|std|meanFreq]`

* BodyJerk: jerk of body (15 variables)
** `tBodyJerk.[mean|std].[X|Y|Z]`
** `fBodyJerk.[mean|std|meanFreq].[X|Y|Z]`

** scalar jerk of body (5 variables)
*** `tBodyJerk.[mean|std]`
*** `fBodyJerk.[mean|std|meanFreq]`

* GravityAcc: gravitational acceleration (6 Variables)
** `tGravityAcc.[mean|std].[X|Y|Z]`

** scalar gravitational acceleration (2 Variables)
*** `tGravityAcc.[mean|std]`

* BodyGyro: rotation velocity of body (15 variables)
** `tBodyGyro.[mean|std].[X|Y|Z]`
** `fBodyGyro.[mean|std|meanFreq].[X|Y|Z]`

** BodyGyro: scalar rotation velocity of body (5 variables)
*** `tBodyGyro.[mean|std]`
*** `fBodyGyro.[mean|std|meanFreq]`

* BodyGyroJerk: angular acceleration (jerk?) of body (3 variables)
** `tBodyGyroJerk.[mean|std].[X|Y|Z]`

** BodyGyroJerk: scalar angular acceleration (jerk?) of body (5 variables)
*** `tBodyGyroJerk.[mean|std]`
*** `fBodyGyroJerk.[mean|std|meanFreq]`

The following statistical numbers are given for the measured time intervals:

* `mean()`: mean value
* `std()`: standard deviation
* `meanFreq()`: weighted average of the frequency components to obtain a mean frequency
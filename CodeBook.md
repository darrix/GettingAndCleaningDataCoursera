# CodeBook #

# run_analysis.R #

This script executes the commands required to create the two files described below.  assumes that the Samsung data has been retrieved from [this location,](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into the R working directory.  Additionally, it assumes that the directory name "UCI HAR Dataset" has been renamed to "Samsung."

# TidyData1

## Process ##

The initial tidy dataset was created by importing in the x_test, y_test, and subject_test files, which contained the feature data measures, the activities, and the subjects for the test data.  These files were then merged by adding the subjects and activities to the feature measures.

The same work was performed for the trial data, using the same respective files.

Once, both datasets were created, they were then merged together.  At that point, titles were added to the dataset for all of the features.  These titles were obtained from the features.txt file.  Additionally, the titles "subject" and "activity" were added for the subject and activity data columns.

The activity column was translated from its numeric structure to its text representation.

The feature columns were filtered so as to only capture values which were either "mean" or "std" (standard deviation) measures.

The data was sorted by subject and activity.

These steps resulted in the tidyData1 set, exported as tidyData1.txt and found in this repository.

## Description ##

* subject:  numeric value ranging from 1 to 30, specifying the subject creating the data
* activity:  text column comprised of six values:  WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING
* the remaining feature measures are:  tBodyAcc-mean()-X	tBodyAcc-mean()-Y	tBodyAcc-mean()-Z	tBodyAcc-std()-X	tBodyAcc-std()-Y	tBodyAcc-std()-Z	tGravityAcc-mean()-X	tGravityAcc-mean()-Y	tGravityAcc-mean()-Z	tGravityAcc-std()-X	tGravityAcc-std()-Y	tGravityAcc-std()-Z	tBodyAccJerk-mean()-X	tBodyAccJerk-mean()-Y	tBodyAccJerk-mean()-Z	tBodyAccJerk-std()-X	tBodyAccJerk-std()-Y	tBodyAccJerk-std()-Z	tBodyGyro-mean()-X	tBodyGyro-mean()-Y	tBodyGyro-mean()-Z	tBodyGyro-std()-X	tBodyGyro-std()-Y	tBodyGyro-std()-Z	tBodyGyroJerk-mean()-X	tBodyGyroJerk-mean()-Y	tBodyGyroJerk-mean()-Z	tBodyGyroJerk-std()-X	tBodyGyroJerk-std()-Y	tBodyGyroJerk-std()-Z	tBodyAccMag-mean()	tBodyAccMag-std()	tGravityAccMag-mean()	tGravityAccMag-std()	tBodyAccJerkMag-mean()	tBodyAccJerkMag-std()	tBodyGyroMag-mean()	tBodyGyroMag-std()	tBodyGyroJerkMag-mean()	tBodyGyroJerkMag-std()	fBodyAcc-mean()-X	fBodyAcc-mean()-Y	fBodyAcc-mean()-Z	fBodyAcc-std()-X	fBodyAcc-std()-Y	fBodyAcc-std()-Z	fBodyAcc-meanFreq()-X	fBodyAcc-meanFreq()-Y	fBodyAcc-meanFreq()-Z	fBodyAccJerk-mean()-X	fBodyAccJerk-mean()-Y	fBodyAccJerk-mean()-Z	fBodyAccJerk-std()-X	fBodyAccJerk-std()-Y	fBodyAccJerk-std()-Z	fBodyAccJerk-meanFreq()-X	fBodyAccJerk-meanFreq()-Y	fBodyAccJerk-meanFreq()-Z	fBodyGyro-mean()-X	fBodyGyro-mean()-Y	fBodyGyro-mean()-Z	fBodyGyro-std()-X	fBodyGyro-std()-Y	fBodyGyro-std()-Z	fBodyGyro-meanFreq()-X	fBodyGyro-meanFreq()-Y	fBodyGyro-meanFreq()-Z	fBodyAccMag-mean()	fBodyAccMag-std()	fBodyAccMag-meanFreq()	fBodyBodyAccJerkMag-mean()	fBodyBodyAccJerkMag-std()	fBodyBodyAccJerkMag-meanFreq()	fBodyBodyGyroMag-mean()	fBodyBodyGyroMag-std()	fBodyBodyGyroMag-meanFreq()	fBodyBodyGyroJerkMag-mean()	fBodyBodyGyroJerkMag-std()	fBodyBodyGyroJerkMag-meanFreq()
	* These are the mean and standard deviation measures from the raw data, described as 
		* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
		- Triaxial Angular velocity from the gyroscope. 


 
# TidyData2

The second tidy sample (i.e., the one requested in item 5 of the instructions).  Is derived from the first.  It was calculated using the aggregate method, applying the mean function to the feature values for a given subject, activity set.  After calcuation, it was necessary to rename the columns as the method changes the names to indicate where it has grouped data.  

As a result, the subject and activity columns were renamed "subject" and "activity".  The feature columns were renamed as well, prepending "meanOf." to each of the names found in the TidyData1 notes above so as to better reflect that they are now the mean values of the subject/activity set in TidyData1.

These steps resulted in the tidyData2 set, exported as tidyData2.txt, submitted in Coursera, and also found in this repository. 


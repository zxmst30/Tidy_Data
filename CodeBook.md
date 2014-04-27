## Code Book

The tidy data file AVGData.txt contains a total of 68 variables. The first two variables are:
* Subject (1-30) and
* Activity (WALKING, WALKING_UP, WALKING_DOWN, SITTING, STANDING, LYING)

The remaining 66 columns are the mean value (denoted as -mean()) and standard deviation (-std()) 
of 33 accelerometer and gyroscope variables, averaged for each subject and activity:

* tBodyAcc-X
* tBodyAcc-Y
* tBodyAcc-Z
* tGravityAcc-X
* tGravityAcc-Y
* tGravityAcc-Z
* tBodyAccJerk-X
* tBodyAccJerk-Y
* tBodyAccJerk-Z
* tBodyGyro-X
* tBodyGyro-Y
* tBodyGyro-Z
* tBodyGyroJerk-X
* tBodyGyroJerk-Y
* tBodyGyroJerk-Z
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-X
* fBodyAcc-Y
* fBodyAcc-Z
* fBodyAccJerk-X
* fBodyAccJerk-Y
* fBodyAccJerk-Z
* fBodyGyro-X
* fBodyGyro-Y
* fBodyGyro-Z
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

Time domain signals are denoted with the prefix 't'. The acceleration signal was
separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). 
Subsequently, the body linear acceleration and angular velocity were derived in time 
to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude 
of these three-dimensional signals were calculated using the Euclidean norm 
(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, 
fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

More details about the data set and transformations as well as other steps 
performed to generate the clean data set can be found in the README.md file. 

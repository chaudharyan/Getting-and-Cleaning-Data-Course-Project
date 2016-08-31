# Getting and Cleaning Data Project CodeBook
------------------------------------------------------------------------------

This project creates run_analysis.R that does the following.

 * Merges the training and the test sets to create one data set.
 * Extracts only the measurements on the mean and standard deviation for each measurement.
 * Uses descriptive activity names to name the activities in the data set
 * Appropriately labels the data set with descriptive variable names.
 * From step 4 , creates a second, independent tidy data set with the average of each variable for each activity and each subject.

------------------------------------------------------------------------------------------------------------------------------------------------------

See README.txt for analysis of run_analyis.R

------------------------------------------------------------------------------------------------------------------------------------------------------

### Variables in run_analysis.R:

	**Activity**
	**Subject**
	**Measurement Variables**  (79 columns)

		
-----------------------------------------------------------------------------------------------------------------------------------------------------------

### Activity Variable

Activity Variable contains the descriptive activity name instead of activity number that was present in the raw data files.<br>
The descriptive activity names are as follows:


		Activity Description	Corresponding Activity Number
	1.	WALKING				   1
	2. 	WALKING_UPSTAIRS		2
	3. 	WALKING_DOWNSTAIRS		3
	4. 	SITTING				   4
	5. 	STANDING			   5
	6. 	LAYING				   6

		
-----------------------------------------------------------------------------------------------------------------------------------------------------------
### Subject Variable

The experiments have been carried out with a group of 30 volunteers also called subject within an age bracket of 19-48 years.<br>
Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
	
----------------------------------------------------------------------------------------------------------------------------------------------------------------
### Measurement Variable and Description

	
**'f'** indicate frequency domain signals<br> 
**'t'** denote time <br>
**XYZ** denotes 3-axial signals in the **X**, **Y** and **Z** directions.

		tBodyAcc-XYZ
		tGravityAcc-XYZ
		tBodyAccJerk-XYZ
		tBodyGyro-XYZ
		tBodyGyroJerk-XYZ
		tBodyAccMag
		tGravityAccMag
		tBodyAccJerkMag
		tBodyGyroMag
		tBodyGyroJerkMag
		fBodyAcc-XYZ
		fBodyAccJerk-XYZ
		fBodyGyro-XYZ
		fBodyAccMag
		fBodyAccJerkMag
		fBodyGyroMag
		fBodyGyroJerkMag


**(tAcc-XYZ and tGyro-XYZ)** : These columns come from the accelerometer and gyroscope 3-axial raw signals. <br> 
**(tBodyAcc-XYZ and tGravityAcc-XYZ)**: The acceleration signal was then separated into body and gravity acceleration signals <br> 
**(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ)** : The body linear acceleration and angular velocity were derived in time to obtain Jerk signals<br> 
**(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)** : Three-dimensional signals were calculated using the Euclidean norm	<br> 
**(fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag)** : a Fast Fourier Transform (FFT) was applied to some of these signals<br> 
	


The set of variables that were estimated from these signals in our file are: 

		Mean(): Mean value
		standardDeviation(): Standard deviation


------------------------------------------------------------------------------------------------------------------------------------------------------
str(final)


	'data.frame':	180 obs. of  81 variables:
 	$ Activity                                                               : Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4 ...
 	$ Subject                                                                : int  1 1 1 1 1 1 2 2 2 2 ...
 	$ TimeBodyAccelerationeleration-Mean-X                                   : num  0.222 0.261 0.279 0.277 0.289 ...
 	$ TimeBodyAccelerationeleration-Mean-Y                                   : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
 	$ TimeBodyAccelerationeleration-Mean-Z                                   : num  -0.113 -0.105 -0.111 -0.111 -0.108 ...
 	$ TimeBodyAccelerationeleration-StandardDeviation-X                      : num  -0.928 -0.977 -0.996 -0.284 0.03 ...
 	$ TimeBodyAccelerationeleration-StandardDeviation-Y                      : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
 	$ TimeBodyAccelerationeleration-StandardDeviation-Z                      : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...
 	$ TimeGravityAccelerationeleration-Mean-X                                : num  -0.249 0.832 0.943 0.935 0.932 ...
 	$ TimeGravityAccelerationeleration-Mean-Y                                : num  0.706 0.204 -0.273 -0.282 -0.267 ...
 	$ TimeGravityAccelerationeleration-Mean-Z                                : num  0.4458 0.332 0.0135 -0.0681 -0.0621 ...
 	$ TimeGravityAccelerationeleration-StandardDeviation-X                   : num  -0.897 -0.968 -0.994 -0.977 -0.951 ...
 	$ TimeGravityAccelerationeleration-StandardDeviation-Y                   : num  -0.908 -0.936 -0.981 -0.971 -0.937 ...
 	$ TimeGravityAccelerationeleration-StandardDeviation-Z                   : num  -0.852 -0.949 -0.976 -0.948 -0.896 ...
 	$ TimeBodyAccelerationelerationJerk-Mean-X                               : num  0.0811 0.0775 0.0754 0.074 0.0542 ...
 	$ TimeBodyAccelerationelerationJerk-Mean-Y                               : num  0.003838 -0.000619 0.007976 0.028272 0.02965 ...
 	$ TimeBodyAccelerationelerationJerk-Mean-Z                               : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...


------------------------------------------------------------------------------------------------------------------------------------------------------
summary (final)


	> summary(final)
               Activity     Subject     TimeBodyAccelerationeleration-Mean-X TimeBodyAccelerationeleration-Mean-Y TimeBodyAccelerationeleration-Mean-Z
	 LAYING            :30   Min.   : 1.0   Min.   :0.2216                       Min.   :-0.040514                    Min.   :-0.15251                    
 	SITTING           :30   1st Qu.: 8.0   1st Qu.:0.2712                       1st Qu.:-0.020022                    1st Qu.:-0.11207                    
 	STANDING          :30   Median :15.5   Median :0.2770                       Median :-0.017262                    Median :-0.10819                    
 	WALKING           :30   Mean   :15.5   Mean   :0.2743                       Mean   :-0.017876                    Mean   :-0.10916                    
 	WALKING_DOWNSTAIRS:30   3rd Qu.:23.0   3rd Qu.:0.2800                       3rd Qu.:-0.014936                    3rd Qu.:-0.10443                    
 	WALKING_UPSTAIRS  :30   Max.   :30.0   Max.   :0.3015                       Max.   :-0.001308                    Max.   :-0.07538                    
 	TimeBodyAccelerationeleration-StandardDeviation-X TimeBodyAccelerationeleration-StandardDeviation-Y TimeBodyAccelerationeleration-StandardDeviation-Z
 	Min.   :-0.9961                                   Min.   :-0.99024                                  Min.   :-0.9877                                  
 	1st Qu.:-0.9799                                   1st Qu.:-0.94205                                  1st Qu.:-0.9498                                  
 	Median :-0.7526                                   Median :-0.50897                                  Median :-0.6518                                  
 	Mean   :-0.5577                                   Mean   :-0.46046                                  Mean   :-0.5756                                  
 	3rd Qu.:-0.1984                                   3rd Qu.:-0.03077                                  3rd Qu.:-0.2306                                  
 	Max.   : 0.6269                                   Max.   : 0.61694                                  Max.   : 0.6090                                  
 	TimeGravityAccelerationeleration-Mean-X TimeGravityAccelerationeleration-Mean-Y TimeGravityAccelerationeleration-Mean-Z TimeGravityAccelerationeleration-StandardDeviation-X
 	Min.   :-0.6800                         Min.   :-0.47989                        Min.   :-0.49509                        Min.   :-0.9968                                     
 	1st Qu.: 0.8376                         1st Qu.:-0.23319                        1st Qu.:-0.11726                        1st Qu.:-0.9825                                     
 	Median : 0.9208                         Median :-0.12782                        Median : 0.02384                        Median :-0.9695                                     
 	Mean   : 0.6975                         Mean   :-0.01621                        Mean   : 0.07413                        Mean   :-0.9638                                     
 	3rd Qu.: 0.9425                         3rd Qu.: 0.08773                        3rd Qu.: 0.14946                        3rd Qu.:-0.9509                                     
 	Max.   : 0.9745                         Max.   : 0.95659                        Max.   : 0.95787                        Max.   :-0.8296                                     
 	TimeGravityAccelerationeleration-StandardDeviation-Y TimeGravityAccelerationeleration-StandardDeviation-Z TimeBodyAccelerationelerationJerk-Mean-X
 	Min.   :-0.9942                                      Min.   :-0.9910                                      Min.   :0.04269                         
 	1st Qu.:-0.9711                                      1st Qu.:-0.9605                                      1st Qu.:0.07396                         
 	Median :-0.9590                                      Median :-0.9450                                      Median :0.07640                         
 	Mean   :-0.9524                                      Mean   :-0.9364                                      Mean   :0.07947                         
 	3rd Qu.:-0.9370                                      3rd Qu.:-0.9180                                      3rd Qu.:0.08330                         
 	Max.   :-0.6436                                      Max.   :-0.6102                                      Max.   :0.13019                       



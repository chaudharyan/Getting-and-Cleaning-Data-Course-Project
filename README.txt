
GETTING AND CLEANING DATA COURSE README
======================================================================================================


This repo includes the following files:

1. run_analysis.R : R script file which load, transforms and outputs a tidy data set
2. CodeBook.md 	  : Indicates all the variables and summaries calculated, along with units, and any other relevant information.
3. Week4_Getting_Cleaning_Data.txt : Output file generated after running run_analysis.R 
4. README.txt     : Analysis of run_analyis.R

Background for run_analysis.R:
=========================================
	
One of the most exciting areas in all of data science right now is wearable computing - see for example "Data Science, Wearable Computing and 
the Battle for the Throne as World’s Top Sports Brand"  (http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/).
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course 
website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data 
was obtained :"Human Activity Recognition Using Smartphones Data Set" (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)



For the purpose of our project we are getting the raw data from : Human Activity Recognition Using Smartphones Dataset (Version 1.0)
								  

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

	

Analysis of run_analysis.R
=============================================
This files does the following Tasks :

Task 1. Merges the training and the test sets to create one data set.
Task 2. Extracts only the measurements on the mean and standard deviation for each measurement.
Task 3. Uses descriptive activity names to name the activities in the data set
Task 4. Appropriately labels the data set with descriptive variable names.
Task 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Human Activity Recognition Using Smartphones Dataset is randomly partitioned for training and testing purpose into two sets Training set and Test set and these files are stored as follows
- 'X_train.txt': Training set.
- 'y_train.txt': Training labels.
- 'X_test.txt': Test set.
- 'y_test.txt': Test labels.
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


The Script first sets the working directory which can be changed by any user. 
It reads all the above files. And renames columns where needed and appropriate as seen below:
 				            
                			colnames(test_y)<-"Activity"
					colnames(train_y)<-"Activity"            			 
                			colnames(test_subject) <-"Subject" 
					colnames(train_subject) <-"Subject"          			
                			colnames(test_x)<-feature$V2
					colnames(train_x)<-feature$V2
            

It creates two datasets ,training dataset and test dataset, by column binding the Subject and Activity files to X_train and X_test files.
These two datasets are appended since they were randomly partitioned for training and testing purpose as mentioned earlier
		  
For Task 1: These two datasets are joined together to create a single dataset called joined_dataset
	    Using rbind() to add test dataset rows to train dataset rows 

		   			joined_data<-rbind(train_data,test_data)

For Task 2: Only those measurement columns are extracted from above dataset which contains either strings 'mean' or 'std'
	    Grep() is used as these strings could be found anywhere (beginning, middle or end) in the column names

For Task 3:Rename all the activities (listed as numbers 1-6) with their corresponding descriptive names such as 
	   WALKING,
	   WALKING_UPSTAIRS,
	   WALKING_DOWNSTAIRS,
 	   SITTING,
	   STANDING 
	   LAYING

			      
Merge() is used to add activity name to its corresponding activity number. Reordered dataset to keep Activity name and remove Activity number column
		
For Task 4: Descriptive variable names means names based on the action the variable is recording, for example the Jerk of the body on the z axis.
The labels are made more cleaner and descriptive by replacing abbreviations with full defintions , replacing paranthesis etc.
					
 
For Task 5 : The above dataset is summarized by finding the average value of all the variables by Activity by Subject. 
Variable here means independent measurements of activity/subject actions
	     Aggregate() is used to find mean of all measurement labelsfor each activity and each subject
			      


Tidy data is not made to be look neat in programs like notepad (usually default for text files on windows) 
Hence write.table is used to save the data to a file 'Week4_Getting_Cleaning_Data.txt' in the working directory. 


View the data in Week4_Getting_Cleaning_Data.txt
================================================= 
	data <- read.table(file_path, header = TRUE) 
        View(data)




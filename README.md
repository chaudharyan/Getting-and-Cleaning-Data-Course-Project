
## Getting and Cleaning Data Course Project README


This repo includes the following files:

1. run_analysis.R : R script file which load, transforms and outputs a tidy data set
2. CodeBook.md 	  : Indicates all the variables and summaries calculated, along with units, and any other relevant information.
3. Week4_Getting_Cleaning_Data.txt : Output file generated after running run_analysis.R 
4. README.txt     : Analysis of run_analyis.R

### Background:
-----------------------------------------------------------------------------------------
	
One of the most exciting areas in all of data science right now is wearable computing - see for example [Data Science, Wearable Computing and the Battle 
for the Throne as World’s Top Sports Brand](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/).Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data 
was obtained :[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)



For the purpose of our project we are getting the raw data from : Human Activity Recognition Using Smartphones Dataset (Version 1.0)
								  

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

	

### Analysis of run_analysis.R
-----------------------------------------------------------------------------------------
This files does the following Tasks :

	Task 1. Merges the training and the test sets to create one data set.
	Task 2. Extracts only the measurements on the mean and standard deviation for each measurement.
	Task 3. Uses descriptive activity names to name the activities in the data set
	Task 4. Appropriately labels the data set with descriptive variable names.
	Task 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Human Activity Recognition Using Smartphones Dataset is randomly partitioned for training and testing purpose into two sets Training set and Test set and these files are saved as follows
- 'X_train.txt':  Training set.
- 'y_train.txt':  Training labels.
- 'X_test.txt' :  Test set.
- 'y_test.txt' :  Test labels.
- 'features.txt': List of all features.
- 'subject_train.txt': Subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'activity_labels.txt': Links the class labels with their activity name.



The Script first sets the working directory which can be changed by any user.<br>
It then reads all the above files and renames columns in the files where needed as seen below:
 				            
	colnames(test_y)<-"Activity"
	colnames(train_y)<-"Activity"            			 
	colnames(test_subject) <-"Subject" 
	colnames(train_subject) <-"Subject"          			
	colnames(test_x)<-feature$V2
	colnames(train_x)<-feature$V2
            

The two datasets are created namely training dataset and test dataset by adding Subject and Activity columns to the beginning of train_x and test_x files.<br>
These two datasets are appended since they were randomly partitioned for training and testing purpose as mentioned earlier
		  
 * **Task 1**: The two datasets above are joined together to create a single dataset called joined_dataset <br>
	**rbind()** appends test dataset to train dataset 

		 joined_data<-rbind(train_data,test_data)

 * **Task 2**: Extracted measurement columns from joined_data where the column names contain either 'mean' or 'std' string.<br>
	   **Grep()** searches for these strings anywhere in the column names and returns the column index 

 * **Task 3**:Rename all the activities (listed as numbers 1-6) with their corresponding descriptive names such as<br> 
	1: WALKING,
	2: WALKING_UPSTAIRS,
	3: WALKING_DOWNSTAIRS,
	4: SITTING,
	5: STANDING 
	6: LAYING
 <br><br>
			      
	   **Merge()** adds descriptive activity name to its corresponding activity number. <br>
	   It adds the activity name column at the end of the dataset hence the dataset was reordered to make activity name as the first column and remove Activity number column
		
 * **Task 4**: The labels were made cleaner and descriptive by replacing abbreviations with full defintions , replacing paranthesis etc.
	  
	Replace letter 't' or 'f' in the beginning of the column name with 'Time' or 'Frequency'<br>
		**sub()** replaces only the first instance of the pattern <br><br>

	  	colnames(final_data)<- sub("^t", "Time", names(final_data))
		colnames(final_data)<- sub("^f", "Frequency", names(final_data))	
	 
          
	<br>Replace abbreviated 'Acc','std()','Freq()','Mag' to 'Accelearation','StandardDeviation()','Frequency()' and 'Magnitude'<br>
		**gsub() replaces all instances of pattern string<br><br>

	 	colnames(final_data)<- gsub("Acc", "Acceleration", names(final_data))
                colnames(final_data)<- gsub("std\\()", "StandardDeviation\\()", names(final_data))
                colnames(final_data)<- gsub("Freq\\()", "Frequency\\()", names(final_data))
                colnames(final_data)<- gsub("Mag", "Magnitude", names(final_data))

	<br>Replace words with lowercase first letter to Uppercase<br><br>

		colnames(final_data)<- gsub("frequency", "Frequency", names(final_data))
                colnames(final_data)<- gsub("mean", "Mean", names(final_data))

	<br>Remove any paranthesis and replace any word 'BodyBody' to 'Body'<br><br>

		 colnames(final_data)<- gsub("BodyBody", "Body", names(final_data))
                 colnames(final_data)<- gsub("\\()", "", names(final_data))

	
		

 * **Task 5** : Summarize the dataset by finding average value of all the variables by Activity and by Subject.<br>
		Variable here means independent measurements of activity/subject actions<br>
			**aggregate()** is used to find mean of all measurement labels for each activity and subject<br>
		 
			  		    


Tidy data created with above steps is not made to be look neat in programs like notepad (usually default for text files on windows) 
Hence **write.table()** is used to save the data to a file _'Week4_Getting_Cleaning_Data.txt'_ in the working directory. 


### Analyze Week4_Getting_Cleaning_Data.txt
-----------------------------------------------------------------------------------------
	data <- read.table(file_path, header = TRUE) 
	View(data)




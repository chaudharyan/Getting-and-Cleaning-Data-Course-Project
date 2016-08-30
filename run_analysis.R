install.packages("dplyr")
library("dplyr")

dataset_function <- function()
{
    
 
    
    # Set the working directory where all the files are saved.
    
        setwd("C:/Users/chaudharyan/Desktop/Coursera-MainFolder")
        
  
    # Loading feature and activity_labels files
        feature<-read.table("./FUCI HAR Dataset/UCI HAR Dataset/features.txt")
        
        activity_labels<-read.table("./FUCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
        # Renames the activity file columns
            colnames(activity_labels) <-c ("Activity","Desc")
    
    #### Training files
   
             # Loading the Training files. 
    
                train_y<-read.table("./FUCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
                train_x <-read.table("./FUCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
                train_subject<-read.table("./FUCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
            
    
            # 'train_y' file only has one column which is the Activity column . So named that column: Activity
           
                 colnames(train_y)<-"Activity"
            
            # 'train_subject' file also has one column which represent the subject or volunteers who participated in the experiment.So named that column: Subject
            
                colnames(train_subject) <-"Subject"
            
            # 'feature.txt' lists the labels/column names for 'train_x' file. Assigned labels to train_x
                colnames(train_x)<-feature$V2
            
    
            # Added Subject and Activity files to train_x file to create training dataset
            
                train_data <- cbind(train_subject,train_y, train_x)
    
    
   #### Test files
    
    
            # Loading the Test files. 
                test_y<-read.table("./FUCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
                test_x <-read.table("./FUCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
                test_subject<-read.table("./FUCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
                
    
            # 'test_y' file only has one column which is the Activity column . So named that column: Activity
           
                colnames(test_y)<-"Activity"
    
            ## 'test_subject' file also has one column which represent the subject or volunteers who participated in the experiment.So named that column: Subject
                
                colnames(test_subject) <-"Subject"
            
            ## 'feature.txt' lists the labels or column names for 'test_x' file. Assigned feature column names to test_x
                colnames(test_x)<-feature$V2
            
            ## Added Subject and Activity files to test_x file to create test dataset
                test_data <- cbind(test_subject,test_y, test_x)
    
    
   ####  1. Merges the training and the test sets to create one data set.
    
            joined_data<-rbind(train_data,test_data)
    
    
            
   ####  2.  Extracts only the measurements on the mean and standard deviation for each measurement.
            
            ## Extract only those columns from joined dataset where the column name contains either mean() or std() in it. 
                ## mean() or std() can exist anywehere in the columnname (beginning,end or middle) hence using grep function
                 
                colnames <- grep("mean|std",colnames(joined_data))
                extract_data <- joined_data[,c(1,2,colnames)]
    
                
   ####  3.  Uses descriptive activity names to name the activities in the data set  
                
            ## Merge the activity_labels file with above extract_data file so that we can get descriptive activity name column added to the dataset. 
               
                        merged_data <- merge(extract_data,activity_labels)
    
             ## Merge adds the Activity name as the last column hence reordering dataset to make it the first column
                    ## Extract last column as first and then rest of the columns except activity number columns
    
                        final_data <- merged_data[ , c(ncol(merged_data),3:ncol(merged_data)-1)]
                    ## Rename the first column as Activity 
                        
                        colnames(final_data)[1]<-"Activity"
    
    
                        
                        
   ####  4.  Uses descriptive activity names to name the activities in the data set  
                        
                        
                    colnames(final_data)<- sub("^t", "Time", names(final_data))
                    colnames(final_data)<- sub("^f", "Frequency", names(final_data))
                    colnames(final_data)<- gsub("Acc", "Acceleration", names(final_data))
                    colnames(final_data)<- gsub("std\\()", "StandardDeviation\\()", names(final_data))
                    colnames(final_data)<- gsub("Freq\\()", "Frequency\\()", names(final_data))
                    colnames(final_data)<- gsub("Mag", "Magnitude", names(final_data))
                    colnames(final_data)<- gsub("frequency", "Frequency", names(final_data))
                    colnames(final_data)<- gsub("mean\\()", "Mean\\()", names(final_data))
                    colnames(final_data)<- gsub("BodyBody", "Body", names(final_data))
                    
                   
                        
      return(final_data)
    
    
    
}

   

####  5.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

        # Returns the dataset from the above function
             tidy_dataset <-dataset_function()
             
             temp_dataset<-lapply(tidy_dataset, function(x) type.convert(as.character(x)))

        # summarizing the data and finding mean value of all variables for each Activity and Subject
             final <- aggregate(.~Activity+Subject, temp_dataset, mean)


        # Exporting data 
             write.table(final, file = "./Week4_Getting_Cleaning_Data .txt",row.name=FALSE)

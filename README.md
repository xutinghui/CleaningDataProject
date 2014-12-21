## Getting and Cleaning Data Course Project

### Project Purpose
The goal is clean the data collected from the accelerometers from the Samsung Galaxy S smartphone. The data is available for downloading at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The project includes the following files:

* README.md - the file explains the project purpose, tasks and how the script works
* CodeBook.ms - the file explains the variables in the file CleanData.txt
* CleanData.txt - the file contains the resulting data after cleaning
* run_analysis.R - the file contains all the scripts that are needed to execute to generate CleanData.txt


### Steps to Clean the Data

Cleaning the data includes the following 5 tasks:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Implementation Detail

File run_analysis.R contains the scripts that perform the above tasks.

##### 1. Read in the following train and test data files, and combine them into one data frame.     

The script combines 3 training files using cbind(), 3 test files using cbind(), and then     combine the 2 data frames using rbind(). The result is a data frame that contains 10299 observations of 563 variables.

    * Train
        1. subject_train.txt : contains the subject id for 7352 observations
        2. y_train.txt: contains the activity id for the 7352 observations
        3. x_train.txt: contains 7352 observations of 561 variables 
    * Test
        1. subject_test.txt: contains the subject id for 2947 observations
        2. y_test.txt: contains the activity id for the 2947 observations
        3. x_test.txt: contains 2947 observations of 561 variables

##### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

The script reads in the following file and assign the 561 names to the last 561 columns of data frame generated in task 1. The first 2 columns of the data frame are "SubjectID" and "ActivityID". The script then subsets the first 2 columns, plus all the columns with substring "-mean()" or "-std()" in the names. The result is a data frame that contains 10299 observations of 68 variables.

    * features.txt : list of all features (names of the 561 variables)
    
##### 3. Uses descriptive activity names to name the activities in the data set. 

The script reads in the following file and join the above data frame by column "ActivityID". Then subsets SubjectID, Activity and the 66 variables that contain the mean and standard deviation readings.

    * activity_labels.txt: activity names for each of the 6 activities
    
##### 4. Appropriately labels the data set with descriptive variable names. 

The script globally substitues the following substrings in the variable names with meaningful substrings:

    * mean() - Mean
    * std() - StandardDeviation
    * Acc - Acceleration
    * leading t - Time
    * leading f - Frequency
    
##### 5. The script averages the data in the rest of 66 the variables for each subject(SubjectID) and activity(Activity) , and export to CleanData.txt

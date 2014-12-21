# ---------------------------------------------------------------------
# Task 1. Merges the training and the test sets to create one data set.
# ---------------------------------------------------------------------
## 1.1 -----  Training Data  ----- 
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                          sep="\n", 
                          fill=FALSE, 
                          strip.white=TRUE)

trainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                       sep="\n", 
                       fill=FALSE, 
                       strip.white=TRUE)

trainReading <- read.table("./UCI HAR Dataset/train/x_train.txt")

# merge train subject, activity and reading using cbind()
trainData <- cbind(trainSubject, trainActivity, trainReading)

## 1.2 ----- Test Data -----
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                          sep="\n", 
                          fill=FALSE, 
                          strip.white=TRUE)

testActivity <- read.table("./UCI HAR Dataset/test/y_test.txt", 
                           sep="\n", 
                           fill=FALSE, 
                           strip.white=TRUE)

testReading <- read.table("./UCI HAR Dataset/test/x_test.txt")

# merge test subject, activity and reading using cbind()
testData <- cbind(testSubject, testActivity, testReading)

## 1.3 ----- Merge Train and Test Data ------
# merge training data and test data with rbind()
Data <- rbind(trainData, testData)

# ----------------------------------------------------------------
# Task 2. Extracts only the measurements on the mean and standard 
# deviation for each measurement. 
# ----------------------------------------------------------------
## 2.1 ----- read in features header as vector -----
features <- read.table("./UCI HAR Dataset/features.txt")
featuresVec <- as.vector(features$V2)

## 2.2 ----- Assign column names to merged Data -----
names(Data) <- c("SubjectID", "ActivityID", featuresVec)

## 2.3 ----- extract only the columns with substring mean() or std() with SubjectID and ActivityID fields ----
meanstd <- subset(Data, select = c("SubjectID", 
                                   "ActivityID", 
                                   colnames(Data)[grep("-(mean|std)\\(\\)", colnames(Data))]))

# ----------------------------------------------------------------
# Task 3. Uses descriptive activity names to name the activities 
# in the data set
# ----------------------------------------------------------------
## 3.1 ----- read in activity label table -----
activityLabel <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activityLabel) <- c("ActivityID", "Activity")

## 3.2 ----- join meanstd with activityLabel
library(plyr)
tmp <- join(meanstd, activityLabel)

## 3.3 ----- subset SubjectID, Activity and mean/std readings
# field 1: SubjectID, 69: Activity, 3:68: mean and std readings
meanstdWithActivity <- tmp[,c(1, 69, 3:68)]

# --------------------------------------------------------------------------
# Task 4. Appropriately labels the data set with descriptive variable names. 
# --------------------------------------------------------------------------
## ----- replace mean() with Mean
names(meanstdWithActivity) <- gsub("mean\\(\\)", "Mean", names(meanstdWithActivity))
## ----- replace std() with StandardDeviation
names(meanstdWithActivity) <- gsub("std\\(\\)", "StandardDeviation", names(meanstdWithActivity))
## ----- replace Acc with Acceleration
names(meanstdWithActivity) <- gsub("Acc", "Acceleration", names(meanstdWithActivity))
## ----- replace leading t with Time
names(meanstdWithActivity) <- gsub("^t", "Time", names(meanstdWithActivity))
## ----- replace leading f with Frequency
names(meanstdWithActivity) <- gsub("^f", "Frequency", names(meanstdWithActivity))

# -----------------------------------------------------------
# Task 5. From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable 
# for each activity and each subject.
# -----------------------------------------------------------
## ----- for each subject and each activity, get the average for the rest of the columns
CleanData <- ddply(meanstdWithActivity, .(SubjectID, Activity), numcolwise(mean))
write.table(CleanData, file = "CleanData.txt", row.name=FALSE)
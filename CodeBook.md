---
title: "Getting and Cleaning Data Course Project"
author: "Tinghui Xu"
date: "2014-12-21"
---

##### Source files

    * subject_train.txt : contains the subject id for 7352 observations
    * y_train.txt: contains the activity id for the 7352 observations
    * x_train.txt: contains 7352 observations of 561 variables 
    * subject_test.txt: contains the subject id for 2947 observations
    * y_test.txt: contains the activity id for the 2947 observations
    * x_test.txt: contains 2947 observations of 561 variables
    * features.txt : list of all features (names of the 561 variables)
    * activity_labels.txt: activity names for each of the 6 activities
    
##### Variables in the script

The following variables are created in the script files in order to generate the final data set:

    * trainSubject: training subject ids in file subject_train.txt
    * trainActivity: traning activity ids in file y_train.txt
    * trainReading: data for training in file x_train.txt
    * trainData: merged data from trainSubject, trainActivity, and trainReading
    * testSubject: test subject ids in file subject_test.txt
    * testActivity: test activity ids in file y_test.txt
    * testReading: data for test in file x_test.txt
    * testData: merged data from testSubject, testActivity, and testReading
    * Data: result from rbind of trainData and testData
    * features: all features in file features.txt
    * featuresVec: vector of features
    * meanstd: data frame that contains SubjectID, ActivityID and all columns with substring "-mean()" or "-std()"
    * activityLabel: all activities in file activity_labels.txt
    * tmp: temporary variable created by joining meanstd and activityLabel by ActivityID
    * meanstdWithActivity: data frame with SubjectID, Activity and all columns mean() and std() columns
    * CleanData: final result data frame created by averaging meanstdWithActivity by SubjectID and Activity 

##### Variable names
The result data set (CleanData.txt) contains 180 observations of 68 variables. There are total of 30 subjects and 6 activities. Each observation is the list of averages for the each variable (66) for a specific subject and activity. Here are the variable names:

    1. SubjectID: ID of the 30 subjects
    2. Activity: one of the following 6 activities
        1 - WALKING
        2	- WALKING_UPSTAIRS
        3	- WALKING_DOWNSTAIRS
        4	- SITTING
        5	- STANDING
        6	- LAYING
    3. TimeBodyAcceleration-Mean-X
    4. TimeBodyAcceleration-Mean-Y
    5. TimeBodyAcceleration-Mean-Z
    6. TimeBodyAcceleration-StandardDeviation-X
    7. TimeBodyAcceleration-StandardDeviation-Y
    8. TimeBodyAcceleration-StandardDeviation-Z
    9. TimeGravityAcceleration-Mean-X
    10. TimeGravityAcceleration-Mean-Y
    11. TimeGravityAcceleration-Mean-Z
    12. TimeGravityAcceleration-StandardDeviation-X
    13. TimeGravityAcceleration-StandardDeviation-Y
    14. TimeGravityAcceleration-StandardDeviation-Z
    15. TimeBodyAccelerationJerk-Mean-X
    16. TimeBodyAccelerationJerk-Mean-Y
    17. TimeBodyAccelerationJerk-Mean-Z
    18. TimeBodyAccelerationJerk-StandardDeviation-X
    19. TimeBodyAccelerationJerk-StandardDeviation-Y
    20. TimeBodyAccelerationJerk-StandardDeviation-Z
    21. TimeBodyGyro-Mean-X
    22. TimeBodyGyro-Mean-Y
    23. TimeBodyGyro-Mean-Z
    24. TimeBodyGyro-StandardDeviation-X
    25. TimeBodyGyro-StandardDeviation-Y
    26. TimeBodyGyro-StandardDeviation-Z
    27. TimeBodyGyroJerk-Mean-X
    28. TimeBodyGyroJerk-Mean-Y
    29. TimeBodyGyroJerk-Mean-Z
    30. TimeBodyGyroJerk-StandardDeviation-X
    31. TimeBodyGyroJerk-StandardDeviation-Y
    32. TimeBodyGyroJerk-StandardDeviation-Z
    33. TimeBodyAccelerationMag-Mean
    34. TimeBodyAccelerationMag-StandardDeviation
    35. TimeGravityAccelerationMag-Mean
    36. TimeGravityAccelerationMag-StandardDeviation
    37. TimeBodyAccelerationJerkMag-Mean
    38. TimeBodyAccelerationJerkMag-StandardDeviation
    39. TimeBodyGyroMag-Mean
    40. TimeBodyGyroMag-StandardDeviation
    41. TimeBodyGyroJerkMag-Mean
    42. TimeBodyGyroJerkMag-StandardDeviation
    43. FrequencyBodyAcceleration-Mean-X
    44. FrequencyBodyAcceleration-Mean-Y
    45. FrequencyBodyAcceleration-Mean-Z
    46. FrequencyBodyAcceleration-StandardDeviation-X
    47. FrequencyBodyAcceleration-StandardDeviation-Y
    48. FrequencyBodyAcceleration-StandardDeviation-Z
    49. FrequencyBodyAccelerationJerk-Mean-X
    50. FrequencyBodyAccelerationJerk-Mean-Y
    51. FrequencyBodyAccelerationJerk-Mean-Z
    52. FrequencyBodyAccelerationJerk-StandardDeviation-X
    53. FrequencyBodyAccelerationJerk-StandardDeviation-Y
    54. FrequencyBodyAccelerationJerk-StandardDeviation-Z
    55. FrequencyBodyGyro-Mean-X
    56. FrequencyBodyGyro-Mean-Y
    57. FrequencyBodyGyro-Mean-Z
    58. FrequencyBodyGyro-StandardDeviation-X
    59. FrequencyBodyGyro-StandardDeviation-Y
    60. FrequencyBodyGyro-StandardDeviation-Z
    61. FrequencyBodyAccelerationMag-Mean
    62. FrequencyBodyAccelerationMag-StandardDeviation
    63. FrequencyBodyBodyAccelerationJerkMag-Mean
    64. FrequencyBodyBodyAccelerationJerkMag-StandardDeviation
    65. FrequencyBodyBodyGyroMag-Mean
    66. FrequencyBodyBodyGyroMag-StandardDeviation
    67. FrequencyBodyBodyGyroJerkMag-Mean
    68. FrequencyBodyBodyGyroJerkMag-StandardDeviation
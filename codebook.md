
# FEATURES
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

These signals have been further summarized by user and activity, extracting the mean of the mean and std of each signal. 

activity

    The labeled activity the subject has performed
    unit-
    values:
    WALKING 
    WALKING_UPSTAIRS
    WALKING_DOWNSTAIRS 
    SITTING 
    STANDING 
    LAYING
    
subjectId

    The id of the individual (subject) who performed the activity
    unit-
    values:
    1-30

mean-tBodyAcc-XYZ

    mean of body acceleration (mean/std) in directions X,Y,Z
    unit m/s^2
    
mean-tGravityAcc-XYZ

    mean of gravital force (mean/std)  in directions X,Y,Z
    unit m/s^2
    
mean-tBodyAccJerk-XYZ

    mean of body jerk (mean/std) in directions X,Y,Z
    unit m/s^3
    
mean-tBodyGyro-XYZ

    mean of body angular velocity (mean/std) in directions X,Y,Z
    unit rad/s
    
mean-tBodyGyroJerk-XYZ

    mean of body angular jerk (mean/std) in directions X,Y,Z
    unit rad/s^3
    
mean-tBodyAccMag

    mean of magnitude in body acceleration (mean/std) 
    unit m/s^2
    
mean-tGravityAccMag

    mean of magnitude in gravital force (mean/std) 
    unit m/s^
    
mean-tBodyAccJerkMag

    mean of magnitude in body jerk (mean/std) 
    unit m/s^3
    
mean-tBodyGyroMag

    mean of magnitude in body angular velocity (mean/std)
    unit rad/s
    
mean-tBodyGyroJerkMag

    mean of magnitude of body angular jerk (mean/std)
    unit rad/s^3
    
mean-fBodyAcc-XYZ

    fourier transform of mean-tBodyAcc-XYZ 
    unit: Hz
    
mean-fBodyAccJerk-XYZ

    fourier transform of mean-tBodyAccJerk-XYZ
    unit: Hz
    
mean-fBodyGyro-XYZ

    fourier transform of mean-tBodyGyro-XYZ
    unit: Hz
    
mean-fBodyAccMag

    fourier transform of mean-tBodyAccMag
    unit: Hz
    
mean-fBodyAccJerkMag

    fourier transform of mean-tBodyAccJerkMag
    unit: Hz
    
mean-fBodyGyroMag

    fourier transform of mean-tBodyGyroMag
    unit: Hz
    
mean-fBodyGyroJerkMag

    fourier transform of mean-tBodyGyroJerkMag
    unit: Hz
    
    
The set of variables that were estimated from these signals are: 

    mean(): Mean value
    std(): Standard deviation

# METHODS
Feature selection on raw data:
Only the features that contained mean and std information were considered. These features were found by using grep, filtering on the features containing "mean()" or "std()".
```
featureIdx<- grep(".*(mean\\(\\)|std\\(\\)).*",features[,2])
```
where features is the feature file data.

These features where then extracted from the test and train data, and these tables were then merged. 

The method used for averaging per user and activity is the aggregate function, used as
```
aggregate(data[,3:ncol(data)], list(data$activity,data$user), mean)
```
which will aggregate (group) the data frame per user and activity, the run mean on all columns for that group, excluding column 1&2, which contains the user and activity.




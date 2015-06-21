# Codebook

## Project Description
The purpose of this project is to prepare a tidy dataset from a dataset 
containing accelerometer data from a Samsung smartphone, using an R script. 

The raw data can be found on the UCI Machine Learning website here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Study information

The study was carried out with 30 participants, each subject performed 6 activities:
`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING` and 
`LAYING`; while wearing a smartphone on their waist. Using the smartphone's 
accelerometer and gyroscope, data was collected. Specifically, 3-axial linear 
acceleration and 3-axial angular velocity was sampled at a rate of 50Hz. The dataset
was partitioned into 2 sets, 70% of the data went into a training dataset, while
the rest went into a test dataset.

## Cleaning of the raw data

The raw datasets, the training and test data, were merged and some columns were 
removed before the tidy dataset was created; for more information check the README.md
file.

## Tidy dataset information
The tidy dataset contains 180 observations with 68 variables.

Each of the 30 subject's were each given a unique ID number during the study, and  
were recorded doing one of the six aformentioned activities. This information is 
stored in the  `Subject` and `Activity` columns of the tidied dataset respectively. 
The numeric variables were averaged across every instance in which a given subject 
was doing a certain activity. As a result, each subject has six values for each 
variable (one for each activity).


### Variable details
The variables in the original dataset were named in such a way as to be as descriptive
as possible. Note that these names were preserved in the tidy dataset.

A suffix (X, Y, or Z) would denote an axial signal in a specific direction.

A prefix would denote the domain of the signal, t for time domain, f for frequency
domain. The frequency domain signals were produced by applying a Fast Fourier Transform
onto a time domain signal.

Accelerations were split into body and gravitational accelaration signals, denoted
by either Body or Gravity being present in the variable name, respectively.

Signals recoded by the accelerometer (ie. accelarations) would be denoted by Acc 
in the variable name, while signals recoded by the gyroscope (ie. angular velocities) 
would be denoted by Gyro.

The derivative with respect to time was computed to obtain Jerk signals, which 
are denoted by Jerk. 

The magnitude of a 3D signal was computed using the Euclidean norm, and is denoted
by Mag.

Finally, some variables were estimated from the original signals, including
mean() and std(), which contained the mean value and standard deviations
respectively. Note, that these values were the only ones that were kept in the 
tidy dataset, the others, such as max() and min() were removed. Also, keep in
mind that these values were calculated *before* the data was tidied, thus the
value in the tidy dataset is actually a mean of means or a mean of standard
deviations.

Note that the possible values of every numeric variable was normalized to lie in
the range [-1,1], as a result, the values are unitless, and the means recorded in
the tidy dataset also lie within that range.


| Variable                      | Details | Class |
|-------------------------------|---------|-------|
| `Subject`                     | Unique ID assigned to the subject | `integer` | 
| `Activity`                    | Activity that the subject is doing | `factor` | 
| `fBodyAcc-mean()-XYZ`         | Mean of frequency domain body acceleration signals in a specific direction | `numeric` |
| `fBodyAcc-std()-XYZ`          | Standard deviation of frequency domain body acceleration signals in a specific direction | `numeric` |
| `fBodyAccJerk-mean()-XYZ`     | Mean of frequency domain body acceleration jerk signals in a specific direction | `numeric` |
| `fBodyAccJerk-std()-XYZ`      | Standard deviation of frequency domain body acceleration jerk signals in a specific direction | `numeric` |
| `fBodyAccMag-mean()`          | Mean of frequency domain body acceleration magnitude signals | `numeric` |
| `fBodyAccMag-std()`           | Standard deviation of frequency domain body acceleration magnitude signals | `numeric` |
| `fBodyBodyAccJerkMag-mean()`  | Mean of frequency domain body acceleration jerk magnitude signals | `numeric` |
| `fBodyBodyAccJerkMag-std()`   | Standard deviation of frequency domain body acceleration jerk magnitude signals | `numeric` |
| `fBodyBodyGyroJerkMag-mean()` | Mean of frequency domain body angular velocity jerk magnitude signals | `numeric` |
| `fBodyBodyGyroJerkMag-std()`  | Standard deviation of frequency domain body angular velocity jerk magnitude signals | `numeric` |
| `fBodyBodyGyroMag-mean()`     | Mean of frequency domain body angular velocity magnitude signals | `numeric` |
| `fBodyBodyGyroMag-std()`      | Standard deviation of frequency domain body angular velocity magnitude signals | `numeric` |
| `fBodyGyro-mean()-XYZ`        | Mean of frequency domain body angular velocity signals in a specific direction | `numeric` |
| `fBodyGyro-std()-XYZ`         | Standard deviation of frequency domain body angular velocity signals in a specific direction | `numeric` |
| `tBodyAcc-mean()-XYZ`         | Mean of time domain body acceleration signals in a specific direction | `numeric` |
| `tBodyAcc-std()-XYZ`          | Standard deviation of time domain body acceleration signals in a specific direction | `numeric` |
| `tBodyAccJerk-mean()-XYZ`     | Mean of time domain body acceleration jerk signals in a specific direction | `numeric` |
| `tBodyAccJerk-std()-XYZ`      | Standard deviation of time domain body acceleration jerk signals in a specific direction | `numeric` |
| `tBodyAccJerkMag-mean()`      | Mean of time domain body acceleration jerk magnitude signals | `numeric` |
| `tBodyAccJerkMag-std()`       | Standard deviation of time domain body acceleration jerk magnitude signals | `numeric` |
| `tBodyAccMag-mean()`          | Mean of time domain body acceleration magnitude signals | `numeric` |
| `tBodyAccMag-std()`           | Standard deviation of time domain body acceleration magnitude signals | `numeric` |
| `tBodyGyro-mean()-XYZ`        | Mean of time domain body angular velocity signals in a specific direction | `numeric` |
| `tBodyGyro-std()-XYZ`         | Standard deviation of time domain body angular velocity signals in a specific direction | `numeric` |
| `tBodyGyroJerk-mean()-XYZ`    | Mean of time domain body angular velocity jerk signals in a specific direction | `numeric` |
| `tBodyGyroJerk-std()-XYZ`     | Standard deviation of time domain body angular velocity jerk signals in a specific direction | `numeric` |
| `tBodyGyroJerkMag-mean()`     | Mean of time domain body angular velocity jerk magnitude signals | `numeric` |
| `tBodyGyroJerkMag-std()`      | Standard deviation of time domain body angular velocity jerk magnitude signals | `numeric` |
| `tBodyGyroMag-mean()`         | Mean of time domain body angular velocity magnitude signals | `numeric` |
| `tBodyGyroMag-std()`          | Standard deviation of time domain body angular velocity magnitude signals | `numeric` |
| `tGravityAcc-mean()-XYZ`      | Mean of time domain gravitational acceleration signals in a specific direction | `numeric` |
| `tGravityAcc-std()-XYZ`       | Standard deviation of time domain gravitational acceleration signals in a specific direction | `numeric` |
| `tGravityAccMag-mean()`       | Mean of time domain gravitational acceleration magnitude signals | `numeric` |
| `tGravityAccMag-std()`        | Standard deviation of time domain gravitational acceleration magnitude signals | `numeric` |


## Sources

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
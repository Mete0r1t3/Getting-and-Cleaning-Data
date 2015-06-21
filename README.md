# Getting and Cleaning Data Course Project

## Summary
The purpose of this project is to prepare a tidy dataset from a dataset 
containing accelerometer data from a Samsung smartphone. 

The raw data can be found on the UCI Machine Learning website here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The tidy dataset is to be generated from the raw data using an R script called
`run_analysis.R`. The script I've created automatically downloads the dataset to 
whichever folder it is being run from, and processes it, eventually producing a
text file called tidy-data-set.txt containing the tidy data.

## Files
* `run_analysis.R` : The R script used to convert the raw data into the tidy dataset
* `Codebook.md` : The codebook containing description of variables
* `tidy-data-set.txt` : The tidy dataset produced by the R script

## Instructions 
To run the R script, simply put it on a drive that has sufficient space to 
download the dataset and run it, no need to set the working directory or download
and extract the dataset manually.

## Extra Details
The script first downloads the raw dataset if needed and extracts its contents,
it then reads several .txt files from the dataset folder as tables and merges
them accordingly, as well as assigning names to the columns of the partially 
tidied data. While doing this, it also removes any unnecessary columns such that
only those pertaining to the mean and standard deviations of each variable are
kept.

The script then computes the means for each variable for each independant subject
for each activity, and puts these values into a new data frame. Finally, the
script trims off another column and then writes the final, tidy data frame to 
the text file tidy-data-set.txt
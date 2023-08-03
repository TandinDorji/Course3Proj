# Course 3 Project

## Getting and Cleaning Data Course Project

###### *The purpose of this project is to demonstrate ability to collect, work with, and clean a data set.*

The `R script` in the file `run_analysis.R` does the following:

1.  Read `activity labels` and `feature names` from text files in the folder `data`.
2.  Read `train` and `test` data into dataframe using `read.table()` function.
3.  Combine train and test data with subject and activity label into a single dataframe called `activity`.
4.  Rename variable names and recode activity.
5.  Extract only the measurements on the `mean` and `standard deviation` using `grepl()`.
6.  Calculate `average` of each variable for each activity and each subject.
7.  Export tidy data frame into a `.txt` file called `activity_tidy.txt`.

**NOTE:** All datasets are stored in a folder labeled `data` in the same directory as the `R script`.

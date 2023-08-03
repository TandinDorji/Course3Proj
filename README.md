# Course 3 Project

## Getting and Cleaning Data Course Project

###### *The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.*

The R script in the file `run_analysis.R` does the following:

1.  Read train and test data into data frames using `read.fwf` function.
2.  Combine the two datasets for train and test into a single data frame `df`
3.  Read feature names and add to `df`
4.  Select only the `features` related to `mean`, `median` and `sd` into a new data frame, `df2`
5.  Read participant labels and add to `df2`

Dataset required for this project, including train, test and subject labels are all stored in the folder `data`.

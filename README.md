getting-and-cleaning
====================

ReadMe file for the getting and cleaning data project, and code book

The run_analysis.R code file:

** reads the x.test and train files in from the UCI HAR dataset directory (NB needs to be in the working directory)

** reads in column names from features.txt in the same directory and applies these to x.test and x.train

** reads in the activity key files y_test and Y_train

** adds an additional column to the activity key file to denote which file the row of data was from (ie test or train)

** takes a subset of the combined xtest and xtrain files containing only mean and std columns.  This is done as per the code
book provided with the original dataset, ie includes only column names containing "std()" or "mean()" as a string

** combines the activity files and renames the activity keys consistent with the original code book.  Badly.

** (ie sitting, standing, walking etc.)

** combines the activity keys with the mean and std subset - to give a tidy dataset "Cleandataset"

** calculates unweighted means of each column in Cleandataset by activity, and saves them to another dataset "means".

It then outputs "means"

NB no data cleaning was attempted, although unusually the original data file appears to contain some negative standard 
deviation figures.

"CODE BOOK"

The columns of the output data files are as follows:

** "testgroup" denotes whether the row is from the x_train or x_test file (not ultimately required, but what the hey)

** "activity" - the activity each row of data relates to consistent with the activity_labels.txt file in the original dataset

** mean and std columns consistent with the features.txt file, as described in the the features_info.txt file, both again as per the original data set (and hence with the same units).

The "cleandataset" file contains original data, and the means file contains calculated means.  the column names are consistent. "means" does not contain a "testgroup" column, as the means are only summarised by activity.

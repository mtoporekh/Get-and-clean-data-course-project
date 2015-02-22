# Getting and Cleaning Course Project
## Human Activity Recognition Using Smartphones

### Goal: Prepare tidy data that can be used for later analysis.

This project is about __weareble computing__, also known as body-borne computers or wearebles. These are miniature
electronic devices that are worn by the bearer under, with or on top clothing.

The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).

The sensor acceleration signal, which has gravitational and body motion components, was separated using
a Butterworth low-pass filter into body acceleration and gravity.

The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Having the dataset (raw data) I build script to get a tidy data set with the average of each variable for each activity and each subject.
The script has been added to this repository as **run_analysis.R**.

Following are the steps used in the script:

* Setting the working directory.
* Loads library deplyr for selects, filters and grouping data.
* Load and read all datasets to use.
* Getting all files together in one big Dataset.
* Merging to add the activity labels for each row.
* Just to remove and release memory.
* Getting the tidy data for columns that meassures mean and standard deviation.
* Grouping by Subject and Activity, and compute the average for each column.
* Writing to a txt file.

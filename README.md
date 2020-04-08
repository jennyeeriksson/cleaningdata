In this project, a tidy data set it produced that averages accelerometer and gyroscope data collected from smart phones. The data is summarized per individual user and the activity the user performed (i.e running, walking, standing etc).

# Files
* TidyData.txt - The tidy data set that contains average accelerometer and gyroscope signals per user and avtivity
* codebook.md - Describes all features in TidyData.txt
* run_analysis.R - The script that produces TidyData.txt
* raw_data - A catalog containing the raw data, including descriptive files

# Information
The data set TidyData.txt is produced by running the script run_analysis.R, which will extract data from the raw_data catalogue and compute the average movement signals per user and activity. See codebook.md for more information regarding the methods used.

The workflow of run_analysis is:
* Load files from raw_data
* Find the fatures containing mean and std values, using grep
* Merge train and test data
* Merge the train and test data with activity and user data
* Create the new data set, that averages the movements data per user and acitivty, using aggregate
* Write to file

# Instruction
1. Clone this repo
2. Run run_analysis.R with R version 3.6.3 
3. Inspect each accelerometer/gyroscope average signal per user and activity, as noted by the column names.
# Getting-and-Cleaning-Data-Project

First 13 lines are importing the multiple .txt files as data to be read into Rstudio. 
col.names=feat$signals among other variants of different column names were used to prepare ourselves for the upcoming rbind and cbind between datasets (.txt files) 

Step 1: 
rbind is used to construct an "X" and "Y" dataset, where both encompasses each of the training and subject_test data. 

Step 2:
used dplyr functions to select for specific columns from initial merged dataset into a more succint dataset. This allows me to only look for standard deviation and mean values for each preliminary column. 

Step 3 and Step 4: 
Initially tried using dplyr pipe function, %>%, to perform these actions in one function but would not work. 
Here are manually inputted lines of code effectively renaming column headers into more detailed, names; ex: Acc --> Accelerometer 

Step 5: 
Grouped by subject and activity and reported the means for all columns displayed 


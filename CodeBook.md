Variables: 
The initial variables function as preliminary data tables when reading the .txt files into Rstudio. Each .txt file from the .zip file corresponds to one data table.
Examples of these initial data tables include: x_train, y_train, subject_train, and so forth as stated under "Step 1" of the R script. 
These data tables contained information regarding the accelerometer rates, gyroscope readinings, gravitional and body motion components.

rbind consolidated the values for the x and y-axis into their own respective data tables such that the subsequent cbind and merge verbs would allow for one, holistic data table. 
The holistic data table was named "collective." 

Data & Transformations: 
In order to pull only the standard deviation and the mean values from the "collective" data table, select() was used to pick out exact columns. 
Importantly though, contains() allowed me to pull out STD and mean wherever it was mentioned as a column header. This simplified the subsetting process. 

Finally, the column headers were changed with scripts manually changing each header by replacing the existing header with the new, detailed header. 

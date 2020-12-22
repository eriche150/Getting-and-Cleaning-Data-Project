#importing data from test 
library(tidyverse)
feat<-read.table("UCI Har Dataset/features.txt",col.names=c("n","signals")) #this file must be in the same Coursera 1 --> Repository URL folder 
activities <- read.table("UCI Har Dataset/activity_labels.txt", col.names=c("code","activity"))
subject_test<-read.table("UCI Har Dataset/test/subject_test.txt",col.names=c("subject"))
x_subject_test<-read.table("UCI Har Dataset/test/X_test.txt",col.names=feat$signals) #established col. names for subject_test from feat's signals 
y_subject_test<-read.table("UCI Har Dataset/test/y_test.txt",col.names=c("code"))

#importing data from train
subject_train<-read.table("UCI Har Dataset/train/subject_train.txt",col.names="subject")
x_train<-read.table("UCI Har Dataset/train/X_train.txt",col.names=feat$signals)
y_train<-read.table("UCI Har Dataset/train/y_train.txt",col.names="code")
#"code" and "subject" are same headers in order to prepare for dt merge 

#Step 1: Merging train and test together 
Y<-rbind(y_train,y_subject_test)
X<-rbind(x_train,x_subject_test)
subject<- rbind(subject_train,subject_test)
collective<-cbind(subject,Y,X)

#Step 2: only extract STD and Mean for each measurement 
data1<-collective %>% select(subject, code, contains("std"), contains("mean"))

#put in activities (characters) in lieu for numerical code 
data1$code<-activities[data1$code,2] #2 means second column within activities df. 

#Step 3: substitute activity code for actual activities 
names(data1)[2]= "activity"

#Step 4: give headers descriptive FULL names 
names(data1)<-gsub(pattern="Acc",replacement="Accelerotometer",names(data1))
names(data1)<-gsub(pattern="Gyro",replacement="Gyroscope",names(data1))
names(data1)<-gsub(pattern="Mag",replacement="Magnitude",names(data1))
names(data1)<-gsub(pattern="BodyBody",replacement="Body",names(data1))
names(data1)<-gsub(pattern="^t",replacement="Time",names(data1))
names(data1)<-gsub(pattern="gravity",replacement="Gravity",names(data1))
names(data1)<-gsub(pattern="angle",replacement="Angle",names(data1))
names(data1)<-gsub(pattern="^f",replacement="Frequency",names(data1))
names(data1)<-gsub(pattern="-freq()",replacement="Frequency",names(data1), ignore.case=TRUE)
names(data1)<-gsub(pattern="tbody",replacement="TimeBody",names(data1))
names(data1)<-gsub(pattern="-std()",replacement="STD",names(data1),ignore.case=TRUE)
names(data1)<-gsub(pattern="-mean()",replacement="Mean",names(data1),ignore.case=TRUE)
names(data1)<-gsub(pattern="Acc",replacement="Acceleratometer",names(data1))

#Step 5: create second, independent tidy data set with average of each variable for each activity and subject 
absolutedata<-data1 %>% group_by(subject,activity) %>%
  summarise_all(list(mean))
write.table(absolutedata,"absolutedata.txt", row.name=FALSE)

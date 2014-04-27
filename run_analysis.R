# Course Project ####

# 1. Download of the data files  ####
if(!file.exists("./data")) {dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip", method = "curl")
date.downloaded <- date()
date.downloaded # "Sat Apr 26 10:28:30 2014"
unzip("./data/Dataset.zip", exdir="./data")

# 2. Loading data into R & adding subjects, activities and variables names ####
Test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
Test.label <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
Subject.test<- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
Train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
Train.label <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
Subject.train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
Features <- read.table("./data/UCI HAR Dataset/features.txt")
Names <- as.character(Features[, 2])

Test <- cbind(Subject.test, Test.label, Test) # add subjects and activity labels
colnames(Test) <- c("Subject", "Activity", Names) # assign variable names to columns

Train <- cbind(Subject.train, Train.label, Train) # add subjects and activity labels
colnames(Train) <- c("Subject", "Activity", Names) # assign variable names to columns

# 3. Merge the test and training datasets ####
table(Test$Subject) # Test dataset contains subjects 2   4   9  10  12  13  18  20  24 
table(Train$Subject) # Training dataset contains subjects 1   3   5   6   7   8  11  14  15  16  17  19  21  22  23  25  26  27  28  29  30
All <- rbind(Test, Train) # yields one dataset with data for all 30 subjets
table(All$Subject)

# 4. Extract only measurements on mean and sd ####
M <- grep("mean()", colnames(All), fixed = TRUE) # all columns with mean values
SD <- grep("std()", colnames(All), fixed = TRUE) # all columns with sd values
MSD <- All[ , c(M, SD)] # select all columns with mean and sd values
Tidy.Data <- cbind(All[,1:2], MSD) # add back in the subjects and activities
sum(is.na(Tidy.Data)) # check for missing values -- none

# 5. Use descriptive activity names to apropriately label the dataset ####
Tidy.Data$Activity <- gsub ("1", "WALKING", Tidy.Data$Activity)
Tidy.Data$Activity <- gsub ("2", "WALKING_UP", Tidy.Data$Activity)
Tidy.Data$Activity <- gsub ("3", "WALKING_DOWN", Tidy.Data$Activity)
Tidy.Data$Activity <- gsub ("4", "SITTING", Tidy.Data$Activity)
Tidy.Data$Activity <- gsub ("5", "STANDING", Tidy.Data$Activity)
Tidy.Data$Activity <- gsub ("6", "LYING", Tidy.Data$Activity)

# 6. Create a second independent tidy data set with averages of each variable for each activity and subject
Tidy.Data$Subject <- as.factor(Tidy.Data$Subject)
Tidy.Data$Activity <- as.factor(Tidy.Data$Activity)
str(Tidy.Data)

library(reshape2)
Melt <- melt(Tidy.Data, id.vars=c("Subject", "Activity"), measure.vars = c(3:68)) # melt data set on subject and activity
AVG.Data <- dcast(Melt, Subject + Activity ~ variable, mean) # reshape the data set with means for each activity and subject

write.table(AVG.Data, file = "AVGData.txt", row.names = FALSE, sep = ",")
write.table(Tidy.Data, file = "TidyData.txt", row.names = FALSE, sep = ",")

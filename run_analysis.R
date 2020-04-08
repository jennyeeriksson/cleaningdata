
# Load all files needed 
features<- read.table("raw_data/features.txt")
activityLabels<- read.table("raw_data/activity_labels.txt")
x_train<-read.table("raw_data/train/X_train.txt")
x_test<-read.table("raw_data/test/X_test.txt")
y_train<-read.table("raw_data/train/y_train.txt")
y_test<-read.table("raw_data/test/y_test.txt")
subjects_train<-read.table("raw_data/train/subject_train.txt")
subjects_test<-read.table("raw_data/test/subject_test.txt")

# Determine which features are representing mean and std data
featureIdx<- grep(".*(mean\\(\\)|std\\(\\)).*",features[,2])
featureNames <- features[featureIdx,2]

# Merge train and test x data, using only the selected features, sorting is FALSE to hinder rearranging of elements
data_x <- merge(x_train[,featureIdx],x_test[,featureIdx], all=TRUE, sort = FALSE)
names(data_x)<-featureNames

#Merge train and test y data
data_y<- c(y_train[,1],y_test[,1])

# Encode acitvities
data_y<-factor(data_y,activityLabels[,1],activityLabels[,2])
data_y<-data.frame(data_y)
names(data_y) = "activity"

#Merge train and test subject id data
data_subjects<- c(subjects_train[,1],subjects_test[,1])
data_subjects<-data.frame(data_subjects)
names(data_subjects) = "subjectId"

#Append activity and subject to data frame
data<-cbind(data_y,data_subjects,data_x)

# Create new data frame that averages (mean) each feature per subject and activity
averageDataPerUserActivity<-aggregate(data[,3:ncol(data)],list(data$activity, data$subjectId),mean)
names(averageDataPerUserActivity)[1:2] <- c("activity", "subjectId")
#add "mean" to front of label
names(averageDataPerUserActivity)[3:ncol(averageDataPerUserActivity)] <- paste("mean-",names(averageDataPerUserActivity)[3:ncol(averageDataPerUserActivity)], sep="")

#Write to file
write.table(averageDataPerUserActivity, "TidyData.txt", row.name=FALSE)

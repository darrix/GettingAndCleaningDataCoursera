# RUN_ANALYSIS.R
# Getting and Cleaning Data course


# read test data.  accept default names for now.
testPath <- file.path(getwd(),"samsung/test/x_test.txt")
data <- read.table(testPath,sep="",header=FALSE)

# read test activities and set column name
activitiesPath <- file.path(getwd(),"samsung/test/y_test.txt")
activities <- read.table(activitiesPath,sep="",header=FALSE)
setnames(activities,"activity")

# read test subjects and set column name
subjectPath <- file.path(getwd(),"samsung/test/subject_test.txt")
subjects <- read.table(subjectPath,sep="",header=FALSE)
setnames(subjects,"subject")

# add subject and activities columns to test data
data <- cbind(activities,data)
data <- cbind(subjects, data)

# read training data
trainPath <- file.path(getwd(),"samsung/train/x_train.txt")
trainData <- read.table(trainPath,sep="",header=FALSE)

# read training activities and set column name
activitiesPath <- file.path(getwd(),"samsung/train/y_train.txt")
activities <- read.table(activitiesPath,sep="",header=FALSE)
setnames(activities,"activity")

# read training subjects and set column name
subjectPath <- file.path(getwd(),"samsung/train/subject_train.txt")
subjects <- read.table(subjectPath,sep="",header=FALSE)
setnames(subjects,"subject")

# add subject and activity columns to training data
trainData <- cbind(activities,trainData)
trainData <- cbind(subjects, trainData)

# row merge the test and training data
combinedData <- rbind(data,trainData)

# read the features file and set column names
features <- read.table(file.path(getwd(),"samsung/features.txt"),sep="",header=FALSE)
setnames(features,c("index","feature"))

# identify all of the features which are either 'mean' or 'std' elements
meanOrStdColumns = grep("((mean|std){1}(freq){0,}[(][)])",as.character(features$feature),ignore.case=TRUE)

# select all of the columns with subject, feature number and mean or std columns into filtered table (adjusting the 
#   the meanOrStdColumns positions to account for the subject and activity columns which have been added to the table)
filteredData <- combinedData[,c(1,2,meanOrStdColumns+3)]
# set the column names for each column
setnames(filteredData,c("subject","activity",as.vector(features[meanOrStdColumns,2])))

# read the activity labels into a table and then use the activity indexes in the filteredData to create a map of activity labels
activityLabels <- read.table(file.path(getwd(),"samsung/activity_labels.txt"),header=FALSE)
activityMapping <- as.vector(activityLabels[filteredData[,2],2])
# replace the activity index values with the activity labels
filteredData[,2] <- activityMapping
# order the filtered data by subject, then activity
filteredData <- filteredData[order(filteredData[,1],filteredData[,2]),]
# first tidy data set
tidyData1 <- filteredData

write.table(tidyData1,file.path(getwd(),"samsung/tidyData1.txt"),row.name=FALSE)

# calculate means by column by subject and activity
tidyData2 <- aggregate(tidyData1[,c(3:81)],by=list(tidyData1$subject,tidyData1$activity),mean)
# create tidy-er column names
tidyData2Names <- c("subject","activity")
for(name in colnames(tidyData2)[3:81]){
  tidyData2Names <- c(tidyData2Names, paste("meanOf.",name,sep=""))
}
# apply names 
setnames(tidyData2,tidyData2Names)
write.table(tidyData2,file.path(getwd(),"samsung/tidyData2.txt"),row.name=FALSE)

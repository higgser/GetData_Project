# Coursera GetData Course Project

# download files to data directory
# source(download_data.R)

# load and merge data sets
setwd("UCI HAR Dataset")
activities <- read.table("activity_labels.txt", stringsAsFactors = FALSE)$V2
features <- read.table("features.txt", stringsAsFactors = FALSE)$V2
features <- gsub("\\)","",gsub("\\(","",features))
features <- sub("BodyBody", "Body",features)
features <- sub("AccJerk", "Jerk",features)
features <- sub("Mag", "",features)

testData <- read.table("test/X_test.txt", col.names = as.character(features))
testSubject <- read.table("test/subject_test.txt")$V1
testActivity <- read.table("test/y_test.txt")$V1

trainData <- read.table("train/X_train.txt", col.names = as.character(features))
trainSubject <- read.table("train/subject_train.txt")$V1
trainActivity <- read.table("train/y_train.txt")$V1
setwd("..")

allData <- rbind(testData, trainData)
allSubject <- c(testSubject, trainSubject)
allActivity <- c(testActivity, trainActivity)
allActivity <- factor(allActivity, labels = tolower(activities))

# subselect and aggregate data
data <- subset(allData, select = grep("(mean|std)(\\.|$)", names(allData)))
tidy <- aggregate(data, list(allSubject,allActivity), FUN=mean)
names(tidy)[1:2] <- c("subject", "activity")

# write tidy data
write.table(tidy, file = "uci_har_tidy.txt", row.names = FALSE)

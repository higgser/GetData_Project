# download the data

downloadUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI_HAR_Dataset.zip"
if (!file.exists("UCI HAR Dataset")) {
    if (!file.exists(zipFile)) {
        download.file(downloadUrl, zipFile, mode="wb")
    }
    unzip(zipFile)
}
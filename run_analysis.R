library(dplyr); library(tidyr); library(reshape2)
setwd(dirname(sys.frame(1)$ofile))
if(!file.exists("dataset.zip") & !file.exists("UCI HAR Dataset")){
      fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileUrl, destfile = "dataset.zip", method = "libcurl")
      unzip("dataset.zip")
      rm(fileUrl)
      file.remove("dataset.zip")
}
setwd("./UCI HAR Dataset/")

features <- read.table("features.txt")

testX <- read.table("test/X_test.txt")
subject_test <- unlist(read.table("test/subject_test.txt"))

trainX <- read.table("train/X_train.txt")
subject_train <- unlist(read.table("train/subject_train.txt"))

subject <- c(subject_test, subject_train)

data <- rbind(testX, trainX)
names(data) <- unlist(features[,2], use.names = F)

rm(features, testX, trainX, subject_test, subject_train)

data <- data[,grep("(mean\\(\\)|std\\(\\))", names(data))]

activity_labels <- read.table("activity_labels.txt")
testY <- read.table("test/Y_test.txt")
trainY <- read.table("train/Y_train.txt")

activity <- sapply(rbind(testY, trainY),
                   function(x) activity_labels[x,2])

data <- cbind(subject, activity, data)

rm(activity_labels, testY, trainY, activity)

data <- data %>%
      rename(Subject = subject) %>%
      rename(Activity = V1)

semi_tidy_data <- arrange(data, Subject, Activity) %>%
      group_by(Subject)

subject_data <- split(semi_tidy_data[,-1], semi_tidy_data$Subject)

subject_data <- lapply(subject_data, 
                       function(subj) {
                             sapply(split(subj[,-1], subj$Activity), 
                                    colMeans)
                       })

tidy_data <- data.frame(matrix(nrow = 0, ncol = 68))

for(i in seq_along(subject_data)){
      subject <- as.data.frame(subject_data[[i]])
      subject$Measurement <- rownames(subject)
      temp <- melt(subject, id="Measurement", 
                   measure.vars = names(subject)[1:6])
      temp <- dcast(temp, variable ~ Measurement)
      temp$Subject <- rep.int(i,dim(temp)[[1]])
      temp <- rename(temp, Activity = variable)
      tidy_data <- rbind(tidy_data, temp)
}

rm(data, semi_tidy_data, subject_data, subject, temp, i)

tidy_data <- select(tidy_data, Subject, Activity, 2:67)

write.table(tidy_data, "../tidy-data-set.txt", row.name = FALSE)
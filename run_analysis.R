# read activity labels and feature names
features <- read.table("data/features.txt")
str(features)
activity_labels <- read.table("data/activity_labels.txt")
str(activity_labels)




# read train and test data into data frames
train_X <- read.table("data/train/X_train.txt")
train_y <- read.table("data/train/y_train.txt")
train_subject <- read.table("data/train/subject_train.txt")


test_X <- read.table("data/test/X_test.txt")
test_y <- read.table("data/test/y_test.txt")
test_subject <- read.table("data/test/subject_test.txt")




# combine train and test data with subject and activity label
activity <- rbind(
        cbind(train_subject, train_y, train_X),
        cbind(test_subject, test_y, test_X))


# rename variable names
names(activity) <- c("Subject.ID", "Activity", features$V2)
length(unique(activity$Subject.ID))
table(activity$Activity.ID)


# recode activity labels
activity$Activity.ID[activity$Activity.ID == 1] <- "WALKING"
activity$Activity.ID[activity$Activity.ID == 2] <- "WALKING_UPSTAIRS"
activity$Activity.ID[activity$Activity.ID == 3] <- "WALKING_DOWNSTAIRS"
activity$Activity.ID[activity$Activity.ID == 4] <- "SITTING"
activity$Activity.ID[activity$Activity.ID == 5] <- "STANDING"
activity$Activity.ID[activity$Activity.ID == 6] <- "LAYING"
activity$Activity.ID <- as.factor(activity$Activity.ID)

# check recoding
unique(activity$Activity.ID)


# remove used objects that are no longer required
rm(list = setdiff(ls(), "activity"))





# Extracts only the measurements on the mean and standard deviation 
indicator <- grepl(pattern = "Subject.ID|Activity|mean|std",
                   x = names(activity),
                   ignore.case = TRUE)
names(activity)[indicator]
activity <- activity[, indicator]




# average of each variable for each activity and each subject
avg <- with(activity, aggregate(activity[3:88], by = list(Subject.ID, Activity), FUN = mean))
names(avg)[1:2] <- c("Subject.ID", "Activity")
table(avg$Activity, avg$Subject.ID)


# export tidy data frame into a .txt file
write.table(x = activity, file = "activity_tidy.txt", row.names = FALSE)
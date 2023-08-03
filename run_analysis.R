# read train and test data into data frames
X_train <- read.fwf("data/train/X_train.txt", widths = 8977, sep = "")
X_test <- read.fwf("data/test/X_test.txt", widths = 8977, sep = "")
dim(X_train)
dim(X_test)


# combine train and test dataset into single df
df <- rbind(X_train, X_test)
dim(df)


# read feature names and add to df
library(stringr)
feature_names <- as.character(readLines(con = "data/features.txt"))
feature_names <- str_remove_all(feature_names, "^[0-9]*\\s")
names(df) <- feature_names
indicator <- str_detect(names(df), pattern = "mean") + 
    str_detect(names(df), pattern = "Mean") + 
    str_detect(names(df), pattern = "std")

df2 <- df[, which(indicator == 1)]
dim(df2)
names(df2)




# read participant labels

test_participant_label <- as.numeric(readLines(con = "data/test/subject_test.txt"))
unique(test_participant_label)

train_participant_label <- as.numeric(readLines(con = "data/train/subject_train.txt"))
unique(train_participant_label)

Participant.Label <- c(train_participant_label, test_participant_label)
table(Participant.Label)

df2 <- cbind(df2, Participant.Label)
View(df2)
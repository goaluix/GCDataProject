# 1. Merges the training and the test sets to create one data set.

library(reshape2)

# Load and merge X Data (Features)
x_train <- read.table("train/X_train.txt")
x_test <- read.table("test/X_test.txt")
x_total <- rbind(x_train, x_test)

# Load and merge Y Data (Activities)
y_train <- read.table("train/Y_train.txt")
y_test <- read.table("test/Y_test.txt")
y_total <- rbind(y_train, y_test)

# Load and merge subject Data
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
subject_total <- rbind(subject_train, subject_test)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

features_labels <- read.table("features.txt")
activities_labels <- read.table("activity_labels.txt")

# Get only those features related with mean or standard deviation
mean_std_columns <- grep("mean|std", features_labels[,2])
#print(dim(mean_std_columns))
x_total_mean_std <- x_total[,mean_std_columns]

# 3. Uses descriptive activity names to name the activities in the data set

# Using the names from activites_labels to rename activities table
y_total[,1] <- activities_labels[y_total[,1],2]

# 4. Appropriately labels the data set with descriptive variable names. 

names(x_total_mean_std) <- features_labels[mean_std_columns,2]
names(y_total) <- "Activity"
names(subject_total) <- "SubjectID"
merged_data <- cbind(subject_total,y_total,x_total_mean_std)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

merged_data_melt <- melt(merged_data, id = c("SubjectID", "Activity"))
final_data <- dcast(merged_data_melt, SubjectID + Activity ~ variable, mean )

write.table(final_data,"avg_data.txt",  row.names = F)

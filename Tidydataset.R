run_analysis.R should do the following:
  #   
  #   1)  Merges the training and the test sets to create one data set.
  # 
  #   2)  Extracts only the measurements on the mean and standard deviation for each measurement. 
  # 
  #   3)  Uses descriptive activity names to name the activities in the data set
  # 
  #   4)  Appropriately labels the data set with descriptive variable names. 
  #   
  #   5)  From the data set in step 4, creates a second, independent tidy data set with the average
  #       of each variable for each activity and each subject.

# Load the needed packages
packages <- c("data.table", "reshape2", "dplyr")
sapply(packages, require, character.only=TRUE, quietly=TRUE)
path <- getwd()

# Give warning to set the working directory if not able to find data files.
projectDataPath <- file.path(path, "project_data")
fileCount <- length(list.files(projectDataPath, recursive=TRUE))
if (fileCount != 28) {
  stop("Please use setwd() to the root of the cloned repository.")
}

# Read in the 'Subject' data
dtTrainingSubjects <- fread(file.path(projectDataPath, "train", "subject_train.txt"))
dtTestSubjects  <- fread(file.path(projectDataPath, "test" , "subject_test.txt" ))

# Read in the 'Activity' data
dtTrainingActivity <- fread(file.path(projectDataPath, "train", "Y_train.txt"))
dtTestActivity  <- fread(file.path(projectDataPath, "test" , "Y_test.txt" ))

# No time to figure out where this, 'works again now' version is
dtTrainingMeasures <- data.table(read.table(file.path(projectDataPath, "train", "X_train.txt")))
dtTestMeasures  <- data.table(read.table(file.path(projectDataPath, "test" , "X_test.txt")))

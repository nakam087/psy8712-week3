# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Data Import and Cleaning
raw_df <- read.csv("~/Desktop/datascience/project_3/data/week3.csv", header = T)
raw_df$timeStart <- as.POSIXct(raw_df$timeStart, format = "%Y-%m-%d %T")
raw_df$timeEnd <- as.POSIXct(raw_df$timeEnd, format = "%Y-%m-%d  %T")
clean_df <-subset(raw_df, timeStart >= "2017-07-01 00:00:00")
clean_df <- subset(clean_df, q6 == "1")

# Analysis
clean_df$timeSpent <- difftime(clean_df$timeEnd, clean_df$timeStart, units = "secs")
hist(as.numeric(clean_df$timeSpent))
frequency_tables_list <- lapply(X=clean_df[,5:14], table)
lapply(X=frequency_tables_list, barplot)
sum((clean_df$q1>=clean_df$q2) & (clean_df$q2==clean_df$q3))
for(table in frequency_tables_list){
  barplot(table)}


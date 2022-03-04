library(tidyverse)

#read the data

raw_data <- read_csv("data/HTRU_2.csv", col_names = FALSE)

#adding column names manually

raw_data <- rename(raw_data,
       Mean_IP = X1,
       SD_IP = X2,
       ExcessKurtosis_IP = X3,
       Skewness_IP = X4,
       Mean_DS = X5,
       SD_DS = X6,
       ExcessKurtosis_DS = X7,
       Skewness_DS = X8,
       Class = X9)

#removing rows with missing values for the first 8 columns (row count remains the same meaning that there aren't any missing values)

na.omit(raw_data, cols=c("Mean_IP", "SD_IP", "ExcessKurtosis_IP", "Skewness_IP", "Mean_DS", "SD_DS", "ExcessKurtosis_DS", "Skewness_DS"))

#create another table where you include the mean next to each variable (copy paste my code and apply it to the training data)

mean_data <- raw_data %>% 
    mutate(AVG_MeanIP = mean(Mean_IP), .after = Mean_IP) %>% 
    mutate(AVG_SDIP = mean(SD_IP), .after = SD_IP) %>%    
    mutate(AVG_ExcessKurtosisIP = mean(ExcessKurtosis_IP), .after = ExcessKurtosis_IP) %>%
    mutate(AVG_SkewnessIP = mean(Skewness_IP), .after = Skewness_IP) %>%
    mutate(AVG_MeanDS = mean(Mean_DS), .after = Mean_DS) %>%
    mutate(AVG_SDDS = mean(SD_DS), .after = SD_DS) %>%
    mutate(AVG_ExcessKurtosisDS = mean(ExcessKurtosis_DS), .after = ExcessKurtosis_DS) %>%
    mutate(AVG_SkewnessDS = mean(Skewness_DS), .after = Skewness_DS)

mean_data

# num_obs <- nrow(raw_data)
# raw_data %>% 
#    group_by(Class) %>% 
#    summarize(
#        count = n(),
#        percentage = n() / num_obs * 100 
#   ).

#i can add visualizations after we create the training data!

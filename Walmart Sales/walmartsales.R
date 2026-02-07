wallmartsales <- read.csv("Walmart_Sales.csv")

library(tidyr)
library(lubridate)
library(dplyr)

#cleaning date format
wallmartsales <- wallmartsales %>% mutate(Date = dmy(Date))
head(wallmartsales,10)

#Temperature, year and month category 
wallmartsales <- wallmartsales %>% mutate(,Temp_Cat = case_when(
  Temperature < 45 ~ "Cold",
  Temperature >= 45 & Temperature < 75 ~ "Mild",
  TRUE ~ "Hot"
))

#Holiday insight
holiday_analysis <- wallmartsales %>%
  group_by(Holiday_Flag) %>%
  summarise(Avg_Weekly_Sales = mean(Weekly_Sales))
holiday_analysis

#correlation analysis
numeric_data <- wallmartsales %>% select(Weekly_Sales,Temperature,Fuel_Price,CPI,Unemployment)
numeric_data
corr_matrix <- cor(numeric_data, use= "complete.obs")

# final delivery
write.csv(wallmartsales, "Walmart_Processed_for_Tableau.csv")


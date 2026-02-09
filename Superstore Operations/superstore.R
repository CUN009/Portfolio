library(dplyr)
library(tidyr)
library(readr)
library(readxl)
library(writexl)
library(forecast)
library(arules)

superstore <- "Superstore.xlsx"

orders <- read_xlsx(superstore, sheet = "Orders")
returns <- read_xlsx(superstore, sheet = "Returns")
people <- read_xlsx(superstore, sheet = "People")

superstore_new <- orders %>% left_join(returns, by = "Order ID") %>% left_join(people, by = "Region")

superstore_new <- superstore_new %>% mutate(Returned = ifelse(is.na(Returned), "No", Returned) )

#setting up K means
superstore_new <- superstore_new %>% group_by(`Customer ID`) %>% mutate(Total_sales = sum(Sales), Total_profit = sum(Profit), return_rate = sum(ifelse(Returned == "Yes",1,0))/n()) %>% ungroup()
cluster_input <- superstore_new %>% select(Total_sales, Total_profit, return_rate) %>% scale()
set.seed(123)
k_result <- kmeans(cluster_input, centers = 4, nstart = 25)
superstore_new$persona_cluster <-  as.factor(k_result$cluster)

#summary of missing data
colSums(is.na(superstore_new))

write_xlsx(superstore_new, "superstore_operations.xlsx")

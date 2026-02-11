# Global Superstore: Strategic Insights from Operations to Predictive Modeling
*(Tools used : R, Tableau, Excel, Gemini)*

## Abstract

The project analysis of global superstore provides deep insight into it's operations, customer insights and predictive analytics using forecasting and K-means clustering. The suite provides hollistic view of data and provides insights into superstore business. The project addresses these questions :
  - Which regions provide max-profit and in which product category ?
  - Which manager is performing vs under-performing and finding why ?
  - Identifying which regions have highest return rate and for which category ?
  - What will be demand forecasted in coming Q4 2018 ?
  - Finding out customer persona causing profit leak.

## Data cleaning and technical methodology
<img width="1341" height="608" alt="Screenshot 2026-02-11 at 14 41 27" src="https://github.com/user-attachments/assets/4f1245f7-9fa6-450d-8bf5-3267c552dcb7" />

*Fig: R scipt used for data processing*

Library used: dplyr, tidyr, readr, readxl, writexl

The superstore dataset consists of three worksheets, namely Orders, Return, and People. To link these different worksheets into one I first assigned worksheets to their variables to make left joining by Order ID easier. After left joinging them, the Returns column only consists of "Yes" variable. To fill remaining empty spaces under returns columns I used ifelse statement to replace NULL cells with "No". This is to ensure that no empty cells exists. 

The return rate column was added to do K-means cluster analysis and create a graoh with top 10 customers with hgihest return rate. To do this I created new column using mutate and used the formula of ifelse to calculate only "Yes" labelled returns. Ungroup was used to delink Order ID from remaining columns as it can get included in kmeans function giving out error.

A new variable cluster input is used to select total sales, profit and return rate with scale function for kmeans. Here scale was used to normalize all the variables. Next kmeans was applied with 4 cluster and 25 retries to get accurate results. The identified clusters are then stores to persona_cluster as factors using as.factor. 

To check for empty columns colSums(is.na(superstore_new)) is used to detect for any NULL values

The file is finally exported using write xl function. 

## Dashboard findings and interpretations
### Dashboard 1: Analysis on store operations throughout America
<img width="1663" height="966" alt="Screenshot 2026-02-09 at 16 51 07" src="https://github.com/user-attachments/assets/24c3aaec-9b42-4a82-9fce-53f3013aa769" />

*Fig: Executive operation*

The dashboard aims to provide **Global Superstore's** summary of it's operation across America. This interactive dashboard consists of main KPI's to show total sales, profit and profit ratio acorss all states using interactive map and manager performance table. It can be concluded that the state of California is leading interms of sales whereas the state of North Dakota records the lowest sale. By observing the map it can be said that western side of the country is the most profitable, whereas central part of America is least performing. 

Now coming onto manager performance Anna leads in terms on sales and she is also responsible for western states such as California reflecting. Whereas central america under Kelly's leadership displays lowest sales and profit. The states under her have lower sales and usually less number of different products offered states such as North Dakota, Iowa and Kansas despite having positive profit are considerably lower than states like California, where California has 920 times the profit of North Dakota. This can be caused by less number of different products being provided by the state outlets.

The treemap provides sales size with profit as colours, darker green means profitable and vice versa. It can be said that in terms of sales size both technology and furniture are similar, but in terms of profitability technology, copiers and accessories is leading. Whereas bookcases and tables are loss making sub categories under furniture.

### Dashboard 2: Analysing customer and operations friction
<img width="1659" height="968" alt="Screenshot 2026-02-09 at 16 51 26" src="https://github.com/user-attachments/assets/576c61c7-86f0-4231-88e1-bd5875ef1c16" />

*Fig: Customer and Operation friction*

The dashboard aims to bridge a gap between operations and customer, where how operational inefficiencies can drive return rate. By correlation between average return rate and total time it took to ship order it can be concluded that it is negatively correlated due to downward slope. Concluding that higher delays don't means higher return rate. 

Coming to subcategory and region rate heatmap based on return rate, it indicates that westen region had the highest return rates, whereas central is considerably lowest. In previous analysis we observed that west had better sales and profit than central. By comparing these we can conclude that higher sales can also lead to higher returns, making sales and return positively correlated. To maximize the profit for western region, we can lower return rate by adopting certain tactics to minimize returns.

From the donut chart we can say that Consumer segment is the major driver of sales throught the region. 

### Dashboard 3: Conducting predictive and trends analysis 
<img width="1666" height="971" alt="Screenshot 2026-02-09 at 16 51 52" src="https://github.com/user-attachments/assets/e87429e3-4074-4870-9bb0-4c20e3c68c55" />

*Fig: Predictive analysis*

The top 10 customer with highest return rates give names of customers with highest return rates. These customer can be analyzed to take steps to reduce their problems or potentially exclude them.


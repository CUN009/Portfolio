# Global Superstore Strategic Business Insights & Customer Analytics
*(Tools utilized = R, Excel, Tableau)*
## Executive Summary



## Dataset Cleaning 



### Library Used 
- Tidyr = for tidying up data
- Lubridate = to format all date
- Dplyr = for data manipulation

### Process of tidying up data
1. Import of walmart_sales.csv using read.csv
2. Installing of packages using "install.packages()" and accessing the library using library function.
3. Formatting the date format to be consistent using lubridate function and use of pipe functions to setup the workflow of adjusting date.
4. Creation of temperature category using case_when function.
5. Find the number of holidays and non-holiday flag using summarize function.
6. For chart and graph purposes used correlation matrix of all variable to compare and decide graphs and charts.
7. Final delivery of given data as write.csv to export editted excel. 

## Dashboard Preview
<img width="1680" height="1050" alt="Screenshot 2026-02-05 at 12 40 07" src="https://github.com/user-attachments/assets/fd44a4fa-bf07-4496-bc5a-8805826ce4ef" />

## About dashboard

### Main KPIs

- Number of Stores = Total number of stores owned by walmart
- Total Revenue = Total revenue earned by all stores
- Peak Period and Standard Period = Total count of holidays and non-holidays

### Chart and graphs used

- Best month for sales = A heatmap to compare revenue earned during that moonth in different temperatures.
- Effect of peak periods on sales = Boxplot to compare the total sales by date in holidays vs non-holidays.
- Store Economics = A cause and effect analysis of how CPI influence store revenue. The size of circles indicate total revenue of stores, bigger the cirlce higher will be the revenue.
- Temperature vs sales = A correlation between sales and temperature assisted by a trend line.

## Key Findings

1. The analysis revealed that "mild cold" temperature is the ideal spot for sales maximization. As weather went from cold to mild the number of sales increased likewise, it can be proven by heatmap fo sales by month where mild temperature had most number of boxes in terms of sales. Indicating that mild cold or mild weather is most favourable temperature. Whereas hot temperature had negatuve correlation with sales leading to decrease in sales.
2. It is proven that holiday sales are effecive and are on par with non holidays sales. As the candle is in the upper side of peak period it indicates that the business was profitable during this time of 450 days vs 5,985 days of standard.
3. The store economics analysis identified stores which are at risk or struggling. Under at risk category the macroeconomic factor of high CPI (Consumer Price Index) shows regional inflaction pressure causing declinging sales. Whereas struggling category indicates that despite facing lower inflation the stores are struggling with lower sales. Hence these stores require special operational attention to address their issues.

## Strategic recommendations

1. As observed hot temperature has negative correlation with temperature, as season changes from mildly cold to hot number of sales decreases. One possible way to circumvent this drop in sales is by providing summer sales or summer clearence offers to drive sales in this period.
2. For at risk category which has high CPI and low sales remedial steps such as price matching can be done to ensure sales stability. Whereas for struggling stores it can be said that on ground stores are struggling due to local competitor or store operational problems.
3. Even if holiday periods are proven to be working as intended they are widely inconsistent, some stores are still struggling, an operational gap review can be done to address this issue.

## __Group 6 Project 4: Inventory Sales Forecasting__ 

__Project 4 Group Members:__

* Zachary Corbett
* Victor Donstov
* Sara Parveen
* Set Z

__Project Overview and Purpose of Data Model__

* For this project, we focused on improving the inventory planning process of an anonymous company.
* This anonymous company acts as a product distributor by purchasing office products from manufacturers, holding them and then reselling them to its business customers.
* By analyzing their office products' purchase, sales and product details data, we created a data model that makes predictions about the sales quantities for different product categories to be ordered in the future. 
* Knowing how much will be sold of each product category in the future can help determine how much of each product category should be kept in stock at any given time.
* Having a tool that assists in determining the ideal amount of inventory to have in stock at any given time is crucial to:<br />

  - meet customer demand and ensure customer satisfaction<br />
  - avoid having too much inventory which can lead to unnecessary storage and handling costs<br />
  - avoid stockouts which can result in sales loss<br />
  - maintain high profitablity<br />

__Target Audience of Data Model__

The target audiences for this model are:<br />

  - the anonymous company whose data was analyzed<br />
  - all product sales planning, supply chain, and procurement professionals<br />

__Data Sources__

* The data used for this project comes in the form of CSV files obtained from the anonymous company. 
* The original data has been anonymized for the purposes of this project. 
* The CSVs have 5-years worth of data (2018 to 2022) for Purchase, Sales and Product Details.
      
__Data Hosting__ 

* Amazon AWS for hosting the CSV files 
* The model utilizes data retrieved from Pysark SQL 

__Database Creation__

* To help setup the database, an ERD schema was created as shown below:
 ![image](https://github.com/saraparveen26/project4-group6/assets/120427432/a322323f-8883-4384-9df9-e2639db790ca)

* Amazon AWS feeds DBS databricks  

__Data Cleaning__      

* The ETL performed using PySpark by completing the following steps:
    1) Loading and merging dataframes
    2) Selecting and filtering the columns to be used
    3) Converting the columns to the appropriate data type 
    4) Groupings the data to get yearly and monthly aggregates

%%%%%%%%%%%@@@@* The ETL process is documented in the Databricks notebook which can be viewed here:  

__Data Model Description__

We have used a time series model to make sales volumne predictions. The machine learning model is called SARIMAX (Seasonal Auto-Regressive Integrated Moving Average with eXogenous factors) which is an extension of the ARIMA class of models.

For predicting future sales volumes of each product category, we applied the SARIMAX model which takes into account the past experience (autoregressive model) and seasonality patterns. The model includes the following parameters:

p - order of the autoregressive part
d - degree of first differencing involved
q - order of the moving average part
P, D, Q - all previous characteristics with seasonal factors
s - seasonal length in the data

The following steps were completed to make predictions about overall sales volume using the SARMAX model. 

**NOTE: The following charts are based on data from all 10 product categories. Similar steps were performed for each individual product category and can be viewed by selecting the filter in the Forecasting Dashboard:  @@@@@@@&&&&&&&&&&

1.	Identified the stationarity and difference of the time series:
Based on the results of the Dickey-Fuller test, the p-value = 0.11034. As the p-value is greater than 0.05, we can suggest that our time series is non-stationary.  
Analyzing the ADF (Augmented Dickey-Fuller) chart, we can suggest the parameter p = 0 since coefficients of autocorrelation slowly decrease over time lags. In other words, autocorrelation is not significant.

![image](Images/Dashboard/Analysis/sales_analysis.png)


2.	Suggested the initial parameters:
Since our series is not stationary, for further analysis, we need to make the time series stationary using the differencing method:  lag=1: y_dif(t+1)=y(t+1)- y(t) .

After applying the differencing method, the p-value of the Dickey-Fuller test equals 0.00000, so we can imply that the data is now stationary. We can suggest the other parameters: q=1 (as the first lag has a spike).

![image](Images/Dashboard/Analysis/sales_difference.png)


We can see little spikes at lag 12 and 24 on ACF (AutoCorrelation Function), so P can be equal to 1.
By decomposition of the time series, we can see the seasonal trend. We are using s =12 because we are using monthly sales volume data for predictions.

 ![image](Images/Dashboard/Analysis/sales_trend.png)


3.	Generated the final parameters for the model: 
In order to find the best parameters for our model, we generated different series of parameters (p, d, q, P, D, Q). The parameters used had the lowest AIC (Akaike’s Information Criterion) scores.

4.	Ran the SARIMAX model:

The SARIMAX model generated monthly sales volume predictions for the next 12-month period.

![image](Images/Dashboard/Analysis/sales_predictions.png)

We can imply that the model fits well based on the analysis of residuals.
   
![image](Images/Dashboard/Analysis/sales(1_0_1_0_1).png)

__Data Model Results__

  * train and testing
  * Overall model performance is printed or displayed at the end of the script
   * The model demonstrates meaningful predictive power at least 75% classification accuracy or 0.80 R-squared.
   
__Visulizations and Dashboard Views__

  * Databricks was utilized to created both the visualizations and dashboards.
  * Two dashboards were created. The first dashboard showed visulaizations related to historical inventory sales volume data and the second dashboard showed visualizations that leveraged the data model created to predict future inventory sales volumnes.
  * __Here are screenshots of the historical dashboard:__<br />
  
    **Overall view of dashboard:<br />
        ![image](https://github.com/saraparveen26/project4-group6/assets/120427432/3e64a55f-3a69-43c3-ac98-0c62376706c7)

    **Word Cloud Chart #1 is based on Product Category Sales Volume<br />
        ![image](https://github.com/saraparveen26/project4-group6/assets/120427432/170fdd8e-5e4d-44d8-b0ff-6c0f1b7bc97d)

    **Word Cloud Chart #2 is based on Monthly Sales Volumne<br />
        ![image](https://github.com/saraparveen26/project4-group6/assets/120427432/d372b8f4-7a40-40f8-a0a6-4df4c4a8e1ac)

    **Revenue Breakdown Combo Chart (Bar graph and Line graph)<br />
        ![image](https://github.com/saraparveen26/project4-group6/assets/120427432/c12d212d-e77b-46b7-88e5-b0f7c11079d0)
        
    **Total Profit by Month (Stacked Bar graph)<br />
        ![image](https://github.com/saraparveen26/project4-group6/assets/120427432/d155b821-abc8-40e4-acf0-1ff66443d9f1)

    **Total Profit Table<br />
        ![image](https://github.com/saraparveen26/project4-group6/assets/120427432/dcdd8178-27f1-4d85-bb4b-d6439f16bbaa)

    **Total Sales Volumee by Month (Area graph)<br />
        ![image](https://github.com/saraparveen26/project4-group6/assets/120427432/bb486c66-c26e-445f-a172-778b3c9398af)

    **Total Sales Volume Table<br />
        ![image](https://github.com/saraparveen26/project4-group6/assets/120427432/e9c6d55a-8430-443b-8afc-a5d26eaf0586)

    **Sales Volumne vs Profit (Bubble Size = Cost) (Bubble Chart)<br />
        ![image](https://github.com/saraparveen26/project4-group6/assets/120427432/457a86f7-a486-4116-99cc-262f92ebbb13)

    **Profit vs Cost Combo Chart (Bar graph and Line graph)<br /> 
        ![image](https://github.com/saraparveen26/project4-group6/assets/120427432/cf192790-10de-420f-afba-4c7bfa6aed32)

  * __Here are screenshots of the forecasting dashboard:__<br />

__Challenges and Limitations__

1) Back-End<br />
      - Invoice Date Formatting
      - Product No. vs Catergory
      - Assuming unlimited inventory space
      
2) Front-End
      - Truncated data in Databricks
      - Mutiple filter limitations in Databricks

__Conclusion__

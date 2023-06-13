# Group 6 Project 4: Sales Volume Forecasting

## Project 4 Group Members:

* Zachary Corbett
* Victor Donstov
* Sara Parveen
* Set Z


## Project Overview and Purpose of Data Model

* For this project, we focused on improving the inventory planning process of an anonymous company.
* This anonymous company acts as a product distributor by purchasing office products from manufacturers, holding them and then reselling them to retailers and end-users.
* By analyzing their office products' purchases, sales and product details data, we created a data model that makes predictions of predicted sales quantities for each product category. 
* Knowing how much will be sold of each product category in the future can help determine how much of each product category should be ordered or kept in stock at any given time.
* Having a tool that assists in determining the ideal inventory levels at any given time is crucial to:<br />

  - meet customer demand and ensure customer satisfaction<br />
  - avoid having too much inventory which can lead to unnecessary storage and handling costs<br />
  - avoid stockouts which can result in sales loss and/or fines from customers<br />
  - maintain high profitability<br />


## Target Audience of Data Model

The target audiences for this model are:<br />

  - the anonymous company whose data was analyzed as well as other distributors, manufacturers or retailers that depend on predicting future sales for procurement and res<br />
  - all product sales planning, supply chain, and procurement professionals<br />


## Data Sources

* The data used for this project comes in the form of CSV files obtained from the anonymous company. 
* The original data has been anonymized for the purposes of this project. 
* The CSVs contain 5-years worth of data (2018 to 2022) for Purchases, Sales as well as Product Details.


## Data Hosting

* The raw CSV data files are hosted on an S3 Bucket through Amazon AWS
* The database schema was stored in the [Databricks File System (DBFS)](https://docs.databricks.com/dbfs/index.html) through a [Databricks Community Edition Account](https://www.databricks.com/product/faq/community-edition). This file system is ultimately hosted on AWS without charges for computing ([Community Edition](https://docs.databricks.com/getting-started/community-edition.html)).


## Database Creation and Data Cleaning

* To help setup the database, an ERD schema was created as shown below:

 ![image](Images/ERD.png)

* The schema was defined using [PySpark SQL](https://sparkbyexamples.com/pyspark/pyspark-sql-with-examples/) in the Databricks notebook: ["Data Management Python"](https://github.com/saraparveen26/project4-group6/blob/main/Notebooks_Databricks/Data%20Management%20Python.ipynb)
* Once the schema is defined, the raw CSV files are read in from the S3 Bucket and transformed to meet the Table requirements defined by the schema.
* The ETL performed using PySpark by completing the following steps:
    1) Loading and merging DataFrames
    2) Selecting and filtering the columns to be used
    3) Converting the columns to the appropriate data type 
    4) Groupings the data to get yearly and monthly aggregates
    The ETL process is documented in the Databricks notebook which can be viewed here: ["ETL_Data_Cleaning"](https://github.com/saraparveen26/project4-group6/blob/main/Notebooks_Databricks/ETL_Data_Cleaning.ipynb) as an export of the ETL script.
* The transformed data is then inserted into their respective Tables.
* Due to the limitations of the free [Community Edition](https://www.databricks.com/product/faq/community-edition) tier of Databricks, the ["Data Management Python"](https://github.com/saraparveen26/project4-group6/blob/main/Notebooks_Databricks/Data%20Management%20Python.ipynb) and ["ETL_Data_Cleaning"](https://github.com/saraparveen26/project4-group6/blob/main/Notebooks_Databricks/ETL_Data_Cleaning.ipynb) Databricks notebooks are run whenever a new [Cluster](https://docs.databricks.com/clusters/index.html) is connected.


## Data Model Description

* The model utilizes data retrieved from Pysark SQL

We have used a time series model to make sales volumne predictions. The machine learning model is called SARIMAX (Seasonal Auto-Regressive Integrated Moving Average with eXogenous factors) which is an extension of the ARIMA class of models.

For predicting future sales volumes of each product category, we applied the SARIMAX model which takes into account the past experience (autoregressive model) and seasonality patterns. The model includes the following parameters:<br />

p - order of the autoregressive part<br />
d - degree of first differencing involved<br />
q - order of the moving average part<br />
P, D, Q - all previous characteristics with seasonal factors<br />
s - seasonal length in the data<br />

The following steps were completed to make predictions about overall sales volume using the SARMAX model. 

**1.	Identified the stationarity of the time series:**

Based on the results of the Dickey-Fuller test, the p-value = 0.11034. As the p-value is greater than 0.05, we can suggest that our time series is non-stationary.  

Analyzing the ADF (Augmented Dickey-Fuller) chart, we can suggest the parameter p = 0 since coefficients of autocorrelation slowly decrease over time lags. In other words, autocorrelation is not significant.

![image](Images/SARIMAX/Analysis/Sales_autocorr.png)

**2.	Suggested the initial parameters:**

Since our series is not stationary, for further analysis, we need to make the time series stationary which was completed using the differencing method:  lag=1: y_dif(t+1)=y(t+1)- y(t) .

After applying the differencing method, the p-value of the Dickey-Fuller test equals 0.00000, so we can imply that the data is now stationary. We can suggest the other parameters: q=1 (as the first lag has a spike).

![image](Images/SARIMAX/Analysis/Sales_diff_autocorr.png)

We can see little spikes at lag 12 and 24 on ACF (AutoCorrelation Function), so P can be equal to 1.
By decomposition of the time series, we can see the seasonal trend. We are using s =12 because we are using monthly sales volume data for predictions.

 ![image](Images/SARIMAX/Analysis/Sales_decompos.png)

**3.	Generated the final parameters for the model:**

In order to find the best parameters for our model, we generated different series of parameters (p, d, q, P, D, Q). The parameters chosen were based on the lowest AIC (Akaike’s Information Criterion) scores.

![image](Images/SARIMAX/Analysis/parameters.png)

**4.	Ran the SARIMAX model:**

The SARIMAX model generated monthly sales volume predictions for the next 12-month period. The predictions for the overall sales volume has a Mean Absolute Percentage Error of 12.72%.

![image](Images/SARIMAX/Predictions/Sales.png)

We can imply that the model fits well based on the analysis of residuals.
   
![image](Images/SARIMAX/Analysis/Sales_err.png)


**Attempt to Optimize the Model**

The charts in the section above are based on data from all 10 product categories. Similar steps were performed for each individual product category and can be viewed in the [Images](Images/SARIMAX/) folder. These visualizations showing Analysis and Predictions are based on the optimized model. The optimization was attempted by selecting different parameters for the order to try and improve the accuracy.

The results of the first attempt at implementing the model can be viewed in the [Images](Images/SARIMAX/Old%20Model/) folder/

Following tables shows a comparison of the Mean Absolute Percentage Errors for the two attempts:

![image](Images/SARIMAX/model_optimization_attempt.PNG)


## Data Model Results

  * The model was trained on first four years of data (2018 - 2021). This time series model creates an equation which can then be used to test against the current data and predict future sales volumes.
  * Although the model generated good results for the overall sales but it did not have good accuracy for some product categories even after the optimization.
   

## Visulizations and Dashboard Views

  * Databricks was utilized to created both the visualizations and the dashboards.
  * Two dashboards were created: One for the historical data (2018-2022), and the second for the Predicted Sales data (2023) which was extracted from the SARIMAX model.

  **Dashboard 1: Historical data (2018-2022)**
  * This dashboard shows visulaizations related to historical inventory sales volume, profits and costs.
  * __Here are screenshots of the dashboard:__<br />
  
    ***Overall view of dashboard:***

    ![image](Images/Dashboard_Historical/image_1.png)

    ***Word Cloud Chart #1 is based on Product Category Sales Volume***

    ![image](Images/Dashboard_Historical/image_2.png)

    ***Word Cloud Chart #2 is based on Monthly Sales Volume***

    ![image](Images/Dashboard_Historical/image_3.png)

    ***Revenue Breakdown (Stacked Bar graph)***

    ![image](Images/Dashboard_Historical/image_4.png)
        
    ***Total Profit by Month (Stacked Bar graph)***

    ![image](Images/Dashboard_Historical/image_5.png)

    ***Total Profit Table***

    ![image](Images/Dashboard_Historical/image_6.png)

    ***Total Sales Volumee by Month (Area graph)***

    ![image](Images/Dashboard_Historical/image_7.png)

    ***Total Sales Volume Table***

    ![image](Images/Dashboard_Historical/image_8.png)

    ***Sales Volumne vs Profit (Bubble Size = Cost) (Bubble Chart)***

    ![image](Images/Dashboard_Historical/image_9.png)

    ***Profit vs Cost Combo Chart (Bar graph and Line graph)***

    ![image](Images/Dashboard_Historical/image_10.png)


**Dashboard 2: Predictions data (2023)**
  * This dashboard shows visulaizations related to predicted sales volume, margin error and mean absolute percentage error.
  * __Here are screenshots of the dashboard:__<br />
  
    ***Overall view of dashboard:***

    ![image](Images/Dashboard_Predictions/image_1.png)

    ***Predicted Sales Quantity Table***

    ![image](Images/Dashboard_Predictions/image_2.png)

    ***Margin Error Table***

    ![image](Images/Dashboard_Predictions/image_3.png)

    ***Mean Absolute Percentage Error Table***

    ![image](Images/Dashboard_Predictions/image_4.png)
        
    ***Mean Absolute Percentage Error vs AIC Scores (Bubble Size = Predcited Sales Quantity) (Bubble Chart)***
    
    ![image](Images/Dashboard_Predictions/image_5.png)


## Limitations and Assumptions

  1- There are 134 different product SKUs within the original dataset which can be classified into 10 unique product categories. For the purposes of our analysis and predictive model, we decided to focus on the 10 unique product categories to avoid scope creep.
      
  2- We have assumed that we have unlimited warehouse space to store the products in order to meet the sales demand.
      
  3- We have assumed we have unlimited resources and budget to order the ideal sales volume.
      
  4- We assumed there are no minimum order quantities.


## Challenges
      
  1- We used Databricks for ETL which truncates the data to 10,000 rows. In order to fix this issue, we used groupings based on yearly and monthly data for each product category which reduced the number of rows to 592.
      
  2- The dashboards in Databricks do not have a default option of adding filters. We used Databricks Widgets to create filters in order to filter by year and by each product category which makes it a more dynamic dashboard.
  
  3- The dashboards filters in Databricks do not carry over into the HTML file that is exported from the Databricks dashboards.


## Conclusion



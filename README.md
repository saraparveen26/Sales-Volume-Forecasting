## __Group 6 Project 4: Inventory Sales Forecasting__ 

__Project Overview and Purpose of Data Model__

* For this project, we focused on improving the inventory planning process of an anonymous company.
* This anonymous company acts as a product distributor by purchasing office products from manufacturers, holding them and then reselling them to its business customers.
* By analyzing their office products' purchase, sales and product details data, we created a data model that makes predictions about the sales quantity for each product in the future. 
* Knowing how much will be sold of each product in the future can help determine how much of each product should be kept in stock at any given time.
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

* To help setup the data cleaning and  database parameters an ERD schema was created as shown in the screenshot below:
 ![image](https://github.com/saraparveen26/project4-group6/assets/120427432/a322323f-8883-4384-9df9-e2639db790ca)

* Amazon AWS feeds DBS databricks  

__Data Cleaning__      

* PySpark for ETL

__Data Model Description__

The data model is a time series model. 
The model uses the following methods:

* Moving Averages
* Exponential Smoothing
* AutoCorrelation Function (ACF)
* Partial AutoCorrelation Function (PACF)
* AutoRegressive model
* SARIMAX (Machine Learning model)

  Description of Python script that initializes, trains, and evaluates a model:
  
  Desciption of model optimization and evaluation process showing iterative changes made to the model and the resulting changes in model performance is documented in either a CSV/Excel table or in the Python script itself

__Data Model Results__

   * Overall model performance is printed or displayed at the end of the script
   * The model demonstrates meaningful predictive power at least 75% classification accuracy or 0.80 R-squared.
   
__Visulizations and Dashboard Views__

  * Databricks was utilized to created both the visualizations and dashboards.
  * Two dashboards were created. The first dashboard showed visulaizations related to historical inventory sales volume data and the second dashboard showed visualizations that leveraged the data model created to predict future inventory sales volumnes.
  * Here are screenshots of the historical dashboard:<br />
  
    Overall dashboard view:<br />
        
    Word Cloud Chart #1 is based on Product Category Sales Volume<br />
        ![image](https://github.com/saraparveen26/project4-group6/assets/120427432/170fdd8e-5e4d-44d8-b0ff-6c0f1b7bc97d)

    Word Cloud Chart #2 is based on Monthly Sales Volumne<br />
        ![image](https://github.com/saraparveen26/project4-group6/assets/120427432/d372b8f4-7a40-40f8-a0a6-4df4c4a8e1ac)

    Revenue Breakdown Combo Chart (Bar graph and Line graph)<br />
        ![image](https://github.com/saraparveen26/project4-group6/assets/120427432/c12d212d-e77b-46b7-88e5-b0f7c11079d0)
        
    Total Profit by Month<br />
        
    Total Profit Table<br />
        
    Total Sales Volumee by Month (Bar graph)<br />
        
    Total Sales Volume Table<br />
        
    Sales Volumne vs Profit (Bubble Size = Cost) (Bubble Chart)<br />
        
    Profit vs Cost Combo Chart (Bar graph and Line graph)<br /> 
        ![image](https://github.com/saraparveen26/project4-group6/assets/120427432/cf192790-10de-420f-afba-4c7bfa6aed32)

  - Forecasting Dashboard

__Challenges and Limitations__

1) Back-End<br />
      - Invoice Date Formatting
      - Product No. vs Catergory
      - Assuming unlimited inventory space
      
2) Front-End
      - Truncated data in Databricks
      - Mutiple filter limitations in Databricks

__Conclusion__

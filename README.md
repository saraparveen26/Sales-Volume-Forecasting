## __Group 6 Project 4: Inventory Sales Forecasting__ ##<br />

__Project Overview__

For this project,  to cr an efficient supply chain process for an anonymous company by analyzing the Purchase and Sales data for office products. This company acts as a distributor by purchasing the office products from manufacturers, holding them and then reselling them to its business customers. 

The purpose of the project deliverable is to add more automation to the product ordering process based on the demand, inventory at hand, and shipment times. Another objective is to help identify the products that are highest contributor to overall sales and prioritize them to increase the company’s overall profitability. Time series model.

__Purpose of Data Model__

This model makes predictions about the order quantities for each product available to customers to achieve the highest profitability.

Having a tool that determines the ideal amount of inventory to have at any given time is crucial to:
      1) meet customer demand and ensure customer satisfaction
      2) avoid having too much inventory which can lead to unnecessary storage and handling costs
      3) avoid stockouts which can results in loss in sales


__Target Audience of Data Model__

The target audiences for this model are sales, supply chain, logistics fulfillment and procurement professionals.

__Data Sources__

* The data used for this project comes from CSV files obtained from the company. 
* The original data has been anonymized for the purposes of this project. 
* The CSVs have 5-years worth of data (2018 to 2022) for Purchase, Sales and Products.
      
__Data Cleaning__      

* PySpark for ETL
     
__Data Hosting__ 

* Amazon AWS for hosting the CSV files 
* The model utilizes data retrieved from Pysark SQL
* Amazon AWS feeds DBS databricks for purposes of visulizations  

__Data Model Description__

The data model uses a time series analysis. This analysis uses the following methods:

* Moving Averages
* Exponential Smoothing
* AutoCorrelation Function (ACF)
* Partial AutoCorrelation Function (PACF)
* AutoRegressive model
* SARIMAX (Machine Learning model)

  Description of Python script that initializes, trains, and evaluates a model:
  
  Desciption of model optimization and evaluation process showing iterative changes made to the model and the resulting changes in model performance is documented in either a CSV/Excel table or in the Python script itself

__Model Results__

   * Overall model performance is printed or displayed at the end of the script
   * The model demonstrates meaningful predictive power at least 75% classification accuracy or 0.80 R-squared. (5 points)
   
__Visulizations and Dashboard Views__

  - Databricks

__Challenges__

1) Back-End
       - Invoice Date Formatiing


3) Front-End
      - Truncated data in Databricks
      - Mutiple filter limitations in Databricks

__Conclusion__

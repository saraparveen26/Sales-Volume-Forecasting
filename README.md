## __Group 6 Project 4: Inventory Sales Forecasting__ ##<br />

__Project Overview and Purpose of Data Model__

* For this project, we aimed to improve the inventory planning of an anonymous company.
* This company acts as a product distributor by purchasing office products from manufacturers, holding them and then reselling them to its business customers.
* By analyzing their purchase, sales and product details data for office products, we created a data model that makes predictions about how much of each product will be sold in the future. 
* Knowing how much will be sold of each product in the future can help determine how much of each product should be kept in stock at any given time.
* Having a tool that determines the ideal amount of inventory to have at any given time is crucial to:<br />

 - meet customer demand and ensure customer satisfaction<br />
 - maintain high profitablity<br />
 - avoid having too much inventory which can lead to unnecessary storage and handling costs<br />
 - avoid stockouts which can result in loss in sales<br />

__Target Audience of Data Model__

The target audiences for this model are:<br />

      1) the anonymous company whose data was analyzed<br />
      2) all product sales planning, supply chain, and procurement professionals.<br />

__Data Sources__

* The data used for this project comes from CSV files obtained from the anonymous company. 
* The original data has been anonymized for the purposes of this project. 
* The CSVs have 5-years worth of data (2018 to 2022) for Purchase, Sales and Product Details.
      
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

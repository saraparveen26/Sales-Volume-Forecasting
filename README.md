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

  - Databricks
  - Historical Dashboard
  - Forecasting Dashboard

__Challenges and Limitations__

1) Back-End<br />
      - Invoice Date Formatting
      - Product No. vs Catergory
      - Assumming unlimited inventory space
      
2) Front-End
      - Truncated data in Databricks
      - Mutiple filter limitations in Databricks

__Conclusion__

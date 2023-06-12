-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Products" (
    "Part_No" VARCHAR(30)   NOT NULL,
    "Category" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Products" PRIMARY KEY (
        "Part_No"
     )
);

CREATE TABLE "All_Sales" (
    "id" SERIAL   NOT NULL,
    "Part_No" VARCHAR(30)   NOT NULL,
    "Invoice_Date" DATE   NOT NULL,
    "Ship_Qty" INT   NOT NULL,
    "Extended_Price" DOUBLE   NOT NULL,
    "Margin_Percentage_Current" DOUBLE   NOT NULL,
    "Category" VARCHAR(30)   NOT NULL,
    "Year" INT   NOT NULL,
    "Month" INT   NOT NULL,
    "Current_Cost" FLOAT   NOT NULL,
    "Profit" DOUBLE   NOT NULL,
    CONSTRAINT "pk_All_Sales" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Purchases" (
    "id" SERIAL   NOT NULL,
    "Part_No" VARCHAR(30)   NOT NULL,
    "Received_Date" DATE   NOT NULL,
    "Qty_Received" INT   NOT NULL,
    "Base_Unit_Price" DOUBLE   NOT NULL,
    "Year" INT   NOT NULL,
    "Month" INT   NOT NULL,
    "Category" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Purchases" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Predictions" (
    "id" SERIAL   NOT NULL,
    "Category" VARCHAR(30)   NOT NULL,
    "One_Month_Sales" FLOAT   NOT NULL,
    "Two_Month_Sales" FLOAT   NOT NULL,
    "Three_Month_Sales" FLOAT   NOT NULL,
    "Four_Month_Sales" FLOAT   NOT NULL,
    "Five_Month_Sales" FLOAT   NOT NULL,
    "Six_Month_Sales" FLOAT   NOT NULL,
    "Seven_Month_Sales" FLOAT   NOT NULL,
    "Eight_Month_Sales" FLOAT   NOT NULL,
    "Nine_Month_Sales" FLOAT   NOT NULL,
    "Ten_Month_Sales" FLOAT   NOT NULL,
    "Eleven_Month_Sales" FLOAT   NOT NULL,
    "Twelve_Month_Sales" FLOAT   NOT NULL,
    CONSTRAINT "pk_Predictions" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "SARIMAX" (
    "id" SERIAL   NOT NULL,
    "Category" VARCHAR(30)   NOT NULL,
    "Predicted_Sales_Qty" FLOAT   NOT NULL,
    "Margin_Error" FLOAT   NOT NULL,
    "AIC_Score" FLOAT   NOT NULL,
    "Error" FLOAT   NOT NULL,
    "Year" int   NOT NULL,
    "Month" int   NOT NULL,
    CONSTRAINT "pk_SARIMAX" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "All_Sales" ADD CONSTRAINT "fk_All_Sales_Part_No_Category" FOREIGN KEY("Part_No", "Category")
REFERENCES "Products" ("Part_No", "Category");

ALTER TABLE "Purchases" ADD CONSTRAINT "fk_Purchases_Part_No_Category" FOREIGN KEY("Part_No", "Category")
REFERENCES "Products" ("Part_No", "Category");

ALTER TABLE "Predictions" ADD CONSTRAINT "fk_Predictions_Category" FOREIGN KEY("Category")
REFERENCES "Products" ("Category");

ALTER TABLE "SARIMAX" ADD CONSTRAINT "fk_SARIMAX_Category" FOREIGN KEY("Category")
REFERENCES "Products" ("Category");


CREATE TABLE tbl_sales (
Order_Line int primary key,
Order_ID varchar,
Order_Date date,
Ship_Date date,
Ship_Mode varchar,
Customer_ID varchar,
Product_ID varchar,
Sales numeric,
Quantity int,
Discount numeric,
Profit numeric
);

/*Place the csv in the container then run*/
COPY tbl_sales from '/var/lib/postgresql/data/SalesforSQL.csv' delimiter ',' csv header;
COPY tbl_sales from '/var/lib/postgresql/data/SalesforAWSandHadoop.csv' delimiter ',' csv header;

/*Check that data is copied over*/
SELECT * 
FROM tbl_sales 
LIMIT 10
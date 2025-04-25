create database project;
Use project;
-- Find the total number of products for each product category
SELECT count(`ï»¿PRODUCTID`) as 'Number_of_products', PRODCATEGORYID
from product_order
group by PRODCATEGORYID;
-- List the top 5 most expensive products category
Select `PRODCATEGORYID`, `PRICE` from product_order
order by PRICE desc 
limit 5 ;
-- Find all products that belong to the 'Mountain Bike' category
Select ï»¿PRODUCTID, PRODCATEGORYID
from product_order
where PRODCATEGORYID = 'MB';
-- List the total sales amount (gross) for each product category
Select Sum(`PRICE`) Total_Price_Amount, PRODCATEGORYID
from product_order
group by PRODCATEGORYID;
-- List the top 5 suppliers by Gross amount. It seems that there is no supplier that supplied more than one product
Select Count(SUPPLIER_PARTNERID), SUPPLIER_PARTNERID
from product_order
group by SUPPLIER_PARTNERID
order by SUPPLIER_PARTNERID desc
limit 5;
-- QUESTIONS ON SALES TABLE
-- Calculate the total gross amount for each sales order.

Select `ï»¿SALESORDERID`, Sum(GROSSAMOUNT) 'Sum_of_Sale'
From sales_order
group by ï»¿SALESORDERID, GROSSAMOUNT
order by Sum(GROSSAMOUNT) desc; 
-- Which products contribute the most to revenue (NETAMOUNT)
Select `PRODUCTID`,PRODCATEGORYID, Product_category_name, Sum(`NETAMOUNT`) Highest_revenue
from sales_order As SO
join `product_order` AS PO
join `product_category` AS PC
on SO.PRODUCTID= PO.ï»¿PRODUCTID AND PO.PRODCATEGORYID= PC.ï»¿PRODCATEGORYID
group by SO.PRODUCTID, PO.ï»¿PRODUCTID, PO.PRODCATEGORYID, PC.ï»¿PRODCATEGORYID, Product_category_name
order by Sum(`NETAMOUNT`) desc
limit 1;
-- Which product category has the highest quantity sold
Select PRODUCTID, Product_category_name, Sum(QUANTITY) Quantity_Sold
from sales_order AS SO
JOIN product_order AS PO
JOIN product_category AS PC
ON SO.PRODUCTID= PO.ï»¿PRODUCTID AND PO.PRODCATEGORYID = PC.ï»¿PRODCATEGORYID
group by PRODUCTID, Product_category_name
order by Quantity_Sold desc
limit 1;
-- Find the total revenue (NETAMOUNT) for "mountain Bike and BMX"
Select Product_category_name, Sum(NETAMOUNT) TOTAL_REVENUE_NETAMOUNT
from sales_order AS SO
JOIN product_order AS PO
JOIN product_category AS PC
ON SO.PRODUCTID= PO.ï»¿PRODUCTID AND PO.PRODCATEGORYID = PC.ï»¿PRODCATEGORYID
GROUP BY Product_category_name
having Product_category_name= 'BMX' or Product_category_name= 'Mountain Bike'
ORDER BY Product_category_name;


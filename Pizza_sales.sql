
select * from pizza_sales

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales

SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

select cast(cast(sum(quantity) as decimal(10,2)) /
cast(COUNT(distinct order_id) as decimal(10,2)) as decimal(10,2)) 
as Avg_pizzas_per_order from pizza_sales

-- Daily Trend
select DATENAME(DW, order_date) as order_day, count(Distinct order_id) as total_oders
from pizza_sales
group by DATENAME(DW, order_date)

-- Hourly Trend
select DATEPART(Hour, order_time) as order_hours, count(Distinct order_id) as total_oders
from pizza_sales
group by DATEPART(Hour, order_time)
order by DATEPART(Hour, order_time)

select pizza_category, sum(total_price) as Total_sales, sum(total_price) * 100 /
(Select sum(total_price) from pizza_sales where MONTH(order_date) = 1) as PCT
from pizza_sales
where MONTH(order_date) = 1
group by pizza_category

select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_sales, cast(sum(total_price) * 100 /
(Select sum(total_price) from pizza_sales where datepart(quarter, order_date)=1) as decimal(10,2)) as PCT
from pizza_sales
where datepart(quarter, order_date)=1
group by pizza_size
order by PCT desc

select pizza_category, SUM(quantity) as Total_pizzas_sold
from pizza_sales
Group by pizza_category

select Top 5 pizza_name, SUM(quantity) as Total_Pizzas_sold
from pizza_sales
Group by pizza_name
order by SUM(quantity) Desc

select Top 5 pizza_name, SUM(quantity) as Total_Pizzas_sold
from pizza_sales
where MONTH(order_date) = 8
Group by pizza_name
order by SUM(quantity) Asc




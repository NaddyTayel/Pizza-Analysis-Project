

--1. Total Revenue:

select sum(total_price) as totalPrice
from pizza_sales

--2. Average Order Value
select sum(total_price) / count(distinct order_id) as avgOrderValue
from pizza_sales


--3. Total Pizzas Sold
select sum(quantity) as TpSold
from pizza_sales


--4. Total Orders
select count(distinct order_id) as Torder
from pizza_sales

--5. Average Pizzas Per Order
select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id)as decimal(10,2))as decimal(10,2)) as avgPOrder
from pizza_sales

--B. Daily Trend for Total Orders
select DATENAME(DW, order_date)as ordeDay , count(distinct order_id) as totalOrder
from pizza_sales
group by DATENAME(DW, order_date)
order by DATENAME(DW, order_date) 


--C. Hourly Trend for Orders
select DATEPART(HOUR, order_time)as ordeHours , count(distinct order_id) as totalOrder
from pizza_sales
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time)

--D. % of Sales by Pizza Category

select pizza_category , sum(total_price)as totalRevenue, 
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_category

--E. % of Sales by Pizza Size
select pizza_size, sum(total_price) as totalRevenue, 
convert(decimal(10,2),sum(total_price)*100 / (select sum(total_price) from pizza_sales)) as PCT
from pizza_sales
group by pizza_size


select *
from pizza_sales
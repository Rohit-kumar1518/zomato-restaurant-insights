create table zomato_food
(
  RESTAURANT_NAME	varchar(100),
  CITY varchar(100),
  AREA varchar(100),
  RATING float ,
  RATING_COUNT float,
  CUSINE varchar(100),
  COST_FOR_TWO float,
  ADDRESS varchar(500),
  order_details varchar(100),
  TABLE_RESERVATION varchar(100),
  FAMOUS_FOOD varchar(500)
)

select * from zomato_food

select count(*) from zomato_food

Drop table zomato_food


copy zomato_food from 'C:\Users\rohit\OneDrive\Desktop\Rohit\PROJECTS\1. SQL PROJECT\Zomato Project\Zomato_Data.csv'
with csv header ;


/* SQL QUERIES */

Q1. Total no of restuarant
select count(Distinct restaurant_name) as total_restuarant  from zomato_food 

Q2. Avergae rating of Restaurant as per no of rating count

Delete from zomato_food 
where rating is null

Delete from zomato_food 
where rating_count is null 

select restaurant_name ,avg(rating) as avg_rating,count(RATING_COUNT) as rating_count  from zomato_food
Group by restaurant_name 
order by rating_count  desc
limit 10

Q3. Total no of Restuarant as per city 
select city,count(restaurant_name) as total_restaurant from zomato_food
group by city
order by total_restaurant desc


Q4. Rating segment as per order_details 
select order_details,
 sum(case when rating >=4.0 then 1 else 0 end) as "rating>=4",
 sum(case when rating >=3.0 and rating<4 then 1 else 0 end) as "rating>=3",
 sum(case when rating >=2.0 and rating<3 then 1 else 0 end) as "rating>=2",
 sum(case when rating >=1.0 and rating<2 then 1 else 0 end) as "rating>=1",
 sum(case when rating >=0.0 and rating<1 then 1 else 0 end) as "rating<1"
 from zomato_food
Group by order_details


Q5. Average cost as per city wise 
select city,avg(cost_for_two) as avg_cost from zomato_food
group by city
order by avg_cost desc


Q6. Average average_rating, Average cost and Total Restaurants  as per order_details  
Select order_details,avg(cost_for_two) as Average_cost,avg(rating) as Average_rating,count(*) as Total_no_of_restaurent from zomato_food
group by order_details


Q7. Average rating , no of restaurant as per table_reservation 
Select table_reservation,count(*) as total_no_of_restuarnt,avg(rating) as avg_rating from zomato_food
Group by table_reservation


Q8. Most prefered cusine 
SELECT Cusine,avg(rating) as avg_rating , Count(*) AS total_count FROM Zomato_Food
Group by Cusine
Order by total_count desc
Limit 10

Q9.Top 5 Most Expensive Restaurants (Based on Cost for Two)
Select restaurant_name, city, Cost_for_two from Zomato_Food
Order by Cost_for_two desc
Limit 5

Q10. Total no of Restaurants per Area in a Specific City (e.g., Delhi NCR)
Select Area, Count(*) AS Restaurant_Count from Zomato_Food
Where City = 'Delhi NCR'
Group by area
Order by  Restaurant_Count desc

Q11.The Most Popular Dish

/* where famous_food != 'Null' */

SELECT Famous_food, Count(*) as Occurrences from Zomato_Food
Where Famous_Food IS NOT NULL
Group by Famous_Food
Order by Occurrences Desc
Limit 1 

Q12. Distribution of Restaurants Based on Cost for Two 
Select 
 Case
   WHEN Cost_for_two <= 500 THEN 'Low (<=500)'
   WHEN Cost_for_two  BETWEEN 501 AND 1000 THEN 'Medium (501-1000)'
   ELSE 'High (>1000)'
  END AS Cost_Category, 
  Count(*) AS Restaurant_Count from Zomato_Food 
Group by Cost_Category
Order by Restaurant_Count DESC





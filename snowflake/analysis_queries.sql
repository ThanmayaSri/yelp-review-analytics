--DATA ANALYSIS
select * from tbl_yelp_review limit 10;
select * from tbl_yelp_businesses limit 10;

--1. find no. of businesses in each category
with cte as (
select business_id, trim(A. value) as category
from tbl_yelp_businesses,
lateral split_to_table(categories,',') as A
)
select category, count(*) as no_of_businesses 
from cte
group by 1
order by 2 desc

--2. find the top 10 users who have reviewed the most businesses in the "Restuarants" category
select r.user_id, count(distinct b.business_id) as most_reviewed_businesses
from tbl_yelp_review r inner join
tbl_yelp_businesses b on r.business_id = b.business_id
where b.categories ilike '%restaurant%' and r.user_id is not null
group by 1
order by 2 desc
limit 10;

--3. find the most popular categories of businesses (based on no. of reviews)
select trim(c.value) as most_popular_categories, sum(review_count) as total_reviews
from tbl_yelp_businesses,
lateral split_to_table(categories,',') as C 
group by most_popular_categories
order by total_reviews desc

--4. find top 3 most recent reviews for each business
with cte as
(select r.*,b.name
, row_number() over (partition by r.business_id
order by review_date desc) as rn 
from tbl_yelp_review r
inner join tbl_yelp_businesses b 
on r.business_id = b.business_id
)
select * from cte
where rn<=3;
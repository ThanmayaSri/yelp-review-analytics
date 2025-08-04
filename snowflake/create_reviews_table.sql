create or replace table yelp_reviews(review_text variant)

copy into yelp_reviews
from 's3://yelp-files'
credentials = (
    aws_key_ID = '   '
    aws_secret_key = '  '
)
file_format = (type = json);

create or replace table tbl_yelp_review as
select review_text:business_id::string as business_id,
review_text:user_id::string as user_id,
review_text:date::date as review_date,
review_text:stars::number as review_stars,
review_text:text::string as review_text,
analyze_sentiment(review_text) as sentiment
from yelp_reviews;

DELETE FROM tbl_yelp_review
WHERE user_id IS NULL;

select count(*) from tbl_yelp_review;

select  * from yelp_reviews;
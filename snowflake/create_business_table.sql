create or replace table yelp_businesses(business_text variant)

copy into yelp_businesses
from 's3://yelp-files/yelp_academic_dataset_business.json'
credentials = (
    aws_key_ID = '   '
    aws_secret_key = '   '
)
file_format = (type = json);

create or replace table tbl_yelp_businesses as
select business_text:business_id::string as business_id,
business_text:city::string as city,
business_text:state::string as state,
business_text:name::string as name,
business_text:review_count::number as review_count,
business_text:stars::number as stars,
business_text:categories::string as categories,
from yelp_businesses;

select * from tbl_yelp_review limit 10;
select * from tbl_yelp_businesses limit 10;

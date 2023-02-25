with 

total as (
    select * from {{ref('snowflake_customer_purchases')}}
)

select c_custkey, 
    sum(c_nationkey) as total_national_key
from total
group by 1
having 1 < 0 
select c_custkey
from {{ ref('snowflake_customer_purchases') }}
group by 1
having regexp_like(c_custkey, '^[0-9]+(\.[0-9]+)?$')<0
select sum(c_acctbal) 
from {{ ref('snowflake_cust_sample_data') }}
group by c_custkey
having sum(c_acctbal) > 100000000


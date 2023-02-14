{{ config(materialized='table', unique_key = 'c_custkey') }}

select 
    c.c_custkey,
    c.c_name,
    c.c_nationkey,
    sum(o.o_totalprice) as total_order_price
from snowflake_sample_data.tpch_sf1.customer c
left join snowflake_sample_data.tpch_sf1.orders o
on o.o_custkey = c.c_custkey
group by 1,2,3
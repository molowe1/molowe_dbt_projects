{{ config(materialized='table', unique_key = 'c_custkey', tags='customer') }}

select 
    c.c_custkey,
    c.c_name,
    c.c_nationkey as nation,
    sum(o.o_totalprice) as total_order_price
from {{ source('tpch_sf1_sample', 'customer')}} c
left join {{ source('tpch_sf1_sample', 'orders')}} o
on o.o_custkey = c.c_custkey
group by 1,2,3
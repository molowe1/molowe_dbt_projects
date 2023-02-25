{{ config(materialized='table', unique_key = 'c_custkey', tags='cost') }}

with sample_customer as (
    select * 
    from {{ source('tpch_sf1_sample', 'customer')}}
), 

sample_orders as (
    select * 
    from {{ source('tpch_sf1_sample', 'orders')}}
)
select 
    c.c_custkey,
    c.c_name,
    c.c_nationkey,
    sum(o.o_totalprice) as total_order_price
from sample_customer c
left join sample_orders o
on o.o_custkey = c.c_custkey
{{ groupby(3) }}



--group by 1,2,3

--{{ dbt_utils.group_by(3) }}

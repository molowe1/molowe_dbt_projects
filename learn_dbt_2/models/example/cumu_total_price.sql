{{ config(materialized='table', unique_key = 'o_orderdate') }}

with order_cumu as (
select
    o.o_orderdate,
    sum(sum(o.o_totalprice)) over (partition by o.o_orderdate) as day_order_price
from snowflake_sample_data.tpch_sf1.orders o
group by o.o_orderdate
order by o.o_orderdate asc)
select o_orderdate,day_order_price, sum(day_order_price) over (order by o_orderdate) as cumu_order_price
from order_cumu
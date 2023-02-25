{{ config(materialized='table', unique_key = 'o_orderdate', tags='cost') }}

with order_cumu as (
select
    o_orderdate,
    sum(sum(o_totalprice)) over (partition by o_orderdate) as day_order_price
from {{ source('tpch_sf1_sample', 'orders')}} 
group by o_orderdate
order by o_orderdate asc)

select o_orderdate,day_order_price, sum(day_order_price) over (order by o_orderdate) as cumu_order_price
from order_cumu

{% if target.name == 'dev' %}
where year(o_orderdate) = 1996
{% endif %}

order by o_orderdate

--with order_cumu as (
--select
--    *
--from snowflake_sample_data.tpch_sf1.orders
--)
--select distinct o_orderdate, sum(o_totalprice) over (order by o_orderdate) as cumu_order_price
--from order_cumu
--order by o_orderdate;
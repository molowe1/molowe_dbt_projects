{{ config(materialized='table', unique_key = 'c_custkey') }}

select *
from snowflake_sample_data.tpch_sf1.customer c

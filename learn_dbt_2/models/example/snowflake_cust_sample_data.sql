{{ config(materialized='table', unique_key = 'c_custkey', tags="customer") }}

with sample_customer as (
    SELECT * 
    FROM {{ source('tpch_sf1_sample', 'customer')}}
)

select 
    c_custkey,
    c_mktsegment,
    {{ rename_segments('c_mktsegment') }} mks_segment_adjusted,
    c_acctbal
from sample_customer
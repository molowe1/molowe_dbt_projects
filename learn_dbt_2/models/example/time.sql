{{ config(materialized='incremental', unique_key = 't_time') }}

select *
from snowflake_sample_data.tpcds_sf10tcl.time_dim
where to_time(concat(T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND)) <= current_time

{% if is_incremental() %}
    and t_time > (select max(t_time) from {{ this }})
{% endif %}
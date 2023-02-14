
-- Use the `ref` function to select from other models

select *
from {{ ref('my_fifth_dbt_model') }}
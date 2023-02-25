{% snapshot fifth_model_snapshot%}

{{
    config(
        strategy= 'timestamp',
        target_database= 'analytics',
        target_schema= 'snapshots',
        unique_key= 'id',
        updated_at= 'updated_at',
    )
}}

    --pro tip: use sources in snapshots
    select * from {{ ref('my_fifth_dbt_model') }}

{% endsnapshot %}

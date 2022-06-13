{% snapshot snapshot_user %}

{{
    config(
        target_database='cauemarinho-training',
        target_schema='dbt_snapshot',
        unique_key='id',
        strategy='timestamp',
        updated_at='last_date_updated'
    )
}}

select id,name,qualification,max(created_at) as last_date_updated
from {{ source('python_gen','raw_data')  }}
group by id,name,qualification

{% endsnapshot %}
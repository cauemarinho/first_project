{{ config(
    materialized='incremental',
    unique_key='maxtime'
)   }}


with all_data as (
    select created_at, count(*) number_rows from {{ source('python_gen','raw_data')}}
    {% if is_incremental()    %}
    where created_at > (select max(maxtime) from {{ this }}) or (select count(*) from {{ this }})=0
    {% endif %}
    group by created_at
),
max_date as (
    select max(created_at) as maxtime from {{ source('python_gen','raw_data')}}
)
select * from all_data, max_date
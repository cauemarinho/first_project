{{ config(
    materialized='incremental'
)   }}


with all_data as (
    select * from {{ source('python_gen','raw_data')}}
    {% if is_incremental()    %}
    where created_at > (select max(maxtime) from {{ this }}) or (select count(*) from {{ this }})=0
    {% endif %}
),
max_date as (
    select max(created_at) as maxtime from {{ source('python_gen','raw_data')}}
)
select * from all_data, max_date
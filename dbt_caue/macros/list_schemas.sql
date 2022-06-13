{% macro list_schemas() %}
    
    {% set get_query %}
        select
        schema_name
        from INFORMATION_SCHEMA.SCHEMATA 
    {% endset %}

    {{ log('\nList values...\n', info=True) }}
    {% set names = run_query(get_query).columns[0].values() %}

    {% for x in names %}
        {{ log(x, info=True) }}
    {% endfor %}
    
{% endmacro %} 
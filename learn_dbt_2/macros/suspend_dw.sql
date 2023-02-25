{% macro suspend_dw(dw_name) %} 

    {% set sql %}
        alter warehouse {{dw_name}} suspend --or resume
    {% endset %}

    {% set table = run_query(sql) %}
    {% do table.print_table() %}

{% endmacro %}
{% macro groupby(n) %} --start and name macro
    GROUP BY
        {% for i in range(1, n + 1) %} 
            {{ i }}
            {% if not loop.last %} , {% endif %}
        {% endfor %}
{% endmacro %}

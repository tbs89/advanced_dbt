{% macro rolling_window_aggregation(
        column_name,
        partition_by,
        aggregation_type='AVG',
        order_by='created_at',
        window_size=7) %}

    {{ aggregation_type }}({{ column_name }}) OVER (
        PARTITION BY {{ partition_by }}
        ORDER BY {{ order_by }}
        ROWS BETWEEN {{ window_size - 1 }} PRECEDING AND CURRENT ROW
    ) AS {{ aggregation_type|lower }}_{{ window_size }}_periods_{{ column_name }}

{% endmacro %}

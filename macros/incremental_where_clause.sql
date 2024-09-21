{% macro incremental_where_clause(column_name='created_at', lookback_window=-3, period='day') %}
    {% if is_incremental() %}
        WHERE {{ column_name }} >= DATEADD('{{ period }}', {{ lookback_window }}, CURRENT_DATE)
    {% endif %}
{% endmacro %}

{% macro adjust_end_month(start_month, end_month) %}
    CASE
        WHEN {{ start_month }} = {{ end_month }} THEN DATEADD('month', 1, {{ end_month }})
        WHEN {{ end_month }} IS NULL THEN DATE(DATEADD('month', 1, DATE_TRUNC('month', CURRENT_DATE)))
        ELSE {{ end_month }}
    END
{% endmacro %}

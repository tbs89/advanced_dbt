{%- test event_name_not_contains_test(model, column_name) %}

SELECT *
FROM {{ model }}
WHERE LOWER({{ column_name }}) LIKE '%test%'

{%- endtest %}

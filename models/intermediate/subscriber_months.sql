{{ config(materialized='table') }}

SELECT
    s.user_id,
    s.subscription_id,
    m.date_month
FROM
    {{ ref('subscribers') }} AS s
    INNER JOIN {{ ref('int_dates') }} AS m
        ON m.date_month >= s.first_start_month
        AND s.last_end_month > m.date_month

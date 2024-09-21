{{ config(materialized='table') }}

SELECT
    user_id,
    subscription_id,
    MIN(start_month) AS first_start_month,
    MAX(adjusted_end_month) AS last_end_month
FROM
    {{ ref('subscription_periods') }}
GROUP BY
    user_id,
    subscription_id

{{ config(materialized='table') }}

SELECT
    DATEADD('month', 1, date_month)::DATE AS date_month,
    user_id,
    subscription_id,
    FALSE AS is_subscribed_current_month,
    first_subscription_month,
    last_subscription_month,
    FALSE AS is_first_subscription_month,
    FALSE AS is_last_subscription_month,
    0.0::DECIMAL(18, 2) AS mrr
FROM
    {{ ref('subscription_revenue_by_month') }}
WHERE
    is_last_subscription_month = TRUE

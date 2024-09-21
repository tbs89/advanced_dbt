{{ config(materialized='table') }}

SELECT
    *,
    COALESCE(
        LAG(is_subscribed_current_month) OVER (PARTITION BY user_id, subscription_id ORDER BY date_month),
        FALSE
    ) AS is_subscribed_previous_month,

    COALESCE(
        LAG(mrr) OVER (PARTITION BY user_id, subscription_id ORDER BY date_month),
        0.0
    ) AS previous_month_mrr_amount,

    mrr - previous_month_mrr_amount AS mrr_change
FROM
    {{ ref('unioned') }}

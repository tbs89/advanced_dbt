{{ config(materialized='table') }}

SELECT
    date_month,
    user_id,
    subscription_id,
    mrr > 0 AS is_subscribed_current_month,

    MIN(CASE WHEN mrr > 0 THEN date_month END) OVER (PARTITION BY user_id, subscription_id) AS first_subscription_month,
    MAX(CASE WHEN mrr > 0 THEN date_month END) OVER (PARTITION BY user_id, subscription_id) AS last_subscription_month,

    CASE
        WHEN MIN(CASE WHEN mrr > 0 THEN date_month END) OVER (PARTITION BY user_id, subscription_id) = date_month THEN TRUE
        ELSE FALSE
    END AS is_first_subscription_month,

    CASE
        WHEN MAX(CASE WHEN mrr > 0 THEN date_month END) OVER (PARTITION BY user_id, subscription_id) = date_month THEN TRUE
        ELSE FALSE
    END AS is_last_subscription_month,

    mrr
FROM
    {{ ref('mrr_base') }}

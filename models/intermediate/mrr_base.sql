{{ config(materialized='table') }}

SELECT
    sm.date_month,
    sm.user_id,
    sm.subscription_id,
    COALESCE(sp.monthly_amount, 0.0) AS mrr
FROM
    {{ ref('subscriber_months') }} AS sm
    LEFT JOIN {{ ref('subscription_periods') }} AS sp
        ON sm.user_id = sp.user_id
        AND sm.subscription_id = sp.subscription_id
        AND sm.date_month >= sp.start_month
        AND (sm.date_month < sp.adjusted_end_month OR sp.adjusted_end_month IS NULL)

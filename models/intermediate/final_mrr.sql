{{ config(materialized='table') }}

SELECT
    m.date_month,
    m.user_id,
    m.subscription_id,
    sp.starts_at,
    sp.ends_at,
    sp.plan_name,
    m.mrr AS mrr_amount,
    m.mrr_change,
    LEAST(m.mrr, m.previous_month_mrr_amount) AS retained_mrr_amount,
    m.previous_month_mrr_amount,

    CASE
        WHEN m.is_first_subscription_month THEN 'new'
        WHEN NOT(m.is_subscribed_current_month) AND m.is_subscribed_previous_month THEN 'churn'
        WHEN m.is_subscribed_current_month AND NOT(m.is_subscribed_previous_month) THEN 'reactivation'
        WHEN m.mrr_change > 0.0 THEN 'upgrade'
        WHEN m.mrr_change < 0.0 THEN 'downgrade'
        ELSE 'renewal'
    END AS change_category,

    CASE
        WHEN change_category = 'churn' THEN NULL
        ELSE DATEDIFF('month', m.first_subscription_month, m.date_month)
    END AS month_retained_number

FROM
    {{ ref('mrr_with_changes') }} AS m
    LEFT JOIN {{ ref('subscription_periods') }} AS sp
        ON m.user_id = sp.user_id
        AND m.subscription_id = sp.subscription_id
WHERE
    m.date_month <= DATE_TRUNC('month', CURRENT_DATE)

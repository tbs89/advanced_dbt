-- models/intermediate/subscription_periods.sql

{{ config(materialized='table') }}

WITH monthly_subscriptions AS (
    SELECT
        subscription_id,
        user_id,
        starts_at,
        ends_at,
        plan_name,
        pricing,
        DATE(DATE_TRUNC('month', starts_at)) AS start_month,
        DATE(DATE_TRUNC('month', ends_at)) AS end_month
    FROM
        {{ ref('dim_subscriptions') }}
    WHERE
        billing_period = 'monthly'
)

SELECT
    subscription_id,
    user_id,
    plan_name,
    pricing AS monthly_amount,
    starts_at,
    ends_at,
    start_month,

    CASE
        WHEN end_month IS NULL THEN DATEADD('month', 1, CURRENT_DATE)
        ELSE end_month
    END AS adjusted_end_month

FROM
    monthly_subscriptions

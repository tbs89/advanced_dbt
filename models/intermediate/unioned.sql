{{ config(materialized='table') }}

SELECT * FROM {{ ref('subscription_revenue_by_month') }}
UNION ALL
SELECT * FROM {{ ref('subscription_churn_by_month') }}

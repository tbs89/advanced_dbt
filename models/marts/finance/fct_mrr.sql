{{ config(materialized='table', tags="p0") }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['date_month', 'subscription_id', 'change_category']) }} AS surrogate_key,
    *
FROM
    {{ ref('final_mrr') }}

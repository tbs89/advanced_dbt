{{ config(materialized='table') }}

SELECT
    session_id,
    created_at,
    user_id,
    event_name,
    event_id

FROM {{ ref('int_events') }}


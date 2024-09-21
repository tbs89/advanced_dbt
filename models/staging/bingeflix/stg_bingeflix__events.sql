{{
    config(
        materialized='incremental',
        unique_key='event_id'
    )
}}

WITH source AS (
    SELECT
        session_id,
        created_at,
        user_id,
        event_name,
        event_id
    FROM {{ source('bingeflix', 'events') }}
    {{ incremental_where_clause(column_name='created_at', lookback_window=-3, period='day') }}
),

renamed AS (
    SELECT
        session_id,
        created_at,
        user_id,
        event_name,
        event_id
    FROM source
),

aggregated AS (
    SELECT
        user_id,
        session_id,
        event_id,
        event_name,
        {{ rolling_window_aggregation('event_id', 'user_id', 'count', 'created_at', 7) }},
        created_at
    FROM renamed
)

SELECT
    user_id,
    session_id,
    event_id,
    event_name,
    count_7_periods_event_id,
    created_at
FROM aggregated

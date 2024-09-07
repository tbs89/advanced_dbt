WITH source AS (
    SELECT * FROM {{ source('bingeflix', 'events') }}
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

SELECT * FROM aggregated

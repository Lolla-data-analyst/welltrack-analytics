SELECT *
FROM {{ source('welltrack', 'wellness_session') }}
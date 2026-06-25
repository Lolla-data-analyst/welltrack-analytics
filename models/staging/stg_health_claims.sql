SELECT *
FROM {{ source('welltrack', 'health_claims') }}
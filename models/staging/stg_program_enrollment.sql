SELECT *
FROM {{ source('welltrack', 'program_enrollment') }}
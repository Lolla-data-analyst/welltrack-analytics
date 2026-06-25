SELECT *
FROM {{ source('welltrack', 'employees') }}
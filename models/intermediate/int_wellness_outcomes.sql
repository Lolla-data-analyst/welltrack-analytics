SELECT
    p.employee_id,
    department,
    program_name,
    program_type,
    enrollment_date,
    completion_date,
    completion_status
FROM {{ ref('stg_program_enrollment') }} p
JOIN {{ ref('stg_employees') }} e ON p.employee_id = e.employee_id

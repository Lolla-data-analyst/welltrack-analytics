SELECT 
p.employee_id, 
e.attrition,
e.department, 
program_name, 
program_type, 
p.completion_status,
COUNT(session_id) As total_session, 
enrollment_date, 
p.completion_date,
COUNT(CASE WHEN ws.completion_status = 'completed' THEN 1 END) AS completed_sessions
FROM {{ ref('stg_program_enrollment') }} p 
JOIN {{ ref('stg_employees') }} e ON p.employee_id = e.employee_id
JOIN {{ ref('stg_wellness_sessions') }} ws ON p.employee_id = ws.employee_id
GROUP BY p.employee_id, e.department, program_name, program_type, e.attrition,
p.completion_status, p.enrollment_date, p.completion_date
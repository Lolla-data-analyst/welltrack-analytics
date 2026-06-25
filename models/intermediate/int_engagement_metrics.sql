SELECT
    ws.employee_id,
    e.department,
    e.job_role,
    COUNT(ws.session_id) AS total_sessions,
    COUNT(CASE WHEN ws.completion_status = 'completed' THEN 1 END) AS completed_sessions
FROM {{ ref('stg_wellness_sessions') }} ws
JOIN {{ ref('stg_employees') }} e ON ws.employee_id = e.employee_id
GROUP BY ws.employee_id, e.department, e.job_role
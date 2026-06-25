SELECT  
p.employee_id, 
e.department, 
hc.period,
completion_status, 
SUM(claim_amount) As total_claim_cost, 
ROUND(AVG(claim_amount), 2) As Avg_claim, 
COUNT(claim_amount) As Total_claim
FROM {{ ref('stg_employees') }} e
JOIN {{ ref('stg_program_enrollment') }} p ON e.employee_id = p.employee_id
JOIN {{ ref('stg_health_claims') }} hc ON p.employee_id = hc.employee_id
GROUP BY p.employee_id, e.department, hc.period, completion_status
-- ================================================
-- Benefits Tracking Analysis
-- Purpose: Track expected benefits by department,
-- risk level, and governance status
-- ================================================

-- 1. Expected benefits by department
SELECT d.dept_name,
       u.use_case_name, u.expected_benefit,
       u.business_value_score, u.governance_status
FROM ai_use_cases u
JOIN departments d ON u.dept_id = d.dept_id
ORDER BY d.dept_name, u.business_value_score DESC;

-- 2. Benefits summary by department
SELECT d.dept_name,
       COUNT(u.use_case_id) AS total_use_cases,
       ROUND(AVG(u.business_value_score), 1) AS avg_business_value,
       SUM(CASE WHEN u.pilot_ready = 'Yes' THEN 1 ELSE 0 END) AS pilot_ready_count
FROM departments d
JOIN ai_use_cases u ON d.dept_id = u.dept_id
GROUP BY d.dept_name
ORDER BY avg_business_value DESC;

-- 3. Benefits by risk level
SELECT r.overall_risk_level,
       COUNT(u.use_case_id) AS total_use_cases,
       ROUND(AVG(u.business_value_score), 1) AS avg_business_value,
       SUM(CASE WHEN u.pilot_ready = 'Yes' THEN 1 ELSE 0 END) AS pilot_ready_count
FROM ai_use_cases u
JOIN risk_assessments r ON u.use_case_id = r.use_case_id
GROUP BY r.overall_risk_level
ORDER BY avg_business_value DESC;

-- 4. Approved use cases and their expected benefits
SELECT u.use_case_name, d.dept_name,
       u.expected_benefit, u.business_value_score,
       r.overall_risk_level
FROM ai_use_cases u
JOIN risk_assessments r ON u.use_case_id = r.use_case_id
JOIN departments d ON u.dept_id = d.dept_id
WHERE u.governance_status = 'Approved'
ORDER BY u.business_value_score DESC;

-- 5. Departments with highest unrealised potential
SELECT d.dept_name,
       COUNT(u.use_case_id) AS stuck_use_cases,
       ROUND(AVG(u.business_value_score), 1) AS avg_value_stuck
FROM departments d
JOIN ai_use_cases u ON d.dept_id = u.dept_id
WHERE u.governance_status IN ('Under Review', 'Paused')
GROUP BY d.dept_name
ORDER BY avg_value_stuck DESC;
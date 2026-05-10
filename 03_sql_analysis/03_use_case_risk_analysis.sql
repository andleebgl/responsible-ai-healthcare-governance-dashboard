-- ================================================
-- Use Case Risk Analysis
-- Purpose: Identify high risk use cases, risk by
-- department, and use cases needing governance review
-- ================================================

-- 1. All use cases ranked by overall risk score
SELECT u.use_case_id, u.use_case_name, u.governance_status,
       r.overall_risk_level, r.overall_risk_score
FROM ai_use_cases u
JOIN risk_assessments r ON u.use_case_id = r.use_case_id
ORDER BY r.overall_risk_score DESC;

-- 2. High risk use cases only
SELECT u.use_case_id, u.use_case_name, d.dept_name,
       r.overall_risk_score, u.governance_status
FROM ai_use_cases u
JOIN risk_assessments r ON u.use_case_id = r.use_case_id
JOIN departments d ON u.dept_id = d.dept_id
WHERE r.overall_risk_level = 'High'
ORDER BY r.overall_risk_score DESC;

-- 3. Average risk score by department
SELECT d.dept_name, d.dept_type,
       ROUND(AVG(r.overall_risk_score), 1) AS avg_risk_score,
       COUNT(u.use_case_id) AS total_use_cases
FROM departments d
JOIN ai_use_cases u ON d.dept_id = u.dept_id
JOIN risk_assessments r ON u.use_case_id = r.use_case_id
GROUP BY d.dept_name, d.dept_type
ORDER BY avg_risk_score DESC;

-- 4. Use cases that should be paused for governance review
SELECT u.use_case_id, u.use_case_name, d.dept_name,
       r.overall_risk_level, r.overall_risk_score,
       u.governance_status, u.pilot_ready
FROM ai_use_cases u
JOIN risk_assessments r ON u.use_case_id = r.use_case_id
JOIN departments d ON u.dept_id = d.dept_id
WHERE r.overall_risk_level = 'High'
  AND u.governance_status != 'Approved'
ORDER BY r.overall_risk_score DESC;

-- 5. Risk distribution summary
SELECT r.overall_risk_level,
       COUNT(*) AS use_case_count,
       ROUND(AVG(r.overall_risk_score), 1) AS avg_score
FROM risk_assessments r
GROUP BY r.overall_risk_level
ORDER BY avg_score DESC;
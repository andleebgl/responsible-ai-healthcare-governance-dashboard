-- ================================================
-- Bias, Privacy, and Oversight Analysis
-- Purpose: Identify use cases with high bias risk,
-- privacy concerns, and human oversight requirements
-- ================================================

-- 1. Bias risk by use case, highest first
SELECT u.use_case_name, u.ai_type, d.dept_name,
       r.bias_risk_score, r.overall_risk_level
FROM ai_use_cases u
JOIN risk_assessments r ON u.use_case_id = r.use_case_id
JOIN departments d ON u.dept_id = d.dept_id
ORDER BY r.bias_risk_score DESC;

-- 2. Average privacy risk by department
SELECT d.dept_name, d.dept_type,
       ROUND(AVG(r.privacy_risk_score), 1) AS avg_privacy_risk,
       COUNT(u.use_case_id) AS total_use_cases
FROM departments d
JOIN ai_use_cases u ON d.dept_id = u.dept_id
JOIN risk_assessments r ON u.use_case_id = r.use_case_id
GROUP BY d.dept_name, d.dept_type
ORDER BY avg_privacy_risk DESC;

-- 3. Use cases requiring human oversight
SELECT u.use_case_name, d.dept_name, u.ai_type,
       r.overall_risk_level, r.clinical_safety_risk
FROM ai_use_cases u
JOIN risk_assessments r ON u.use_case_id = r.use_case_id
JOIN departments d ON u.dept_id = d.dept_id
WHERE r.human_oversight_required = 'Yes'
ORDER BY r.clinical_safety_risk DESC;

-- 4. Use cases requiring explainability
SELECT u.use_case_name, d.dept_name, u.ai_type,
       r.overall_risk_level, r.clinical_safety_risk
FROM ai_use_cases u
JOIN risk_assessments r ON u.use_case_id = r.use_case_id
JOIN departments d ON u.dept_id = d.dept_id
WHERE r.explainability_required = 'Yes'
ORDER BY r.clinical_safety_risk DESC;

-- 5. High privacy risk use cases with their data sources
SELECT u.use_case_name, u.data_source, d.dept_name,
       r.privacy_risk_score, u.governance_status
FROM ai_use_cases u
JOIN risk_assessments r ON u.use_case_id = r.use_case_id
JOIN departments d ON u.dept_id = d.dept_id
WHERE r.privacy_risk_score >= 7
ORDER BY r.privacy_risk_score DESC;
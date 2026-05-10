-- ================================================
-- Prioritisation Analysis
-- Purpose: Identify which use cases to pilot first,
-- which need governance work, and quick wins
-- ================================================

-- 1. Pilot ready use cases with their risk profile
SELECT u.use_case_name, d.dept_name,
       u.business_value_score, r.overall_risk_score,
       r.overall_risk_level, u.expected_benefit
FROM ai_use_cases u
JOIN risk_assessments r ON u.use_case_id = r.use_case_id
JOIN departments d ON u.dept_id = d.dept_id
WHERE u.pilot_ready = 'Yes'
ORDER BY u.business_value_score DESC;

-- 2. Quick wins: high value, low risk
SELECT u.use_case_name, d.dept_name,
       u.business_value_score, r.overall_risk_score,
       r.overall_risk_level, u.governance_status
FROM ai_use_cases u
JOIN risk_assessments r ON u.use_case_id = r.use_case_id
JOIN departments d ON u.dept_id = d.dept_id
WHERE u.business_value_score >= 6
  AND r.overall_risk_score <= 5
ORDER BY u.business_value_score DESC;

-- 3. Business value vs risk overview for all use cases
SELECT u.use_case_name, d.dept_name,
       u.business_value_score, r.overall_risk_score,
       r.overall_risk_level, u.pilot_ready,
       u.governance_status
FROM ai_use_cases u
JOIN risk_assessments r ON u.use_case_id = r.use_case_id
JOIN departments d ON u.dept_id = d.dept_id
ORDER BY u.business_value_score DESC, r.overall_risk_score ASC;

-- 4. High business value but low policy readiness
SELECT u.use_case_name, d.dept_name,
       u.business_value_score, r.policy_readiness_score,
       r.overall_risk_level, u.governance_status
FROM ai_use_cases u
JOIN risk_assessments r ON u.use_case_id = r.use_case_id
JOIN departments d ON u.dept_id = d.dept_id
WHERE u.business_value_score >= 7
  AND r.policy_readiness_score <= 4
ORDER BY u.business_value_score DESC;

-- 5. Use cases needing governance work before progressing
SELECT u.use_case_name, d.dept_name,
       u.governance_status, u.use_case_owner,
       r.overall_risk_level, r.policy_readiness_score
FROM ai_use_cases u
JOIN risk_assessments r ON u.use_case_id = r.use_case_id
JOIN departments d ON u.dept_id = d.dept_id
WHERE u.governance_status IN ('Under Review', 'Paused')
ORDER BY r.policy_readiness_score ASC;
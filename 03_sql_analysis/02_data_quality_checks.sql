-- ================================================
-- Data Quality Checks
-- Purpose: Identify missing data, gaps, and duplicates
-- before any analysis begins
-- ================================================

-- 1. Use cases with no owner assigned
SELECT use_case_id, use_case_name, dept_id, governance_status
FROM ai_use_cases
WHERE use_case_owner IS NULL;

-- 2. Check for duplicate use case names
SELECT use_case_name, COUNT(*) AS duplicate_count
FROM ai_use_cases
GROUP BY use_case_name
HAVING COUNT(*) > 1;

-- 3. Use cases with no matching risk assessment
SELECT u.use_case_id, u.use_case_name
FROM ai_use_cases u
LEFT JOIN risk_assessments r ON u.use_case_id = r.use_case_id
WHERE r.risk_id IS NULL;

-- 4. Governance controls with no matching use case
SELECT gc.control_id, gc.use_case_id, gc.control_type
FROM governance_controls gc
LEFT JOIN ai_use_cases u ON gc.use_case_id = u.use_case_id
WHERE u.use_case_id IS NULL;

-- 5. Check for missing risk scores
SELECT use_case_id, overall_risk_score, bias_risk_score, privacy_risk_score, clinical_safety_risk
FROM risk_assessments
WHERE overall_risk_score IS NULL
   OR bias_risk_score IS NULL
   OR privacy_risk_score IS NULL
   OR clinical_safety_risk IS NULL;
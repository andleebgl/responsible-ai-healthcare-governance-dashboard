-- ================================================
-- Create Tables
-- Purpose: Database schema for the Healthcare AI
-- Governance dataset
-- ================================================

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    dept_head VARCHAR(50),
    dept_type VARCHAR(30)
);

CREATE TABLE ai_use_cases (
    use_case_id INT PRIMARY KEY,
    use_case_name VARCHAR(100) NOT NULL,
    description TEXT,
    dept_id INT,
    use_case_owner VARCHAR(50),
    submission_date DATE,
    governance_status VARCHAR(30),
    pilot_ready VARCHAR(3),
    business_value_score INT,
    expected_benefit VARCHAR(100),
    ai_type VARCHAR(30),
    data_source VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE risk_assessments (
    risk_id INT PRIMARY KEY,
    use_case_id INT,
    overall_risk_level VARCHAR(10),
    overall_risk_score INT,
    bias_risk_score INT,
    privacy_risk_score INT,
    clinical_safety_risk INT,
    explainability_required VARCHAR(3),
    human_oversight_required VARCHAR(3),
    policy_readiness_score INT,
    assessment_date DATE,
    assessor VARCHAR(50),
    FOREIGN KEY (use_case_id) REFERENCES ai_use_cases(use_case_id)
);

CREATE TABLE governance_controls (
    control_id INT PRIMARY KEY,
    use_case_id INT,
    control_type VARCHAR(50),
    control_description TEXT,
    implementation_status VARCHAR(30),
    review_date DATE,
    FOREIGN KEY (use_case_id) REFERENCES ai_use_cases(use_case_id)
);

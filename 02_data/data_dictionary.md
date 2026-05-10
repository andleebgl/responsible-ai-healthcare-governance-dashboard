# Data Dictionary

## departments

| Column | Type | Description |
| ------ | ---- | ----------- |
| dept_id | INT | Unique identifier for each department |
| dept_name | VARCHAR(50) | Name of the department |
| dept_head | VARCHAR(50) | Name of the person leading the department |
| dept_type | VARCHAR(30) | Either Clinical or Operational |

## ai_use_cases

| Column | Type | Description |
| ------ | ---- | ----------- |
| use_case_id | INT | Unique identifier for each AI use case request |
| use_case_name | VARCHAR(100) | Short name describing the AI use case |
| description | TEXT | Detailed explanation of what the use case does |
| dept_id | INT | Foreign key linking to the submitting department |
| use_case_owner | VARCHAR(50) | Named person responsible. NULL means no owner assigned |
| submission_date | DATE | Date the request was submitted |
| governance_status | VARCHAR(30) | Current status: Approved, Under Review, Paused, or Rejected |
| pilot_ready | VARCHAR(3) | Yes or No |
| business_value_score | INT | Score from 1 to 10 |
| expected_benefit | VARCHAR(100) | What the department hopes to gain |
| ai_type | VARCHAR(30) | LLM, Predictive Model, NLP, Computer Vision, or Automation |
| data_source | VARCHAR(50) | Where the data comes from |

## risk_assessments

| Column | Type | Description |
| ------ | ---- | ----------- |
| risk_id | INT | Unique identifier for each risk assessment |
| use_case_id | INT | Foreign key linking to the assessed use case |
| overall_risk_level | VARCHAR(10) | High, Medium, or Low |
| overall_risk_score | INT | Score from 1 to 10 |
| bias_risk_score | INT | Score from 1 to 10 |
| privacy_risk_score | INT | Score from 1 to 10 |
| clinical_safety_risk | INT | Score from 1 to 10 |
| explainability_required | VARCHAR(3) | Yes or No |
| human_oversight_required | VARCHAR(3) | Yes or No |
| policy_readiness_score | INT | Score from 1 to 10 |
| assessment_date | DATE | Date the risk assessment was completed |
| assessor | VARCHAR(50) | Name of the person who conducted the assessment |

## governance_controls

| Column | Type | Description |
| ------ | ---- | ----------- |
| control_id | INT | Unique identifier for each control |
| use_case_id | INT | Foreign key linking to the use case |
| control_type | VARCHAR(50) | Category of safeguard |
| control_description | TEXT | Detailed explanation of the control |
| implementation_status | VARCHAR(30) | Implemented, In Progress, or Not Started |
| review_date | DATE | Date this control should next be reviewed |

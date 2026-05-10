# Responsible AI Risk Register

## Purpose
This register documents the identified risks for each AI use case, their severity, and the mitigation actions in place or planned.

## Risk Register

| Use Case | Risk Category | Risk Description | Likelihood (1-5) | Impact (1-5) | Risk Score | Mitigation Action | Status |
|----------|--------------|-------------------|-------------------|--------------|------------|-------------------|--------|
| LLM Clinical Note Summarisation | Hallucination | Model generates incorrect clinical information in a discharge summary | 3 | 5 | 15 | Clinician must approve every summary before it enters the patient record | Implemented |
| LLM Clinical Note Summarisation | Privacy | Patient identifiable data processed by LLM | 4 | 5 | 20 | Data processing agreement in place, local processing only | Implemented |
| Patient Triage Chatbot | Misinformation | Chatbot gives incorrect urgency advice leading to delayed treatment | 3 | 5 | 15 | All high urgency cases escalated to clinician immediately | In Progress |
| Patient Triage Chatbot | Privacy | Patient symptoms and identifiers processed by AI | 4 | 4 | 16 | Patient identifiers stripped before processing | Not Started |
| Readmission Risk Prediction | Bias | Model unfairly flags patients from deprived areas as high risk | 4 | 4 | 16 | Bias audit across age, ethnicity, and deprivation decile | Not Started |
| Readmission Risk Prediction | Explainability | Model provides no explanation for risk scores | 3 | 4 | 12 | Feature importance scores required for every prediction | Not Started |
| Medical Coding Assistant | Accuracy | Model suggests incorrect ICD-10 codes | 3 | 3 | 9 | Coder must confirm or override every suggested code | Implemented |
| Diagnostic Image Support | Safety | AI fails to flag a critical abnormality or flags a false positive | 2 | 5 | 10 | Radiologist reviews all AI flagged abnormalities | In Progress |
| Diagnostic Image Support | Bias | Model performs differently across patient demographics | 3 | 4 | 12 | Sensitivity and specificity tracked monthly across groups | Not Started |
| Mental Health Crisis Text Detection | Safety | System fails to detect a genuine crisis message | 2 | 5 | 10 | Every flagged message reviewed by clinician within 15 minutes | In Progress |
| Mental Health Crisis Text Detection | Privacy | Sensitive mental health disclosures processed by AI | 4 | 5 | 20 | All flagged messages logged for safeguarding review | In Progress |
| Prescription Error Detection | Safety | System fails to flag a dangerous prescribing error | 2 | 5 | 10 | Pharmacist reviews every flagged alert before action | In Progress |
| Appointment No Show Prediction | Fairness | Model disproportionately targets specific demographic groups | 3 | 3 | 9 | Model reviewed for fairness across demographic groups and postcodes | Implemented |
| Patient Feedback Sentiment Analysis | Misclassification | Sentiment model misreads sarcasm or cultural expression | 3 | 2 | 6 | Results reviewed by Patient Experience team before action | Implemented |
| Radiology Report Prioritisation | Safety | AI incorrectly ranks a critical report as low priority | 2 | 5 | 10 | Radiologist reviews AI prioritisation ranking before acting | Not Started |

## Risk Scoring Method

- **Likelihood**: 1 (Rare) to 5 (Almost Certain)
- **Impact**: 1 (Negligible) to 5 (Catastrophic)
- **Risk Score**: Likelihood x Impact. Scores of 15+ are treated as high priority.

## Review
This register should be reviewed at each governance board meeting and updated whenever a new use case is submitted or an existing risk assessment changes.
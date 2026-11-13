-- 01_clean_data.sql
-- Remove unrealistic values (age > 100, employment length > 100 years)
-- and add a readable loan status column.
CREATE TABLE credit_risk_clean_check AS
SELECT
    person_age            AS age,
    person_income         AS income,
    person_home_ownership AS home_ownership,
    person_emp_length     AS emp_length,
    loan_intent,
    loan_grade,
    loan_amnt,
    loan_int_rate,
    loan_status,
    CASE WHEN loan_status = 1 THEN 'Default' ELSE 'Repaid' END AS status_text,
    loan_percent_income
FROM credit_risk_dataset
WHERE person_age <= 100
  AND CAST(person_emp_length AS INTEGER) <= 100;

SELECT COUNT(*) FROM credit_risk_clean_check;
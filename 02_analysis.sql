-- 02_analysis.sql
-- Default rate analysis on the cleaned credit risk table

-- 1. Total clients and overall default rate
SELECT COUNT(*) AS clients,
       ROUND(100.0 * AVG(loan_status), 1) AS default_pct
FROM credit_risk_clean_check;

-- 2. Default rate by loan grade
SELECT loan_grade,
       COUNT(*) AS clients,
       ROUND(100.0 * AVG(loan_status), 1) AS default_pct
FROM credit_risk_clean_check
GROUP BY loan_grade
ORDER BY loan_grade;

-- 3. Default rate by loan intent
SELECT loan_intent,
       COUNT(*) AS clients,
       ROUND(100.0 * AVG(loan_status), 1) AS default_pct
FROM credit_risk_clean_check
GROUP BY loan_intent
ORDER BY default_pct DESC;

-- 4. Default rate by home ownership
SELECT home_ownership,
       COUNT(*) AS clients,
       ROUND(100.0 * AVG(loan_status), 1) AS default_pct
FROM credit_risk_clean_check
GROUP BY home_ownership
ORDER BY default_pct DESC;
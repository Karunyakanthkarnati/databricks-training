--Q11. Salary Risk Flagging Based on Tax Shock
SELECT
LOWER(emp_name) AS emp_name,
ROUND(salary-(salary*tax_percent/100),0) AS net_salary,
YEAR(last_revision) AS revision_year,
TIMESTAMPDIFF(MONTH,last_revision,CURDATE()) AS months_since_revision,
CASE
	WHEN tax_percent > 20 
    AND TIMESTAMPDIFF(MONTH,last_revision,CURDATE()) > 24
    THEN 'Tax Shock'
    
    WHEN tax_percent BETWEEN 15 AND 20
    THEN 'Review Needed'
    
    ELSE 'Stable'
END AS status
FROM salary_audit;

--Q12. Bonus Abuse Detection
SELECT
CONCAT(
UPPER(LEFT(emp_name,1)),
LOWER(SUBSTRING(emp_name,2))
) AS emp_name,

ROUND((bonus/base_salary)*100,2) AS bonus_percentage,

DAYNAME(bonus_date) AS day_name,

ABS(base_salary-bonus) AS difference_amount,

CASE
	WHEN (bonus/base_salary)*100 > 30
    AND DAYNAME(bonus_date) IN ('Saturday','Sunday')
    THEN 'Suspicious'
    
    WHEN (bonus/base_salary)*100 <= 20
    THEN 'Normal'
    
    ELSE 'Audit'
END AS status
FROM bonus_monitor;

--Q13. Experience Parity Validation
SELECT
UPPER(emp_name) AS emp_name,

TIMESTAMPDIFF(YEAR,joining_date,CURDATE()) AS actual_experience,

ABS(
declared_experience -
TIMESTAMPDIFF(YEAR,joining_date,CURDATE())
) AS difference_years,

FLOOR(salary) AS floor_salary,

CASE
	WHEN declared_experience >
    TIMESTAMPDIFF(YEAR,joining_date,CURDATE())
    THEN 'Overstated'
    
    WHEN declared_experience <
    TIMESTAMPDIFF(YEAR,joining_date,CURDATE())
    THEN 'Understated'
    
    ELSE 'Matched'
END AS status
FROM employee_experience;

--Q14. Salary Digit Pattern Analysis
SELECT
RIGHT(emp_name,2) AS last_two_chars,

DAY(credit_date) AS day_of_month,

TRUNCATE(salary,0) AS truncated_salary,

MOD(TRUNCATE(salary,0),10) AS mod_salary,

CASE
	WHEN MOD(TRUNCATE(salary,0),10) = DAY(credit_date)
    THEN 'Pattern Match'
    
    ELSE 'No Match'
END AS status
FROM salary_digits;

--Q15. Odd–Even Salary Compliance
SELECT
LOWER(emp_name) AS emp_name,

DAYNAME(payment_date) AS weekday_name,

ROUND(salary,0) AS rounded_salary,

MOD(ROUND(salary,0),2) AS mod_salary,

CASE
	WHEN MOD(ROUND(salary,0),2)=0
    AND DAY(payment_date)%2 != 0
    THEN 'Violation'
    
    ELSE 'Compliant'
END AS status
FROM payroll_control;

--Q16. Salary Inflation Drift
SELECT
CONCAT(
UPPER(LEFT(emp_name,1)),
LOWER(SUBSTRING(emp_name,2))
) AS emp_name,

TIMESTAMPDIFF(YEAR,last_hike,CURDATE()) AS years_since_hike,

POWER(
TIMESTAMPDIFF(YEAR,last_hike,CURDATE()),2
) AS power_value,

ROUND(
salary *
POWER(1.05,
TIMESTAMPDIFF(YEAR,last_hike,CURDATE()))
,0) AS salary_impact,

CASE
	WHEN TIMESTAMPDIFF(YEAR,last_hike,CURDATE()) > 5
    THEN 'High Inflation Risk'
    
    WHEN TIMESTAMPDIFF(YEAR,last_hike,CURDATE()) BETWEEN 3 AND 5
    THEN 'Moderate'
    
    ELSE 'Low'
END AS risk_level
FROM inflation_watch;

--Q17. Salary Sign Integrity Check
SELECT
UPPER(emp_name) AS emp_name,

YEAR(record_date) AS record_year,

SIGN(salary) AS salary_sign,

ABS(salary) AS abs_salary,

CASE
	WHEN salary < 0 THEN 'Negative Error'
    WHEN salary = 0 THEN 'Zero Salary'
    ELSE 'Valid'
END AS status
FROM salary_integrity;

--Q18. Name Length vs Salary Correlation
SELECT
LENGTH(emp_name) AS name_length,

TIMESTAMPDIFF(YEAR,join_date,CURDATE()) AS years_of_service,

ROUND(salary,0) AS rounded_salary,

ABS(
LENGTH(emp_name) -
TIMESTAMPDIFF(YEAR,join_date,CURDATE())
) AS difference_value,

CASE
	WHEN LENGTH(emp_name) >
    TIMESTAMPDIFF(YEAR,join_date,CURDATE())
    THEN 'Name Bias'
    
    ELSE 'Neutral'
END AS status
FROM name_salary;

--Q19. Salary Spike Detection by Month
SELECT
MONTHNAME(paid_date) AS month_name,

CEIL(salary) AS ceil_salary,

LAST_DAY(paid_date) AS last_day,

CASE
	WHEN paid_date = LAST_DAY(paid_date)
    THEN 'End Month Spike'
    
    ELSE 'Regular'
END AS status
FROM salary_monthly;

--Q20. Salary Digit Sum Audit
SELECT
LEFT(emp_name,1) AS first_character,

TRUNCATE(salary,0) AS truncated_salary,

DAY(audit_date) AS audit_day,

CASE
	WHEN MOD(TRUNCATE(salary,0),9)=0
    THEN 'Digit Alert'
    
    ELSE 'Normal'
END AS status
FROM digit_audit;

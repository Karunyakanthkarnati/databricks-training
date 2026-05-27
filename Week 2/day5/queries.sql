--Q1. Employee Compensation Classification
select CONCAT(UPPER(LEFT(emp_name,1)),LOWER(SUBSTRING(emp_name,2))) as name,
ROUND(base_salary+IFNULL(bonus,0)) as total_salary,
YEAR(joining_date) as year,
CASE
	WHEN timestampdiff(year,joining_date,CURDATE())>7 THEN 'senior'
    WHEN timestampdiff(year,joining_date,CURDATE()) BETWEEN 4 AND 7 THEN 'mid'
    ELSE 'junior'
END as experience
from employee_payments

--Q2.Order Delivery Delay Analysis
select UPPER(customer_name) as name,
DATEDIFF(IFNULL(delivery_date,curdate()),order_date) as delivery_days,
TRUNCATE(order_amount,1),
CASE
	WHEN delivery_date is NULL THEN 'pending'
    WHEN DATEDIFF(delivery_date,order_date) = 0 THEN 'same day'
    WHEN DATEDIFF(delivery_date,order_date) > 3 THEN 'delayed'
    ELSE 'normal'
END as status
from orders_delivery

--Q3.Customer Spending Pattern
select CONCAT(UPPER(LEFT(cust_name,1)),LOWER(SUBSTR(cust_name,2))) as name,
MONTHNAME(purchase_date) as purchase_month,
ROUND(purchase_amount),
ABS(purchase_amount),
CASE
	WHEN purchase_amount > 15000 THEN 'High spender'
    WHEN purchase_amount BETWEEN 8000 AND 15000 THEN 'medium spender'
    ELSE 'low spender'
END as spending_status
from customer_spending

--Q4. Subscription Validity Check
SELECT
SUBSTRING_INDEX(SUBSTRING_INDEX(user_email,'@',-1),'.',1) AS domain_name,
TIMESTAMPDIFF(MONTH,start_date,end_date) AS duration_months,
FORMAT(subscription_fee,2),
DATEDIFF(end_date,CURDATE()) AS remaining_days,
CASE
  WHEN end_date < CURDATE() THEN 'Expired'
  WHEN DATEDIFF(end_date,CURDATE()) <=30 THEN 'Expiring Soon'
  ELSE 'Active'
END AS subscription_status
FROM subscriptions;

--Q5.Loan EMI Risk Categorization
SELECT
UPPER(customer_name),
ROUND((loan_amount * POWER((1 + interest_rate/1200),12)),0) AS emi,
TIMESTAMPDIFF(YEAR,loan_start,CURDATE()) AS years_since_loan,
CASE
  WHEN interest_rate > 9 THEN 'High Risk'
  WHEN interest_rate BETWEEN 8 AND 9 THEN 'Medium Risk'
  ELSE 'Low Risk'
END AS risk_level
FROM loan_details;

--Q6. Employee Attendance Evaluation
SELECT
LOWER(emp_name),
ROUND((present_days/total_days)*100,0) AS attendance_percentage,
MONTHNAME(record_date),
(total_days-present_days) AS absent_days,
CASE
  WHEN (present_days/total_days)*100 >=90 THEN 'Excellent'
  WHEN (present_days/total_days)*100 BETWEEN 75 AND 89 THEN 'Average'
  ELSE 'Poor'
END AS attendance_status
FROM attendance;

--Q7. Product Discount Validation
SELECT
CONCAT(UPPER(LEFT(product_name,1)),LOWER(SUBSTRING(product_name,2))) AS product_name,
ABS(mrp-selling_price) AS discount_amount,
ROUND(((mrp-selling_price)/mrp)*100,2) AS discount_percentage,
DAYNAME(sale_date),
CASE
  WHEN selling_price < mrp THEN 'Valid Discount'
  WHEN selling_price > mrp THEN 'Overpriced'
  ELSE 'No Discount'
END AS status
FROM product_sales;

--Q8. Insurance Policy Aging
SELECT
UPPER(holder_name),
TIMESTAMPDIFF(YEAR,policy_start,policy_end) AS duration_years,
DATEDIFF(policy_end,CURDATE()) AS remaining_days,
ROUND(premium_amount),
CASE
  WHEN policy_end < CURDATE() THEN 'Expired'
  WHEN TIMESTAMPDIFF(YEAR,policy_start,policy_end)>=3 THEN 'Long Term'
  ELSE 'Mid Term'
END AS policy_status
FROM insurance_policies;

--Q9. Salary Increment Simulation
SELECT
LOWER(emp_name),
TIMESTAMPDIFF(YEAR,last_hike,CURDATE()) AS years_since_hike,
ROUND(current_salary + (current_salary*(rating*5)/100),0) AS new_salary,
CASE
  WHEN rating=5 THEN 'High Increment'
  WHEN rating BETWEEN 3 AND 4 THEN 'Moderate'
  ELSE 'No Increment'
END AS increment_status
FROM salary_revision;

--Q10. Customer Account Status Evaluation
SELECT
CONCAT(UPPER(LEFT(branch,1)),LOWER(SUBSTRING(branch,2))) AS branch_name,
ABS(balance),
DATEDIFF(CURDATE(),last_transaction) AS inactive_days,
SIGN(balance),
CASE
  WHEN balance < 0 THEN 'Overdrawn'
  WHEN DATEDIFF(CURDATE(),last_transaction) > 365 THEN 'Dormant'
  ELSE 'Active'
END AS account_status
FROM bank_accounts;

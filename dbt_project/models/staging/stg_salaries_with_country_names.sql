

WITH country_codes AS (
  SELECT
    code AS country_code,
    country_name AS full_country_name
  FROM {{ ref('iso-country-codes') }}  
),

salaries AS (
  SELECT *
  FROM {{ ref('stg_salaries') }}  
)

SELECT
  s.work_year,
  s.job_title,
  s.salary,
  s.salary_currency,
  s.salary_in_usd,
  cc_employee.full_country_name AS employee_residence,
  cc_company.full_country_name AS company_location,
  s.experience_level,
  s.employment_type,
  s.remote_ratio,
  s.company_size
FROM salaries s
LEFT JOIN country_codes cc_employee ON s.employee_residence = cc_employee.country_code
LEFT JOIN country_codes cc_company ON s.company_location = cc_company.country_code

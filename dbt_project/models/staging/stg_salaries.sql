-- models/staging/stg_salaries.sql

WITH salary_data AS (
  SELECT
    work_year,
    experience_level,
    employment_type,
    job_title,
    salary,
    salary_currency,
    salary_in_usd,
    employee_residence,
    remote_ratio,
    company_location,
    company_size
  FROM {{ source('salaries_source', 'salaries') }}
)

SELECT
  work_year,
  job_title,
  salary,
  salary_currency,
  salary_in_usd,
  employee_residence,
  company_location,
  -- Overwrite the existing columns with labeled data
  CASE
    WHEN experience_level = 'EN' THEN 'Entry-level / Junior'
    WHEN experience_level = 'MI' THEN 'Mid-level / Intermediate'
    WHEN experience_level = 'SE' THEN 'Senior-level / Expert'
    WHEN experience_level = 'EX' THEN 'Executive-level / Director'
    ELSE experience_level
  END as experience_level, -- Overwriting the existing experience_level column
  CASE
    WHEN employment_type = 'PT' THEN 'Part-time'
    WHEN employment_type = 'FT' THEN 'Full-time'
    WHEN employment_type = 'CT' THEN 'Contract'
    WHEN employment_type = 'FL' THEN 'Freelance'
    ELSE employment_type
  END as employment_type, -- Overwriting the existing employment_type column
  CASE
    WHEN remote_ratio = 0 THEN 'No remote work'
    WHEN remote_ratio = 50 THEN 'Partially remote/hybrid'
    WHEN remote_ratio = 100 THEN 'Fully remote'
    ELSE CAST(remote_ratio AS VARCHAR)
  END as remote_ratio, -- Overwriting the existing remote_ratio column
  CASE
    WHEN company_size = 'S' THEN 'less than 50 employees'
    WHEN company_size = 'M' THEN '50 to 250 employees'
    WHEN company_size = 'L' THEN 'more than 250 employees'
    ELSE company_size
  END as company_size -- Overwriting the existing company_size column
FROM salary_data

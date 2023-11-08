-- models/marts/mart_average_salaries.sql

WITH salary_aggregations AS (
    SELECT
        job_title,
        experience_level,
        employment_type,
        remote_ratio,
        company_size,
        AVG(salary_in_usd) AS average_salary_usd,
        COUNT(*) AS number_of_salaries
    FROM {{ ref('stg_salaries') }}
    GROUP BY
        job_title,
        experience_level,
        employment_type,
        remote_ratio,
        company_size
)

SELECT
    job_title,
    experience_level,
    employment_type,
    remote_ratio,
    company_size,
    ROUND(average_salary_usd, 2) AS average_salary_usd,
    number_of_salaries
FROM salary_aggregations
ORDER BY experience_level, employment_type, remote_ratio, company_size

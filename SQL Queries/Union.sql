SELECT
job_title_short,
job_location,
salary_year_avg,
job_posted_date:: Date
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM febraury_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
)
WHERE salary_year_avg > 70000 AND
    job_title_short = 'Data Analyst'

ORDER BY 
salary_year_avg DESC


SELECT NAME AS COMPANY_NAME
FROM company_dim
WHERE company_id IN (
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = TRUE
);



WITH january_jobs AS (
    Select *
    from job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT *
FROM january_jobs;




WITH top_companies AS (

SELECT company_id,
COUNT(*) as total_jobs
FROM job_postings_fact
GROUP BY company_id
)

SELECT 
top_companies.company_id,
company_dim.name as company_name
FROM company_dim
LEFT JOIN top_companies ON top_companies.company_id = company_dim.company_id
ORDER BY total_jobs DESC
LIMIT 5;


   

WITH REMOTE_JOB_SKILLS AS (

SELECT 
skills_job_dim.skill_id,
COUNT(*) AS SKILLS_COUNT
FROM skills_job_dim
INNER JOIN 
    job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE 
    job_work_from_home = TRUE
GROUP BY
    skill_id
    )

SELECT 
REMOTE_JOB_SKILLS.skill_id,
SKILLS_DIM.skills,
SKILLS_COUNT
FROM REMOTE_JOB_SKILLS
INNER JOIN
    SKILLS_DIM ON SKILLS_DIM.skill_id = REMOTE_JOB_SKILLS.skill_id
ORDER BY
    SKILLS_COUNT DESC
Limit 5;
SELECT 
    job_title_short as title,
    job_location as location,
    job_posted_date ::Date as date,
    EXTRACT (MONTH FROM job_posted_date) as Month
FROM job_postings_fact
LIMIT 100;



SELECT 
    Count(job_posted_date) as job_count,
    EXTRACT (MONTH FROM job_posted_date) as month
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY 
    month 
ORDER BY 
    job_count DESC;



CREATE TABLE january_jobs AS 
    SELECT *
    FROM   job_postings_fact
    WHERE  EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE febraury_jobs AS 
    SELECT *
    FROM   job_postings_fact
    WHERE  EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS 
    SELECT *
    FROM   job_postings_fact
    WHERE  EXTRACT(MONTH FROM job_posted_date) = 3;



SELECT *
FROM march_jobs;

SELECT
    job_title_short,
    job_location,
    CASE 
        When job_location = 'Anywhere' THEN 'Remote'
        When job_location = 'New York, NY' THEN 'Local'
    ELSE
        'Onsite'
    END AS location_category
FROM
    job_postings_fact
LIMIT
    100;



SELECT
    Count(job_id) AS Job_Count,
    CASE 
        When job_location = 'Anywhere' THEN 'Remote'
        When job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
GROUP BY
    location_category;
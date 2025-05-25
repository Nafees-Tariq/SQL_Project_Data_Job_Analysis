CREATE TABLE job_applied (
jod_id INT,
applicayion_sent_date DATE,
custum_resume Boolean,
resume_file_name varchar(255),
cover_letter_sent Boolean,
cover_letter_fike_name varchar(255),
status varchar(50)
);


INSERT INTO job_applied(
            jod_id,
            applicayion_sent_date,
            custum_resume,
            resume_file_name,
            cover_letter_sent,
            cover_letter_fike_name,
            status)
Values      (1,
            '2025,05,19',
            true,
            'resume_01.pdf',
            true,
            'cover_letter_01.pdf',
            'submited'),
            (2,
            '2025,05,20',
            true,
            'resume_02.pdf',
            false,
            NULL,
            'rejected'),
            (3,
            '2025,05,21',
            true,
            'resume_03.pdf',
            true,
            'cover_letter_03.pdf',
            'submited'),
            (4,
            '2025,05,22',
            true,
            'resume_04.pdf',
            true,
            'cover_letter_04.pdf',
            'submited'),
            (5,
            '2025,05,23',
            true,
            'resume_05.pdf',
            true,
            'cover_letter_05.pdf',
            'rejected')
            


ALTER TABLE job_applied RENAME COLUMN    jod_id TO job_id;

ALTER TABLE job_applied RENAME COLUMN    custum_resume TO custom_resume;

ALTER TABLE job_applied RENAME COLUMN    cover_letter_fike_name TO cover_letter_file_name;

ALTER TABLE job_applied RENAME COLUMN    applicayion_sent_date TO application_sent_date;


ALTER TABLE job_applied
ADD contact varchar (50) ;

UPDATE job_applied
SET    contact = 'Ali Ahmed'
Where  job_id = 1;

UPDATE job_applied
SET    contact = 'Ahmed'
Where  job_id = 2;

UPDATE job_applied
SET    contact = 'Ali'
Where  job_id = 3;

UPDATE job_applied
SET    contact = 'Henry'
Where  job_id = 4;

UPDATE job_applied
SET    contact = 'John'
Where  job_id = 5;

ALTER TABLE job_applied RENAME COLUMN    contact TO contact_name;

ALTER TABLE job_applied
ALTER COLUMN contac_name Type text;

ALTER TABLE job_applied
DROP COLUMN contact_name;

SELECT *
FROM job_applied;
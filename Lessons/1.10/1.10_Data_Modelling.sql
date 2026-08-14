SELECT
   job_id,
   job_title_short,
   salary_year_avg,
   company_id
FROM
   job_postings_fact   
LIMIT 10;

SELECT *
FROM information_schema.tables
WHERE table_catalog = 'data_jobs';

SELECT *
FROM information_schema.columns
WHERE table_catalog = 'data_jobs';
-- pks and fks are stored in the information_schema.key_column_usage table. You can use this table to find the primary and foreign keys for your tables.
-- PRAGMA table_info(table_name) is a SQLite command that returns information about the columns in a table. It can be used to find the primary and foreign keys for your tables.
PRAGMA show_tables;

PRAGMA show_tables_expanded;
DESCRIBE job_postings_fact;

/* JOINING TABLES.
   Types of joins: 
     INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, CROSS JOIN
   Inner join: returns only the rows that have matching values in both tables.
   Left join: returns all the rows from the left table, and the matched rows from the right table. If there is no match, the result is NULL on the right side.
   Right join: returns all the rows from the right table, and the matched rows from the left table. If there is no match, the result is NULL on the left side.
   Full outer join: returns all the rows when there is a match in either left or right table. If there is no match, the result is NULL on the side that does not have a match.  
   Cross join: returns the Cartesian product of both tables. It returns all possible combinations of rows from both tables.
*/
SELECT 
    jpf.job_id,
    cd.name AS company_name,
    cd.company_id,
    jpf.job_title_short

FROM
     job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
     ON jpf.company_id = cd.company_id         
-- LIMIT 10;
/*
in the above query, we are joining the job_postings_fact table with the company_dim table on the company_id column.
 We are selecting the job_id, company_name, and job_title_short columns from the joined tables. 
 The LEFT JOIN ensures that we get all job postings, even if there is no matching company in the company_dim table.
 left joit selects all records from the left table (job_postings_fact) and the matched records from the right table 
 (company_dim). If there is no match, the result is NULL on the right side. Its important to note that not all database systems support LEFT JOIN. 
 In such cases, you can achieve the same result using a RIGHT JOIN by
 */

SELECT *
FROM company_dim
LIMIT 10;

SELECT COUNT(*)
FROM job_postings_fact;

SELECT 
    jpf.job_id,
    cd.name AS company_name,
    cd.company_id,
    jpf.job_title_short,
    jpf.job_location
FROM
     job_postings_fact AS jpf
RIGHT JOIN company_dim AS cd
     ON jpf.company_id = cd.company_id         
-- LIMIT 10;

/*
in the above query, we are joining the job_postings_fact table with the company_dim table on the company_id column.
 We are selecting the job_id, company_name, job_title_short, and job_location columns from the joined tables. 
 The RIGHT JOIN ensures that we get all companies, even if there is no matching job posting in the job_postings_fact table.
 right join selects all records from the right table (company_dim) and the matched records from the left table 
 (job_postings_fact). If there is no match, the result is NULL on the left side. its important to note that not all database 
 systems support RIGHT JOIN. In such cases, you can achieve the same result using a LEFT JOIN by 
 switching the order of the tables in the join.
 */
SELECT 
    jpf.job_id,
    cd.name AS company_name,
    cd.company_id,
    jpf.job_title_short,
    jpf.job_location
FROM
     job_postings_fact AS jpf
INNER JOIN company_dim AS cd
     ON jpf.company_id = cd.company_id;
/* in the above query, we are joining the job_postings_fact table with the company_dim table on the company_id column.
 We are selecting the job_id, company_name, job_title_short, and job_location columns from the joined tables. 
 The INNER JOIN ensures that we only get job postings that have a matching company in the company_dim table.
 inner join selects only the records that have matching values in both tables. Is used to combine rows 
 from two or more tables based on a related column between them.
 */

SELECT 
    jpf.job_id,
    cd.name AS company_name,
    cd.company_id,
    jpf.job_title_short,
    jpf.job_location
FROM
     job_postings_fact AS jpf
FULL OUTER JOIN company_dim AS cd
     ON jpf.company_id = cd.company_id;
/* in the above query, we are joining the job_postings_fact table with the company_dim table on the company_id column.
 We are selecting the job_id, company_name, job_title_short, and job_location columns from the joined tables. 
 The FULL OUTER JOIN ensures that we get all job postings and all companies, even if there is no matching record in either table.
 full outer join returns all records when there is a match in either left or right table. If there is no match, 
 the result is NULL on the side that does not have a match. Its great for finding unmatched records in both tables. 
 Its important to note that not all database systems support FULL OUTER JOIN.
 */     

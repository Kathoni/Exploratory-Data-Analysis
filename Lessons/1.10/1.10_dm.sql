SELECT *
FROM skills_dim
LIMIT 10;

SELECT *
FROM skills_job_dim
LIMIT 10;

SELECT
   jpf.job_id,
   jpf.job_title_short,
   sjd.skill_id,
   sd.skills
FROM job_postings_fact AS jpf
LEFT JOIN skills_job_dim AS sjd
   ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim AS sd
   ON sjd.skill_id = sd.skill_id;
-- LIMIT 10;

SELECT
   jpf.job_id,
   jpf.job_title_short,
   sjd.skill_id,
   sd.skills
FROM job_postings_fact AS jpf
LEFT JOIN skills_job_dim AS sjd
   ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
   ON sjd.skill_id = sd.skill_id;
-- LIMIT 10;


/*
Find top 10 companies for posting jobs.
Theymust have >3000  postings
limit to only US jobs
*/
EXPLAIN ANALYZE  -- explanation is from bottom to top.
SELECT
  cd.name AS company_name,
  COUNT(jpf.*) AS posting_count
FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
  ON jpf.company_id = cd.company_id
WHERE jpf.job_country = 'United States'  
GROUP BY cd.name 
HAVING COUNT(jpf.*) > 3000
ORDER BY posting_count DESC
LIMIT 10;
/* order of execution: 
 FROM -> JOIN -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY -> LIMIT 
  */

  -- EXPLAIN DOES NOT EXECUTE THE QUERY, IT ONLY SHOWS THE PLAN.
  -- EXPLAIN ANALYZE EXECUTES THE QUERY AND SHOWS THE PLAN WITH TIMINGS.
SELECT *
FROM job_salary;

CREATE TABLE job_salary_staging
SELECT *
FROM job_salary;

SELECT *
FROM job_salary_staging;

SELECT count(*)
FROM job_salary_staging;

#Meslek meslek ortalama kazanç
SELECT job_title, AVG(salary) as avg_sal
FROM job_salary_staging
GROUP BY job_title
ORDER BY avg_sal DESC;


#Deneyim maaşı ne kadar etkiliyor?
SELECT experience_years, AVG(salary)
FROM job_salary_staging
GROUP BY experience_years
ORDER BY experience_years DESC;

#Eğitim maaşı ne kadar etkiliyor?
SELECT education_level, AVG(salary) as avg_sal
FROM job_salary_staging
GROUP BY education_level
ORDER BY avg_sal DESC;


#Lokasyon etkisi
SELECT location, AVG(salary) as avg_sal
FROM job_salary_staging
GROUP BY location
ORDER BY avg_sal DESC;

SELECT *
FROM job_salary_staging
WHERE location = "Remote";

#Şirket büyüklüğünün etkisi 
SELECT company_size, AVG(salary) as avg_sal
FROM job_salary_staging
GROUP BY company_size
ORDER BY avg_sal DESC;

#Skill arttıkça maaş artıyor mu?
SELECT skills_count, AVG(salary) as avg_sal
FROM job_salary_staging
GROUP BY skills_count
ORDER BY skills_count DESC;

#Remote çalışanlar daha mı fazla kazanıyor?
SELECT remote_work, AVG(salary) as avg_sal
FROM job_salary_staging
GROUP BY remote_work
ORDER BY remote_work DESC;

#“AI Engineer + 5 yıl” gibi net insight
SELECT job_title, experience_years, AVG(salary) as avg_sal
FROM job_salary_staging
GROUP BY job_title, experience_years
ORDER BY avg_sal DESC;


#Şirket büyüklüğünün etkisi işe göre
SELECT job_title, company_size, AVG(salary) as avg_sal
FROM job_salary_staging
GROUP BY job_title, company_size
ORDER BY job_title, avg_sal DESC ;


#Maaşı en çok etkileyen faktör ne?
SELECT AVG(salary) as avg_sal,
AVG(CASE WHEN remote_work = "Yes" THEN salary END) as remote_avg,
AVG(CASE WHEN education_level = "Bachelor" THEN salary END) as Bachelor_avg,
AVG(CASE WHEN experience_years >= 10 THEN salary END) as senior_avg
FROM job_salary_staging;

#Skill başına maaş Fazla skill gerçekten değerli mi yoksa diminishing return var mı?
SELECT skills_count, AVG(salary) as avg_sal, avg(salary)/skills_count as salary_perr_skill
FROM job_salary_staging
GROUP BY skills_count
ORDER BY skills_count;

#En hızlı yükselen kariyerler
SELECT job_title, MAX(salary)-MIN(salary) as salary_growth
FROM job_salary_staging
GROUP BY job_title
ORDER BY salary_growth DESC;

SELECT *
FROM job_salary_staging
WHERE job_title = "AI Engineer"
ORDER BY salary ASC;

#En değerli kombinasyon
SELECT job_title, experience_years, company_size, AVG(salary) as avg_sal
FROM job_salary_staging
GROUP BY job_title, experience_years, company_size
ORDER BY avg_sal DESC
LIMIT 20;


#Uçuk maaşlar. “ortalamanın çok üstündeki anormal maaşları bulur”
SELECT *
FROM job_salary_staging
WHERE salary >(
	SELECT AVG(salary) + 2*STDDEV(salary)
	FROM job_salary_staging);

#Experience level eklendi.
ALTER TABLE job_salary_staging
ADD experience_level VARCHAR(20);

UPDATE job_salary_staging
SET experience_level = 
  CASE 
    WHEN experience_years < 3 THEN 'Junior'
    WHEN experience_years < 7 THEN 'Mid'
    ELSE 'Senior'
  END;

#Experience levele göre ortalama maaş.
SELECT experience_level, AVG(salary)
FROM job_salary_staging
GROUP BY experience_level;


SELECT 
  job_title,
  experience_level,
  company_size,
  AVG(salary) AS predicted_salary
FROM job_salary_staging
GROUP BY job_title, experience_level, company_size;


#En çok kazandıran 10 kombinasyon
SELECT *
FROM (
  SELECT 
    job_title,
    experience_level,
    company_size,
    AVG(salary) AS avg_salary
  FROM job_salary_staging
  GROUP BY job_title, experience_level, company_size
) t
ORDER BY avg_salary DESC
LIMIT 10;


SELECT AVG(salary) AS predicted_salary
FROM job_salary_staging
WHERE job_title = 'Data Scientist'
AND experience_level = 'Mid'
AND company_size = 'Medium';
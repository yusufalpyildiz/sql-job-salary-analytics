# 💼 Job Salary SQL Analytics Project

## 📌 Overview
This project analyzes job salary data using SQL to extract insights about how different factors such as experience, education, skills, location, and company size affect salary levels.

The goal is to simulate a real-world data analytics study on salary prediction and career insights using structured SQL queries.

---

## 📊 Key Analysis Areas

### 💰 Salary by Job Role
- Average salary per job title
- Highest paying job roles

---

### 📈 Experience Impact
- Salary changes based on experience years
- Junior / Mid / Senior level segmentation
- Experience level creation using CASE statements

---

### 🎓 Education Impact
- Salary comparison by education level (High School, Bachelor, Master, PhD)

---

### 🌍 Location Analysis
- Remote vs on-site salary comparison
- Country-based salary differences

---

### 🏢 Company Size Effect
- Salary comparison between Small, Medium, and Enterprise companies
- Job role + company size combined impact

---

### 🧠 Skills Analysis
- Relationship between number of skills and salary
- Diminishing returns of skills vs salary increase

---

### 🚀 Advanced Insights

#### 🔥 High Salary Combinations
- Job title + experience level + company size combinations
- Top earning career paths

#### 📊 Salary Growth Analysis
- Difference between max and min salary per job role
- Fastest growing career roles

#### ⚠️ Outlier Detection
- Salaries significantly above dataset average (statistical anomaly detection using standard deviation)

---

## 🧮 SQL Techniques Used
- GROUP BY aggregations
- CASE WHEN logic
- Subqueries
- Window-style logic (manual ranking)
- Statistical functions (AVG, STDDEV)
- Data transformation (ALTER TABLE, UPDATE)
- Feature engineering (experience_level column)

---

## 🗂️ Data Engineering Steps
- Created staging table (`job_salary_staging`)
- Cleaned and structured dataset for analysis
- Added derived column: `experience_level`
- Standardized categorical variables

---

## 📌 Key Insights
- Experience level has the strongest impact on salary
- Company size significantly affects compensation
- Skills have diminishing returns after a certain point
- Remote work does not always guarantee higher salary
- Certain job + experience + company combinations dominate salary distribution

---

## 🚀 Advanced Feature
A simple salary prediction model using SQL:

- Job title
- Experience level
- Company size

This allows estimating expected salary for a given profile.

---

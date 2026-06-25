# WellTrack Analytics

This is an end-to-end wellness analytics pipeline built to demonstrate skills in data modelling, SQL, dbt, and business intelligence reporting — inspired by real-world requirements for a People/Clinical Analytics role.

---

## Project Overview

WellTrack Analytics simulates a corporate wellness program analytics solution for a fictional company. The project tracks employee enrollment, session engagement, program completion, and healthcare claim costs — delivering insights across three executive-facing dashboard pages in Power BI.

The project is structured around a job description for a Wellness Data Analyst role, with deliverables designed to mirror what an analyst would produce for a client like a benefits consultant or HR leadership team.

---

## Tools & Technologies

| Layer | Tool |
|---|---|
| Data Generation | Mockaroo |
| Database | PostgreSQL (pgAdmin) |
| Data Modelling | dbt (dbt-core) |
| Business Intelligence | Power BI |
| Version Control | Git & GitHub |

---

## Data Architecture

Raw data was generated using Mockaroo across four tables:

- `employees` — HR data including department and attrition status
- `health_claims` — claim amounts, categories, and pre/post enrollment period
- `program_enrollment` — program name, type, enrollment date, and completion status
- `wellness_sessions` — session records with completion status per employee

### dbt Model Layers

```
Raw (PostgreSQL)
    └── Staging          → stg_employees, stg_health_claims, stg_program_enrollment, stg_wellness_sessions
        └── Intermediate → int_engagement_metrics, int_wellness_outcomes
            └── Marts    → fct_member_journey, fct_roi_summary
```

---

## Dashboard Pages

### Page 1 — Executive Overview
Headline KPIs: Total Enrolled Employees, Program Completion Rate, Session Completion Rate, Active Participants

Charts: Enrollment by Department, Completion Status Breakdown (Donut), Session Completion Trend (Line)

### Page 2 — Program Performance
KPIs: Total Enrollments, Total Completed Sessions, Drop-off Rate, Employee Retention Rate

Charts: Completion Rate by Program Name, Sessions by Program Type (Clustered Bar), Program Type Distribution (Donut), Session Completion by Program Type (Line)

### Page 3 — ROI Analysis
KPIs: Avg Claim Cost (Completed), Avg Claim Cost (Dropped), Claim Cost Savings, Total Claims Filed

Charts: Avg Claim by Completion Status (Donut), Total Claim Cost by Department, Total Claim Cost by Period (Pre vs Post Enrollment), Claim Count by Completion Status

---

## DAX Measures

24 DAX measures were written across three categories:

- **12 core KPI measures** — counts, rates, averages, and savings calculations
- **12 trend comparison measures** — year-over-year (2022 vs 2023) and pre/post enrollment comparisons for trend indicators on KPI cards

---

## Key Insights

- Employees who completed the wellness program had lower average healthcare claim costs than those who dropped
- Program completion rate improved from 2022 to 2023, indicating stronger engagement over time
- Research & Development had the highest total claim costs by department
- Group Support programs showed the highest session completion rates across all program types

---

## Repository Structure

```
welltrack_analytics/
├── models/
│   ├── staging/
│   │   ├── stg_employees.sql
│   │   ├── stg_health_claims.sql
│   │   ├── stg_program_enrollment.sql
│   │   └── stg_wellness_sessions.sql
│   ├── intermediate/
│   │   ├── int_engagement_metrics.sql
│   │   └── int_wellness_outcomes.sql
│   └── marts/
│       ├── fct_member_journey.sql
│       └── fct_roi_summary.sql
├── Welltrack Analysis.pbix
├── dbt_project.yml
└── README.md
```
<img width="515" height="291" alt="image" src="https://github.com/user-attachments/assets/c30b049a-3b7f-4a28-bab0-a18e8c2af63a" />

---

## Author

**Mercy Adegunju**  
Data & BI Analyst  
[GitHub](https://github.com/Lolla-data-analyst) | [Portfolio](https://ma-portfolio-website.lovable.app)

# 📅 Day 8 - SQL Internship

**Author:** Sai Pradeep Kala  
**GitHub Username:** [pradeep240604](https://github.com/pradeep240604)  
**Email:** saipradeep2464@gmail.com  

---

## 📌 Topics Covered

- Subqueries in SQL
- Nested SELECT statements
- Correlated vs. Non-Correlated Subqueries
- Using subqueries in `SELECT`, `FROM`, and `WHERE` clauses

---

## 🛠️ Tasks

1. Write SQL queries using:
   - Single-row and multi-row subqueries
   - Subqueries inside `WHERE` to filter data
   - Subqueries to compare aggregated results
   - Correlated subqueries for dynamic row filtering

2. Real-world exercises:
   - Get employees earning more than the average salary
   - List products with sales above regional average
   - Identify students scoring above class average in each subject

---

## 🧪 Sample Query

```sql
SELECT name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);
```

---

## ✅ Output

> (Insert screenshots or result images here, if applicable.)

---

## 📚 Resources Used

- MySQL Workbench
- TutorialsPoint SQL Subqueries
- Internship-provided problem sets

---

## 📎 Notes

- Subqueries must return only **one value** when used with comparison operators (`=`, `>`, `<`, etc.)
- Use `IN`, `ANY`, `ALL` when expecting **multiple values** from subqueries.
- Correlated subqueries reference columns from the outer query.

---

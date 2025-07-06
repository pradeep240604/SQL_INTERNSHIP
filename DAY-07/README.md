# 📅 Day 7 - SQL Internship

**Author:** Sai Pradeep Kala  
**GitHub Username:** [pradeep240604](https://github.com/pradeep240604)  
**Email:** saipradeep2464@gmail.com  

---

## 📌 Topics Covered

- Use of `GROUP BY` and `HAVING` clauses
- Advanced filtering using `HAVING`
- Aggregate functions with conditions
- Real-world problem-solving using group data

---

## 🛠️ Tasks

1. Practice SQL queries involving:
   - Grouping of data
   - Conditional aggregation
   - Filtering grouped results with `HAVING`

2. Write and test SQL queries based on scenarios like:
   - Calculating total sales by region
   - Finding departments with more than a certain number of employees
   - Identifying students with average marks above a threshold

---

## 🧪 Sample Query

```sql
SELECT department, COUNT(*) AS num_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;
```

---

## ✅ Output

> Screenshots or result snippets can be added here for reference (optional).

---

## 📚 Resources Used

- MySQL Workbench
- W3Schools SQL Tutorial
- Intern-provided examples

---

## 📎 Notes

- Ensure that data is grouped correctly before applying conditions in `HAVING`.
- `HAVING` is applied **after** `GROUP BY`, unlike `WHERE`.

-

Absolutely, Nelisiwe! Here’s your refreshed and fully GitHub-friendly `README.md`, now including the latest query optimizations from your `performance.sql` file:

---

```markdown
# 🚀 Query Optimization & Indexing Report

## 🧠 Objective
Boost SQL query performance by:
- Creating indexes for high-usage columns.
- Refactoring expensive joins and large result sets.
- Analyzing query behavior using `EXPLAIN ANALYZE`.
- Applying filters and limits to reduce execution time.

---

## 📁 Files Submitted

- `database_index.sql` → Contains all `CREATE INDEX` commands.
- `index_performance.md` → Benchmarks before and after indexing.
- `performance.sql` → Query analysis and optimized versions.

---

## 🗂️ Indexes Created

### ✅ User Table
```sql
CREATE INDEX idx_user_user_id ON User(user_id);
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_created_at ON User(created_at);
```

### ✅ Booking Table
```sql
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
CREATE INDEX idx_booking_status ON Booking(status);
```

### ✅ Property Table
```sql
CREATE INDEX idx_property_property_id ON Property(property_id);
CREATE
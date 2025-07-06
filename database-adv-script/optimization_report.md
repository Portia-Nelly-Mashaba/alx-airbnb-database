# Query Optimization Report

## Performance Analysis

### Original Query Issues:
1. **Full table scans** on all joined tables
2. **No date filtering** - processing all historical data
3. **No result limiting** - retrieving unnecessary records
4. **Inefficient payment join** - joining all payment records

### Optimization Techniques Applied:

1. **Time-based Filtering**:
   ```sql
   WHERE b.start_date > DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
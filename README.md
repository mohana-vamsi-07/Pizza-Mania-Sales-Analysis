# 🍕 Pizza Mania Sales Analysis

A complete data analysis project using MySQL to explore and analyze pizza sales, understand customer patterns, and generate business insights.

---

## 🗂️ Dataset Structure
This project uses four CSV files:

### 1. `pizzas.csv`
| Column         | Description                                |
|----------------|--------------------------------------------|
| pizza_id       | Unique ID per pizza (e.g., bbq_ckn_l)      |
| pizza_type_id  | Type of pizza (e.g., bbq_ckn)              |
| size           | Pizza size (S, M, L, XL, XXL)              |
| price          | Price of that size                         |

### 2. `pizza_types.csv`
| Column         | Description                                |
|----------------|--------------------------------------------|
| pizza_type_id  | Unique ID (e.g., bbq_ckn)                  |
| pizza_name     | Full pizza name                            |
| category       | Category of pizza (classic, veggie, etc.)  |
| ingredients    | Comma-separated list of ingredients        |

### 3. `orders.csv`
| Column         | Description                                |
|----------------|--------------------------------------------|
| order_id       | Order number                               |
| date           | Order date (YYYY-MM-DD)                    |
| time           | Order time (HH:MM:SS)                      |

### 4. `order_details.csv`
| Column             | Description                            |
|--------------------|----------------------------------------|
| order_details_id    | Unique item in an order               |
| order_id            | Links to order                        |
| pizza_id            | Which pizza was ordered               |
| quantity            | How many were ordered                 |

---

## 📄 Database Schema with Cardinality

```
+---------------------+         +--------------------+         +-----------------------+
|    pizza_types      |         |       pizzas       |         |     order_details     |
|---------------------|         |--------------------|         |-----------------------|
| pizza_type_id (PK)  |◄────────┤ pizza_type_id (FK) |         | order_details_id (PK) |
| pizza_name          | 1     N | pizza_id (PK)      |◄────────┤ pizza_id (FK)         |
| category            |         | size               |         | order_id (FK)         |
| ingredients (multi) |         | price              |         | quantity              |
+---------------------+         +--------------------+         +-----------------------+
                                                                  ▲  N
                                                                  │
                                                              1   │
                                                          +------------------+
                                                          |      orders      |
                                                          |------------------|
                                                          | order_id (PK)    |
                                                          | date (DATE)      |
                                                          | time (TIME)      |
                                                          +------------------+
```

### Cardinality Explained:
- **pizza_types (1) → (N) pizzas**: One type of pizza can have multiple sizes.
- **pizzas (1) → (N) order_details**: A single pizza size can appear in many orders.
- **orders (1) → (N) order_details**: One order can contain multiple pizzas.

---

## 🏗️ How I Built This Project (Step-by-Step)

1. **Project Setup**  
   Created a GitHub repository and organized a `datasets/` folder for storing the CSV files.

2. **Created Database**  
   Used MySQL Workbench to create a new database called `PIZZAMANIA`.

3. **Designed Tables**  
   Wrote SQL DDL commands to define tables: `pizza_types`, `pizzas`, `orders`, and `order_details`.

4. **Imported Data**  
   Used the **MySQL Workbench Table Data Import Wizard** to import data from CSVs into the respective tables.

5. **Set Up Relationships**  
   Defined appropriate primary keys and foreign keys for enforcing referential integrity.

6. **Schema Validation**  
   Verified all table structures and relationships using ER diagrams and test queries.

7. **Optional Normalization**  
   Identified the `ingredients` column in `pizza_types` as violating 1NF, and designed a separate `ingredients` table with a many-to-many relationship using a junction table `pizza_ingredients`.

8. **Data Analysis**  
   Performed multiple levels of SQL queries to gather insights such as most popular pizzas, total revenue, peak times, and more.

9. **README Documentation**  
   Documented everything including schema, dataset structure, steps, questions, and best practices for GitHub.

---

## 📊 Analysis Questions

### 🟢 Basic Level
- How many total orders were placed?
- How many unique pizzas are available?
- What are the different pizza categories?
- What are the available pizza sizes?
- What is the total quantity of pizzas sold?
- What is the total revenue generated?
- Which pizza size is most ordered?
- What is the most popular pizza by number of orders?
- Which pizza category sells the most?
- What is the average number of pizzas per order?

### 🟡 Medium Level
- Which day of the week has the highest number of orders?
- What is the hourly distribution of orders (busiest time of day)?
- What is the average revenue per order?
- Which size generates the most revenue?
- What is the monthly sales trend across the year?
- What is the revenue per pizza category?
- What is the average quantity ordered per pizza type?
- Which pizza has the highest price per size?
- What is the distribution of orders by pizza category over time?
- Top 5 pizzas contributing to revenue?

### 🔴 Advanced Level
- What-if analysis: How will a 10% price increase affect revenue for the top 3 pizzas?
- Which pizza generates the most revenue per order frequency (revenue/order count)?
- What is the conversion rate of different pizza categories per month?
- Which combination of size and category yields the highest average revenue?
- Build a report of revenue growth trends quarterly and yearly.
- Identify anomalies or dips in revenue (potential supply issues).
- Create a customer segmentation profile based on time and order size (requires customer data).
- Which pizzas are frequently ordered together (market basket analysis)?
- Forecast sales for the next quarter based on time series (exported to external tools like Power BI or Python).

---

## 🧠 Performance/Industry Practices
- Use **indexes** on foreign keys (`order_id`, `pizza_id`)
- Optimize with **GROUP BY**, **JOIN**, and **CTEs**
- Use **views** for frequent dashboards
- Create **stored procedures** for reusable analytics
- Use **temporary tables** for large aggregation tasks

---

## 🧮 Operations You Can Perform

### ✅ Normalization
- Move `ingredients` to a separate table for 1NF compliance.

### 🔄 Denormalization (for reports)
- JOIN multiple tables into a reporting view for quick access.

### 📦 Grouping
- Analyze totals by category, size, month, etc.

### 🔗 Joining
- Combine `orders`, `order_details`, `pizzas`, and `pizza_types` for complete insights.

### 🔍 Filtering
- Apply WHERE clauses by size, category, date, quantity.

---

## 🧾 License
MIT License

---

## 🧑‍💻 Author
Built by Dharanikota Mohana Vamsi 🚀

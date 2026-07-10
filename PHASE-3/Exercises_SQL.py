from pyspark.sql import SparkSession
from pyspark.sql.functions import *
from pyspark.sql.window import *

spark = SparkSession.builder\
  .appName('Phase 3 ETL Pipeline')\
  .getOrCreate()

# Reading the files

customers = spark.read.csv("/samples/customers.csv",header = True)
sales = spark.read.csv("/samples/sales.csv", header = True)

# Displaying the files

customers.show()
sales.show()
customers.printSchema()
sales.printSchema()

# Cleaning the files

customers = customers.dropna(subset=["customer_id"])
sales = sales.dropna(subset=["customer_id"])
sales = sales.withColumn("total_amount",col("total_amount").cast("Double"))
sales = sales.withColumn("quantity", col("quantity").cast("int"))

# Creating views

customers.createOrReplaceTempView("customers")
sales.createOrReplaceTempView("sales")


# ==========================================
# Business Pipeline Exercises
# ==========================================

# Exercise-1 : calculate daily sales

print("Exercise-1:SQL:calculate daily sales")

spark.sql("""
select sale_date , sum(total_amount) as daily_sales
from sales
group by sale_date
order by sale_date
""").show()

# Exercise-2 :  city-wise revenue

print("Exercise-2:SQL:city-wise revenue")

spark.sql("""
select c.city , sum(s.total_amount) as total_revenue
from customers c left join sales s
on c.customer_id = s.customer_id
group by c.city
""").show()

# Exercise-3 : repeat customers (>2 orders)

print("Exercise-3: SQL: repeat customers (>2 orders)")

spark.sql("""
select customer_id , count(*) as orders
from sales
group by customer_id
having orders > 2
""").show()

# Exercise-4: highest spending customer in each city

print("Exercise-4:SQL: highest spending customer in each city")

spark.sql("""
select customer_id, first_name, last_name, city, total_spent
from (
    select c.customer_id, c.first_name, c.last_name,c.city,
    sum(s.total_amount) as total_spent,
    ROW_NUMBER() over(
        PARTITION BY c.city ORDER BY sum(s.total_amount) DESC
    ) as rn
    from customers c left join sales s
    on c.customer_id = s.customer_id
    group by c.customer_id,c.city,c.first_name,c.last_name
) t
where rn = 1
""").show()

# Exercise-5 : Final Reporting Table

print("Exercise-5: SQL : Final Reporting Table")

spark.sql("""
select c.customer_id,c.first_name,c.last_name,c.city,
sum(s.total_amount) as total_spent,
count(*) as total_orders
from customers c join sales s
on c.customer_id = s.customer_id
group by c.customer_id,c.first_name,c.last_name,c.city
order by total_spent DESC
""").show()

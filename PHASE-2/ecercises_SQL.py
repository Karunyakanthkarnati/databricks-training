from pyspark.sql import SparkSession
from pyspark.sql.functions import *
# Initialize Spark Session
spark = SparkSession.builder \
    .appName("PySpark Filtering Example") \
    .getOrCreate()

customers = spark.read.option("header", "true").csv("/samples/customers.csv")
orders = spark.read.option("header", "true").csv("/samples/sales.csv")
customers.show()
orders.show()
customers.printSchema()
orders.printSchema()
# Data Cleaning
customers = customers.dropna(subset=["customer_id"])
orders = orders.dropna(subset=["customer_id"])

orders = orders.withColumn('total_amount',col('total_amount').cast("double"))

# Creating views
customers.createOrReplaceTempView("customers")
orders.createOrReplaceTempView("orders")

# Exercise-1:Total order amount for each customer

print('Exercise-1:SQL')

spark.sql("""
select customer_id, sum(total_amount) as total_orders
from orders
group by customer_id
""").show()

# Exercise-2: Top 3 customers by total spend

print('Exercise-2:SQL')

spark.sql("""
select customer_id, sum(total_amount) as total_spend
from orders
group by customer_id
order by total_spend desc
limit 3
""").show()

#Exercise-3: Customers with no orders
print("Exercise-3:SQL")

spark.sql("""
select c.customer_id, c.first_name , c.last_name
from customers c left join orders o
on c.customer_id = o.customer_id
where o.customer_id is null
""").show()

#Exercise-4: City-wise total revenue
print("Exercise-4:SQL")

spark.sql("""
select c.city,sum(o.total_amount) as total_revenue
from customers c left join orders o
on c.customer_id = o.customer_id
group by c.city
""").show()

#Exercise-5:Average order amount per customer

print("Exercise-5:SQL")

spark.sql("""
select customer_id, avg(total_amount) as avg_amount
from orders
group by customer_id
""").show()

#Exercise-6:Customers with more than one order
print("Exercise-6:SQL")

spark.sql("""
select customer_id, count(*) as total_orders
from orders
group by customer_id
having total_orders > 1
""").show()

#Exercise-7: Sort customers by total spend descending
print("Exercise-7:SQL")

spark.sql("""
select customer_id,sum(total_amount) as total_spend
from orders
group by customer_id
order by total_spend desc
""").show()

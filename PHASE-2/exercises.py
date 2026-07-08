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

# Exercise-1:Total order amount for each customer

print('Exercise-1:Pyspark')
df1 = orders.groupby('customer_id').\
agg(sum("total_amount").alias("total_orders")).show()

# Exercise-2: Top 3 customers by total spend

print('Exercise-2:Pyspark')

df2 = orders.groupby("customer_id").\
agg(sum("total_amount").alias("total_spend")).\
orderBy(desc("total_spend")).limit(3).show()

#Exercise-3: Customers with no orders

print("Exercise-3:Pyspark")

df3 = customers.join(orders, "customer_id" , "left").\
filter(orders.customer_id.isNull()).\
select(
  customers.customer_id,
  customers.first_name,
  customers.last_name
).show()

#Exercise-4: City-wise total revenue

print("Exercise-4:Pyspark")

customers.join(orders,"customer_id","left").\
groupby(customers.city).\
agg(sum(orders.total_amount).alias("total_revenue")).show()

#Exercise-5:Average order amount per customer

print("Exercise-5:Pyspark")

orders.groupby(col("customer_id")).\
agg(avg("total_amount").alias("avg_amount")).show()

#Exercise-6:Customers with more than one order

print("Exercise-6:Pyspark")

orders.groupby(col('customer_id')).\
agg(count("*").alias("total_orders")).\
filter(col("total_orders")>1).show()

#Exercise-7: Sort customers by total spend descending

print("Exercise-7:Pyspark")

orders.groupBy("customer_id").\
agg(sum("total_amount").alias("total_spend")).\
orderBy(desc("total_spend")).show()

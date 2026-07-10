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


# ==========================================
# Business Pipeline Exercises
# ==========================================

# Exercise-1 : calculate daily sales

print("Exercise-1:Pyspark:calculate daily sales")

daily_sales = sales.groupBy("sale_date")\
.agg(sum(col("total_amount")).alias("daily_sales"))\
.orderBy("sale_date")
daily_sales.show()

# Exercise-2 :  city-wise revenue

print("Exercise-2:Pyspark:city-wise revenue")

city_revenue = customers.join(sales,"customer_id" , "left")\
.groupBy(customers.city).agg(sum("total_amount").alias("total_revenue"))

city_revenue.show()

# Exercise-3 : repeat customers (>2 orders)

print("Exercise-3:Pyspark: repeat customers (>2 orders)")

repeat_customers = sales.groupBy("customer_id")\
.agg(count("*").alias("orders")).filter(col("orders") > 2)
repeat_customers.show()

# Exercise-4: highest spending customer in each city

print("Exercise-4:Pyspark: highest spending customer in each city")

customer_spend = customers.join(sales, "customer_id", "left")\
.groupBy("customer_id","first_name","last_name","city")\
.agg(sum("total_amount").alias("total_spent"))
window = Window.partitionBy("city").orderBy(desc("total_spent"))
highest_spend = customer_spend.withColumn("rank", row_number().over(window))\
.filter(col("rank") == 1).drop("rank")
highest_spend.show()

# Exercise-5 : Final Reporting Table

print("Exercise-5: Pyspark : Final Reporting Table")

final_report = customers.join(sales, "customer_id")\
.groupBy("customer_id","first_name","last_name","city")\
.agg(sum("total_amount").alias("total_spent"),
    count("*").alias("total_orders"))\
.orderBy(desc("total_spent"))
final_report.show()
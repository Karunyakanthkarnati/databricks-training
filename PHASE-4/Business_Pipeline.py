from pyspark.sql import SparkSession
from pyspark.sql.functions import *
from pyspark.sql.types import *

spark = SparkSession.builder\
.appName("Spark Playground")\
.getOrCreate()

# Reading the files

customers = spark.read.csv("/samples/customers.csv",header = True)
sales = spark.read.csv("/samples/sales.csv",header = True)

# Displaying the files

customers.show()
sales.show()
customers.printSchema()
sales.printSchema()

# Cleaning the files

customers = customers.dropna(subset = ["customer_id"])
sales = sales.dropna(subset = ["customer_id"])

customers = customers.dropDuplicates()
sales = sales.dropDuplicates()

sales = sales.withColumn("sale_date",to_date("sale_date"))\
.withColumn("quantity",col("quantity").cast("int"))\
.withColumn("total_amount",col("total_amount").cast("double"))

sales = sales.filter((col("total_amount") >= 0) & (col("quantity") > 0))

# Task 1: Daily Sales

print("Task 1: Daily Sales")

daily_sales = sales.groupBy("sale_date")\
.agg(sum("total_amount").alias("total_sales"))\
.orderBy(asc("sale_date"))
daily_sales.show()

# Task 2: City-wise Revenue

print("Task 2: City-wise Revenue")

city_revenue = customers.join(sales,"customer_id","left")\
.groupBy("city").agg(sum("total_amount").alias("total_revenue"))
city_revenue.show()

# Task 3 : Top 5 Customers

print("Task 3 : Top 5 Customers")
top_customers = customers.join(sales,"customer_id")\
.withColumn("customer_name", concat_ws(" ",col("first_name"),col("last_name")))\
.groupBy("customer_name")\
.agg(sum("total_amount").alias("total_spent"))\
.orderBy(desc("total_spent")).limit(5)
top_customers.show()

# Task 4: Repeat Customers (>1 order)

print("Task 4: Repeat Customers (>1 order)")

repeat_customers = sales.groupBy("customer_id")\
.agg(count("*").alias("order_count"))\
.orderBy(desc("order_count")).filter(col("order_count") > 1)
repeat_customers.show()

# Task 5 : Customer Segmentation

print("Task 5 : Customer Segmentation")

customer_spent = customers.join(sales,"customer_id")\
.withColumn("customer_name", concat_ws(" ","first_name","last_name"))\
.groupBy("customer_name").agg(sum("total_amount").alias("total_spend"))\
.orderBy(desc("total_spend"))
customer_segment = customer_spent\
.withColumn("segment",when(col("total_spend") > 10000,"Gold")\
           .when(col("total_spend") > 5000,"Silver")\
           .otherwise("Bronze"))\
.select("customer_name","total_spend","segment")
customer_segment.show()

# Task 6 : Final Reporting Table

print("Task 6 : Final Reporting Table")

final_df = customers.join(sales,"customer_id")\
.withColumn("customer_name",concat_ws(" ","first_name","last_name"))\
.groupBy("customer_name","city")\
.agg((sum("total_amount").alias("total_spend")),\
     count("sale_id").alias("order_count"))\
.withColumn("segment",when(col("total_spend") > 10000, "Gold")\
           .when(col("total_spend") > 5000, "Silver")\
           .otherwise("Bronze"))\
.select("customer_name","city","total_spend","order_count","segment")
final_df.show()

# Task 7: Save Output

print("Task 7: Save Output")

final_df.write.mode('overwrite').csv('/samples/output/report')

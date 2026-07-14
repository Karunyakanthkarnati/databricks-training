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

final_df = customers.join(sales,"customer_id")\
.withColumn("customer_name",concat_ws(" ","first_name","last_name"))\
.groupBy("customer_id","customer_name","city")\
.agg((sum("total_amount").alias("total_spend")),\
     count("sale_id").alias("order_count"))\
.orderBy(desc("total_spend"))
final_df.show()

# Create Gold/Silver/Bronze segmentation using conditional logic

print("Task-1: Create Gold/Silver/Bronze segmentation using conditional logic")

segment_df = final_df.withColumn("segment",when(col("total_spend") > 10000, "Gold")\
           .when(col("total_spend") > 5000, "Silver")\
           .otherwise("Bronze"))
segment_df.show()
# Group data by segment and count customers

print("Task-2: Group data by segment and count customers")

segment_count = segment_df.groupBy("segment").agg(count("*").alias("count"))
segment_count.show()

#  Try quantile-based segmentation

print("Task-3: Try quantile-based segmentation")

quantiles = final_df.approxQuantile("total_spend",[0.33,0.66],0)
q1 = quantiles[0]
q2 = quantiles[1]

quantiles_df = final_df.withColumn("quantiles_segment",\
                                  when(col("total_spend") > q2,"Gold")\
                                  .when( (col("total_spend") >= q1) &
        (col("total_spend") <= q2),"Silver")\
                                  .otherwise("Bronze"))
quantiles_df.show()

# comparing results

print("Task-4: comparing results")

comparison_df = segment_df.join(
    quantiles_df.select("customer_name", "quantiles_segment"),
    "customer_name"
)

comparison_df.select(
    "customer_name",
    "total_spend",
    "segment",
    "quantiles_segment"
).show()
from pyspark.sql.functions import mean, max, min, col, count
from pyspark.sql import SparkSession

spark = (
    SparkSession.builder.appName(“ExerciseSpark”)
	.getOrCreate()
)

enem = (
    spark
    .read
    .format(“csv”)
    .option(“header”)
    .option(“inferSchema”, True)
    .option(“delimiter”, “;”)
    .load(“s3://datalake-fabio-422471183879/raw-data/enem/”)
)

(
	enem
	.write
	.mode(“overwrite”)
	.format(“parquet”)
	.partitionBy(“year”)
	.save(“s3://datalake-fabio-422471183879/consumer-zone/enem”)
)

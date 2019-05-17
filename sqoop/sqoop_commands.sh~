# simple import , sequential as m 1 ( mappers = 1)
sqoop import --connect jdbc:mysql://localhost/sqooptest --username root --password cloudera --table person --target-dir /user/cloudera/person_out -m 1
# split by column name while import . This will decide the number of mappers and reducers
sqoop import --connect jdbc:mysql://localhost/sqooptest --username root --password cloudera --table person --target-dir /user/cloudera/person_out --split-by id
# option to overwrite
sqoop import --connect jdbc:mysql://localhost/sqooptest --username root --password cloudera --table person --target-dir /user/cloudera/person_out --split-by id --delete-target-dir 
# writing into hive table - --hive-import option is important
sqoop import --connect jdbc:mysql://localhost/sqooptest --username root --password cloudera --table person --hive-import --create-hive-table --hive-table person_sqoop --hive-database patientinfo --split-by id;
# writing as avro file
sqoop import --connect jdbc:mysql://localhost/sqooptest --username root --password cloudera --table person --as-avrodatafile --split-by id;
# using direct option (i.e) mysql driver wont be used
sqoop import --connect jdbc:mysql://localhost/sqooptest --username root --password cloudera --table person --split-by id --direct --delete-target-dir
# incremental import 
sqoop import --connect jdbc:mysql://localhost/sqooptest --username root --password cloudera --table person --incremental append --last-value  1 --check-column id  --split-by id --direct 
# incremental import - hive table
sqoop import --connect jdbc:mysql://localhost/sqooptest --username root --password cloudera --table person --hive-import  --hive-table person_sqoop --hive-database patientinfo --split-by id --incremental append --last-value  1 --c
# Free form query - select clause should have a $CONDITIONS
sqoop import --connect jdbc:mysql://localhost/sqooptest --username root --password cloudera --query 'select * from person WHERE $CONDITIONS'  -m 1 --target-dir '/user/cloudera/person_cloudera'
# Using AND to mention explicit conditions
sqoop import --connect jdbc:mysql://localhost/sqooptest --username root --password cloudera --query 'select * from person WHERE $CONDITIONS AND id=3'  -m 1 --target-dir '/user/cloudera/person_cloudera2'
# Using WHERE clause
sqoop import --connect jdbc:mysql://localhost/sqooptest --username root --password cloudera --table person --where "id > 1"  -m 1 --target-dir '/user/cloudera/person_cloudera3'

# Sqoop compression
sqoop import --connect jdbc:mysql://localhost/sqooptest --username root --password cloudera --table person --target-dir /user/cloudera/person_out2 -m 1 --compression-codec "org.apache.hadoop.io.compress.SnappyCodec" -compress
sqoop import --connect jdbc:mysql://localhost/sqooptest --username root --password cloudera --table person --target-dir /user/cloudera/person_out3 -m 1 --compression-codec "org.apache.hadoop.io.compress.Lz4Codec" -compress

# Exporting from HDFS to MYSQL DB
sqoop export --connect jdbc:mysql://localhost/sqooptest --username root --password cloudera --table person2 --export-dir "/user/cloudera/person_cloudera3"


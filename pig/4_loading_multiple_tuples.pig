--pig -x local -l /home/cloudera/projects/ApacheSpark/pig/LOGS/4_loading_multiple_tuples.pig
input_records = LOAD 'DATA/data4.txt' USING PigStorage ('\t') as pi:tuple(name:chararray,age:chararray);
DUMP input_records;


--pig -x local -l /home/cloudera/projects/ApacheSpark/pig/LOGS/ 2_loading_complex_data.pig
input_records = LOAD 'DATA/data2.txt' USING PigStorage ('\t') as (id:int,name:chararray,place:chararray,sports:tuple(game1:chararray));
DUMP input_records;


--pig -x local -l /home/cloudera/projects/ApacheSpark/pig/LOGS/3_loading_map_data.pig
input_records = LOAD 'DATA/data3.txt' USING PigStorage ('\t') as (english:map[],tamil:map[]);
DUMP input_records;


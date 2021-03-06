--pig -x local -l /home/cloudera/projects/ApacheSpark/pig/LOGS/ 1_loading_data.pig
A = LOAD 'DATA/data7.txt' USING PigStorage (',') as (id:int,name:chararray,place:chararray);
B = LOAD 'DATA/data8.txt' USING PigStorage (',') as (id:int,living:chararray);
C = JOIN A BY id, B BY id;
-- C = JOIN A BY id LEFT OUTER, B BY id;
-- C = JOIN A BY id FULL OUTER, B BY id;
-- C = JOIN A BY id INNER, B BY id;
-- C = JOIN A BY id RIGHT OUTER,B BY id;

D = FOREACH C GENERATE A::id,A::name,B::living;
DUMP D;






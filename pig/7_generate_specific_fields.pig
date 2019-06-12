--pig -x local -l /home/cloudera/projects/ApacheSpark/pig/LOGS/ 1_loading_data.pig
A = LOAD 'DATA/data7.txt' USING PigStorage (',') as (id:int,name:chararray,place:chararray);
B = FOREACH A GENERATE id,name;
DUMP B;

-- GENERATE statements
A = LOAD 'DATA/data7.txt' USING PigStorage (',') as (id:int,name:chararray,place:chararray);
B = GROUP A all ;
C = FOREACH B GENERATE SUM(A.id); 
-- C = FOREACH B GENERATE COUNT(A.id); 
-- C = FOREACH B GENERATE MIN(A.id) as ids;
-- C = FOREACH B GENERATE MAX(A.id) as ids;  
-- C = FOREACH B GENERATE MAX(A.id),1 as ids;  
-- C = FOREACH B GENERATE MAX(A.id),1 as (ids:int)
-- C = FOREACH B GENERATE MAX(A.id) as ids,1 as (value:int);
DUMP C;


-- FILTER statments
A = LOAD 'DATA/data7.txt' USING PigStorage (',') as (id:int,name:chararray,place:chararray);
B = FILTER A BY (id == 1);
-- B = FILTER A BY NOT(id == 1);
-- B = FILTER A BY (name == '"kavin"');
-- B = FILTER A BY (place == 'kotagiri');
-- B = FILTER A BY (place matches 'kot.*');
DUMP B;


-- DISTINCT 
A = LOAD 'DATA/data7.txt' USING PigStorage (',') as (id:int,name:chararray,place:chararray);
B = DISTINCT A;





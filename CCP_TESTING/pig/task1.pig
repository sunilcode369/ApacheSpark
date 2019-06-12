A = LOAD './data1.txt' using PigStorage(',') as (ID:int,name:chararray,location:chararray);
B = FILTER A BY location is not NULL;
C = FOREACH B GENERATE B.ID,B.name,B.location;


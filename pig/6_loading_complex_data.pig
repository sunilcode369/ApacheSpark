--pig -x local -l /home/cloudera/projects/ApacheSpark/pig/LOGS/4_loading_multiple_tuples.pig
---1	sunil	kotagiri	[English#100]	(maths,physics,chemistry)	{(GCT,PSG,CIT),(KCT,MCT,HCT)}
input_records = LOAD 'DATA/data6.txt' USING PigStorage ('\t') as (id:int,name:chararray,location:chararray,highest:map[],cutoff:tuple(sub1:chararray,sub2:chararray,sub3:chararray),colleges:bag{CBE:tuple(pref1:chararray,pref2:chararray,pref3:chararray)});
DUMP input_records;


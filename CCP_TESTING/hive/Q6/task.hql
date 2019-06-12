--
--dfs -copyFromLocal ./2_log_data.csv /user/cloudera/ccp/.;
--July  3 07:10:54 hadoopexam.com_node01 init: tty (/dev/tty6) main process (1208) killed by TERM signal

drop table log_temp;

CREATE TABLE IF NOT EXISTS log_temp(MONTH STRING, DATE STRING,TIMEINFO STRING, URL STRING, PROCESSINFO STRING, message STRING)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.RegexSerDe'
WITH SERDEPROPERTIES (
  "input.regex" = "([^ ]*)  ([^ ]*) ([^ ]*) ([^ ]*) ([^ ]*) (.*)",
  "output.format.string" = "%1$s %2$s %3$s %4$s %5$s %6$s"
);

LOAD DATA LOCAL INPATH '*.log' OVERWRITE INTO TABLE log_temp ;

drop table log_ext;

CREATE TABLE log_ext (TIMEINFO STRING, URL STRING, PROCESSINFO STRING, message STRING)  PARTITIONED BY (MONTH STRING, DATE STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;


INSERT INTO TABLE log_ext partition(MONTH='Jun',DATE='15')  select TIMEINFO , URL , PROCESSINFO , message from log_temp where  MONTH="Jun" AND DATE="3";
INSERT INTO TABLE log_ext partition(MONTH='Jun',DATE='16')  select TIMEINFO , URL , PROCESSINFO , message from log_temp where  MONTH="Jun" AND DATE="3";
INSERT INTO TABLE log_ext partition(MONTH='Jul',DATE='15')  select TIMEINFO , URL , PROCESSINFO , message from log_temp where  MONTH="Jul" AND DATE="3";
INSERT INTO TABLE log_ext partition(MONTH='Jul',DATE='16')  select TIMEINFO , URL , PROCESSINFO , message from log_temp where  MONTH="Jul" AND DATE="3";


set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

drop table log_managed ;

CREATE TABLE log_managed (TIMEINFO STRING, URL STRING, PROCESSINFO STRING, message STRING)  PARTITIONED BY (MONTH STRING, DATE STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;

INSERT INTO TABLE log_managed  partition(MONTH,DATE)  select TIMEINFO , URL , PROCESSINFO , message, MONTH, DATE from log_temp ;






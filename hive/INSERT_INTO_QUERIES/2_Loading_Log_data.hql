--
dfs -copyFromLocal ./2_log_data.csv /user/cloudera/ccp/.;

CREATE TABLE IF NOT EXISTS logdata( HOST STRING, IDENTITY STRING, USER STRING, timea STRING,request STRING, status STRING, size STRING  )
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ' '
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;

LOAD DATA INPATH '/user/cloudera/ccp/2_log_data.csv' INTO TABLE logdata;




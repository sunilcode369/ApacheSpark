DROP table q4_TEMP;
CREATE TABLE IF NOT EXISTS q4_TEMP(FirstName STRING, LastName STRING,EMPID STRING,LoggedInDate INT,JoiningDate INT,DeptId STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
tblproperties ("skip.header.line.count"="1");


LOAD DATA LOCAL INPATH './q4.txt' INTO TABLE q4_TEMP;

DROP table q4;

CREATE TABLE q4 AS SELECT FirstName, LastName , EMPID , LoggedInDate, 20190611 , DeptId from q4_TEMP GROUP BY FirstName, LastName , EMPID , LoggedInDate,  DeptId;

DROP table q4_TEMP;



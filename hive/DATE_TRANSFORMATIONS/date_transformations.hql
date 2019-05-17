--converting into timestamp
select unix_timestamp(dob,'dd-MM-yyyy') from person_dob; 

--converting timestamp to required format
select from_unixtime(unix_timestamp(dob,'dd-MM-yyyy'),'yyyy-MM-dd') from person_dob;
select from_unixtime(unix_timestamp(dob,'dd-MM-yyyy'),'MM/dd/yyyy') from person_dob;

--get year // date needs to be in yyyy-MM-dd format
select year(from_unixtime(unix_timestamp(dob,'dd-MM-yyyy'),'yyyy-MM-dd')) from person_dob;

--get month // date needs to be in yyyy-MM-dd format
select month(from_unixtime(unix_timestamp(dob,'dd-MM-yyyy'),'yyyy-MM-dd')) from person_dob;


--datediff(string enddate, string startdate)
select datediff(from_unixtime(unix_timestamp(dob,'dd-MM-yyyy'),'yyyy-MM-dd'),"2000-01-01") from person_dob;

--converting to timestamp
select to_utc_timestamp(unix_timestamp(dob,'dd-MM-yyyy'),"IST") from person_dob;

-- date format function - similar to from_unixtime
select date_format(from_unixtime(unix_timestamp(dob,'dd-MM-yyyy'),'yyyy-MM-dd'),'yyyy-MM-dd') from person_dob; 

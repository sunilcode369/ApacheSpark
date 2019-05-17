-- simple FULL join or INNER JOIN  query
select a.id,a.name,b.address.city,b.phone from PERSON_NAME a JOIN PERSON_ADDRESS b ON a.id = b.id;

-- Full outer join
select a.id,a.name,b.address.city,b.phone from PERSON_NAME a FULL OUTER JOIN PERSON_ADDRESS b ON a.id = b.id;

-- Left outer join
select a.id,a.name,b.address.city,b.phone from PERSON_NAME a LEFT OUTER JOIN PERSON_ADDRESS b ON a.id = b.id;

-- Right outer join
select a.id,a.name,b.address.city,b.phone from PERSON_NAME a RIGHT OUTER JOIN PERSON_ADDRESS b ON a.id = b.id;

-- Negation of Join - fetch rows which are not equal - typically a cartesion product ( There wont be any id matches )
select a.id,a.name,b.address.city,b.phone from PERSON_NAME a CROSS JOIN PERSON_ADDRESS b;

--DISTINCT values
select DISTINT(b.address.city) from PERSON_ADDRESS

-- Map side join
select /*+ MAPJOIN(b) */  a.id,a.name,b.address.city,b.phone from PERSON_NAME a JOIN PERSON_ADDRESS b ON a.id = b.id;


--Order BY --> End of the reducer, takes long time
select a.name from PERSON_NAME a ORDER BY a.name;

-- Each chunk is sorted before sending it to reducer. If there are multiple reducers, then the output will not be a sorted output. However, 1 reducer output will be sorted
select a.name from PERSON_NAME a SORT BY a.name;

-- Each chunk is distributed by hash functions before sending it to multiple reducer
select a.name from PERSON_NAME a DISTRIBUTE BY a.name ;

-- Distributes to multiple reduces and finally sorts those distribution
select a.name from PERSON_NAME a DISTRIBUTE BY a.name SORT BY a.name;;

--or Cluster by - which is equivalent to distribute by and sort by
select a.name from PERSON_NAME a CLUSTER BY a.name;

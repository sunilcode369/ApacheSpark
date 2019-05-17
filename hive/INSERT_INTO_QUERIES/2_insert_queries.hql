-- 
INSERT INTO PERSON_NEW SELECT * FROM PERSON;

--overwrite
INSERT OVERWRITE TABLE PERSON_NEW SELECT * FROM PERSON where ID=2;

-- with clause
with t as (select * from person where name ="DEEPA") select * from person_new x,t where t.name=x.name;

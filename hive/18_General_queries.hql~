-- Basic stats
select sum(id) from person_part_bucket;
select avg(id) from person_part_bucket;


-- String formatting
select upcase(name) from person_part_bucket;
select lower(name) from person_part_bucket;



-- Complex Data Formats
select array(name) from person_part_bucket ;
select map(id,name) from person_part_bucket ;
select struct(name) from person_part_bucket ;
select named_struct("id",name) from person_part_bucket ;
-- union type to be explored


-- Selecting from complex type
select phone[0] from person_part_bucket;
select address.street1 from person;
select banks_balance["AXIS"] from person_part_bucket;



-- size and length of elements
select size(banks_balance) from person_part_bucket;
select length(name) from person_part_bucket where name is null;
select size(phone) from person_part_bucket;


-- Map elements retriveal 
select map_keys(banks_balance) from person_part_bucket;
select map_values(banks_balance) from person_part_bucket;
select sort_array(phone) from person_part_bucket;
select array_contains(phone,"7094792597") from person_part_bucket;


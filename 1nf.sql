--1nf

--split the "ability" column and then create the split_abilities table 
CREATE TABLE split_abilities AS 
SELECT *, TRIM(value) AS split_value 
FROM importpokemon, JSON_EACH('["'|| REPLACE(abilities, ',', '","') || '"]') 
WHERE split_value <> '';


--drop the unccessary columns, not sure why they showed up
ALTER TABLE split_abilities DROP COLUMN "key";
alter table split_abilities DROP COLUMN value;
alter table split_abilities drop column type;
alter table split_abilities drop column parent;
alter table split_abilities drop column fullkey;
alter table split_abilities drop column path;
alter table split_abilities drop column id;
alter table split_abilities drop column atom;
alter table split_abilities drop column abilities;



















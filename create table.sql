#create table with values an columns#

CREATE TABLE my_contacts
(
contact_id INT NOT NULL AUTO_INCREMENT,
last_name VARCHAR(30) default NULL,
first_name VARCHAR(20) default NULL,
email VARCHAR(50) default NULL,
gender CHAR(1) default NULL,
birthday DATE default NULL,
profession VARCHAR(50) default NULL,
location VARCHAR(50) default NULL,
status VARCHAR(20) default NULL,
interests VARCHAR(100) default NULL,
seeking VARCHAR(100) default NULL,
PRIMARY KEY (contact_id)
);
#table changes#
SELECT * FROM gregs_list.my_contacts;
ALTER TABLE my_contacts
ADD column prof_id INT(3) AFTER seeking;

ALTER TABLE my_contacts
ADD CONSTRAINT fk_prof_my_contacts FOREIGN KEY (prof_id)
REFERENCES profession(prof_id);

ALTER TABLE my_contacts
ADD column zip_code INT(3) AFTER prof_id;

ALTER TABLE my_contacts
ADD CONSTRAINT fk_zip_my_contacts FOREIGN KEY (zip_code)
REFERENCES zip_code (zip_code);

ALTER TABLE my_contacts
ADD column status_id INT(3) AFTER zip_code;

ALTER TABLE my_contacts
ADD CONSTRAINT fk_status_my_contacts FOREIGN KEY (status_id)
REFERENCES status (status_id);

alter table my_contacts
add column state char(3) after location;

UPDATE my_contacts
SET state = RIGHT(location, 2);

alter table my_contacts
add column city varchar(25) after location;

UPDATE my_contacts
SET city = substring_index(location,',',1);

alter table my_contacts
drop column location;


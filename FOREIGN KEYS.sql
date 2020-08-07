USE gregs_list;

#creating TABLES #
create table job_current
(
contact_id int(3) not null,
title varchar(25) default null,
salary int(5) default null,
start_date date
);

create table job_desired
(
contact_id int(3) not null,
title varchar(25) default null,
salary_low int(5) default null,
salary_high int(5) default null,
available varchar(10) default null,
years_exp int(2) default null
);

create table job_listings
(
job_id int(3) not null,
title varchar(25) default null,
salary int(5) default null,
zip varchar(10) default null,
description varchar(20) default null
);
#ADDING FOREIGN KEYS#
ALTER TABLE my_contacts
ADD column job_current INT(3) AFTER status_id;

ALTER TABLE job_current 
ADD CONSTRAINT fk_job_current_my_contacts FOREIGN KEY (contact_id)
REFERENCES my_contacts(contact_id);

ALTER TABLE my_contacts
ADD column job_desired INT(3) AFTER job_current;

ALTER TABLE job_desired
ADD CONSTRAINT fk_job_desired_my_contacts FOREIGN KEY (contact_id)
REFERENCES my_contacts(contact_id);

#foreign key job listings#
ALTER TABLE job_desired
ADD CONSTRAINT fk_job_desired_my_contacts FOREIGN KEY (contact_id)
REFERENCES my_contacts(contact_id);

ALTER TABLE job_desired
add column job_id int(3) after years_exp;

ALTER TABLE job_desired
ADD CONSTRAINT fk_job_desired_listings FOREIGN KEY (job_id)
REFERENCES job_listings(job_id);


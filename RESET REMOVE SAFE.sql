
#RESET#

#REMOVE SAFE MODE#
SET SQL_SAFE_UPDATES= 0;
SET SQL_MODE = '';

set sql_mode=(select REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY','')
);

#truncate - DELETE#
truncate job_listings;

#INSERT INTO# 
INSERT INTO zip_code (city, state)
SELECT city, state FROM my_contacts
where (city and state) is not null
GROUP BY city
ORDER BY city;





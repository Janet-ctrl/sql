# queries and sub queries#
SELECT mc.first_name, mc.last_name, jc.title
FROM job_current AS jc NATURAL JOIN my_contacts AS mc
WHERE
jc.title IN ('cook', 'Hairdresser', 'Waiter', 'Web Designer', 'Web Developer');

SELECT mc.first_name, mc.last_name, jc.title
FROM job_current AS jc NATURAL JOIN my_contacts AS mc
WHERE jc.title IN (SELECT title FROM job_listings);

SELECT mc.first_name AS firstname, mc.last_name AS lastname, jc.title AS title
FROM job_current AS jc NATURAL JOIN my_contacts AS mc
WHERE title IN (SELECT title FROM job_listings);

SELECT mc.first_name AS firstname, mc.last_name AS lastname, i.interest AS interest
FROM interests AS i NATURAL JOIN my_contacts AS mc
WHERE interest IN (SELECT interest FROM interests);

SELECT mc.first_name, mc.last_name
FROM my_contacts AS mc
WHERE 2 = (   	#results how many has 2 interests#
SELECT COUNT(*) FROM contact_interest  #counts the interest of each contact#
WHERE contact_id = mc.contact_id
);



#exists and not exists# 
SELECT mc.first_name firstname, mc.last_name lastname, mc.email email
FROM my_contacts mc
WHERE not EXISTS  
(SELECT * FROM contact_interest ci WHERE mc.contact_id = ci.contact_id );

#substrings#alter
UPDATE my_contacts SET
interest1 = SUBSTRING_INDEX(interests, ',', 1),
interests = SUBSTR(interests, LENGTH(interest1)+2),
interest2 = SUBSTRING(interests,',',1),
interests = SUBSTR(interests, LENGTH(interest2)+2),
interest3 = SUBSTRING(interests,',',1),
interests = SUBSTR(interests, LENGTH(interest3)+2 ),
interest4 = interests;


#insert into#
insert into interests(interest)
select interest1 from my_contacts
where interest1 IS NOT NULL or ''
group by interest1
order by interest2;

INSERT INTO job_listings
(title, salary, zip, description)
values
('Artist',390000,'CA','back drop painter'),
('Computer programmer',680000,'TX', 'user interface designer'),
('Technical writer',570000,'CA','engineering lab assistant'),
('Software Sales',62000,'NJ', 'telemarket'),
('Web Designer',400000,'CA','designing client websites');

INSERT INTO job_current
(title, salary, zip, description)
values
('Construction Worker',900000,'CA','laying bricks');

INSERT INTO job_current (title, salary, start_date)
 values 
('Artist','250000','0000-00-00'), 
('Computer programmer','700000','2010-03-25'), 
('Technical writer','540000','2006-08-03'), 
('Software Sales','60000','2016-06-27'), 
('Web Designer','360000','2015-05-01');

#modify column values#
alter table job_current MODIFY contact_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY;

alter table job_desired MODIFY contact_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY;

alter table job_listings MODIFY job_id INT NOT NULL AUTO_INCREMENT;

#inner join#
SELECT mc.first_name, mc.last_name, i.interest FROM my_contacts,
my_contacts AS mc
inner join contact_interest AS ci
ON mc.contact_id = ci.contact_id
inner join interests AS i
ON ci.interest_id = i.interest_id;

#left and right join#
SELECT mc.first_name, mc.last_name, p.profession
FROM my_contacts AS mc
LEFT OUTER JOIN profession AS p
ON mc.prof_id = p.prof_id;


#unions#
SELECT title FROM job_current
UNION
SELECT title FROM job_desired
UNION
SELECT title FROM job_listings;

SELECT title FROM job_current 
UNION 
SELECT title FROM job_desired 
UNION
SELECT title FROM job_listings ORDER BY title;

SELECT title FROM job_current 
UNION ALL
SELECT title FROM job_desired 
UNION ALL
SELECT title FROM job_listings ORDER BY title;

#CREATE A TABLE WITH UNION#
CREATE TABLE my_union AS
SELECT title FROM job_current UNION
SELECT title FROM job_desired
UNION SELECT title FROM job_listings;
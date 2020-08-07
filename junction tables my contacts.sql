#JUNCTION TABLES#
select gres_list;
Drop table contact_interest;

CREATE TABLE contact_interest (
contact_id int NOT NULL,
interest_id int NOT NULL,
PRIMARY KEY (contact_id, interest_id),
FOREIGN KEY (contact_id) REFERENCES my_contacts(contact_id),
FOREIGN KEY (interest_id) REFERENCES interests(interest_id)
);

CREATE TABLE contact_seeking (
contact_id int NOT NULL,
seeking_id int NOT NULL,
PRIMARY KEY (contact_id, seeking_id),
FOREIGN KEY (contact_id) REFERENCES my_contacts(contact_id),
FOREIGN KEY (seeking_id) REFERENCES seeking(seeking_id)
);

#insert into junction tables#
INSERT INTO contact_seeking (seeking_id, contact_id) 
SELECT seeking_id, contact_id  
FROM seeking AS s  
INNER JOIN my_contacts AS mc ON s.seeking = mc.seeking
WHERE mc.seeking = s.seeking; 

#check code#
INSERT INTO contact_interest (contact_id, interest_id) 
SELECT mc.contact_id, i.interest_id FROM my_contacts mc 
INNER JOIN interests i ON i.interest  IN (mc.interests1, mc.interests2, mc.interests3) 
WHERE i.interest  IN (mc.interests1, mc.interests2, mc.interests3);




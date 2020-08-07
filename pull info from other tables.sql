SELECT * FROM gregs_list.my_contacts;

USE gregs_list;

#PULL INFO FROM OTHER TABLES#
UPDATE my_contacts mc
SET mc.zip_code =
(SELECT zip_code
FROM zip_code z
WHERE z.city = mc.city
AND z.state = mc.state);
START TRANSACTION;
SELECT * FROM piggy_bank;
UPDATE piggy_bank set coin = 'T' where coin= 'A';
SELECT * FROM piggy_bank;
ROLLBACK;  #commit when making changes stick#
SELECT * FROM piggy_bank;

set autocommit =0;


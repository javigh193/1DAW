BEGIN TRANSACTION;

UPDATE accounts
   SET balance = balance - 20000
 WHERE account_no = 100;

INSERT INTO account_changes(account_no,flag,amount,changed_at) 
VALUES(100,'-',20000,datetime('now'));

ROLLBACK;
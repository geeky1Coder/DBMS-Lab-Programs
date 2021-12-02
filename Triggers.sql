CREATE TABLE account (
    acct_num INT,
    amount DECIMAL(10,2)
);

SET @sum = 0;
CREATE TRIGGER ins_sum BEFORE INSERT ON account
FOR EACH ROW SET @sum = @sum + NEW.amount;

INSERT INTO account VALUES(137,124.98);
INSERT INTO account VALUES(141,137.50);
INSERT INTO account VALUES(97,190.00);

CREATE TRIGGER delSum AFTER DELETE ON account
FOR EACH ROW SET @sum = @sum - OLD.amount;

Delete From account
where acct_num=141;

SELECT @sum AS 'Total amount inserted';

-- DROP TRIGGER shop.ins_sum;
-- Drop table account;

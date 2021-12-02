DROP TABLE customers;
create table customers(
    id varchar(12),
    name varchar(8),
    address varchar(20)
);
INSERT INTO customers values('4352','Shorya','up');
INSERT INTO customers values('4353','Yuvraj','hr');
INSERT INTO customers values('4354','Sindhu','pn');

DECLARE
customerId customers.id%type;
customerName customers.name%type;
customerAddr customers.address%type;

CURSOR customersCursor is
SELECT id, name, address FROM customers;

BEGIN
    OPEN customersCursor;
    LOOP
    FETCH customersCursor into customerId, customerName, customerAddr;
    EXIT WHEN customersCursor%notfound;
    dbms_output.put_line(customerId || ' ' || customerName || ' ' || customerAddr);
    END LOOP;
    CLOSE customersCursor;
END;

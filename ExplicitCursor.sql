create table customers(
    id varchar(12),
    name varchar(8),
    address varchar(20)
);
INSERT INTO customers values('4352','Shorya','up');
INSERT INTO customers values('4353','Yuvraj','hr');
INSERT INTO customers values('4354','Sindhu','pn');

DECLARE
c_id customers.id%type;
c_name customers.name%type;
c_addr customers.address%type;

CURSOR c_customers is
SELECT id, name, address FROM customers;

BEGIN
    OPEN c_customers;
    LOOP
    FETCH c_customers into c_id, c_name, c_addr;
    EXIT WHEN c_customers%notfound;
    dbms_output.put_line(c_id || ' ' || c_name || ' ' ||
    c_addr);
    END LOOP;
    CLOSE c_customers;
END;
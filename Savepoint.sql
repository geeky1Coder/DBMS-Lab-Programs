Drop table employee;

create table employee(
    firstname char(10),
    lastname char(10),
    eid int ,
    salary int 
);

Insert into employee values('Yuvraj','Mann' ,1 , 100);
Insert into employee values('Steve','Jobs',2 , 200);

DECLARE
update_income employee.salary%type;
BEGIN
    INSERT INTO employee VALUES ('Karl','Rock',3 , 300);
    SAVEPOINT no_update;
    UPDATE employee SET salary = salary+100;
    SELECT sum(salary) INTO update_income FROM employee;
    DBMS_OUTPUT.PUT_LINE(update_income);
    IF update_income > 800 THEN
        ROLLBACK TO SAVEPOINT no_update;
        SELECT sum(salary) INTO update_income FROM employee;
        DBMS_OUTPUT.PUT_LINE('The savepoint has been executed');
        DBMS_OUTPUT.PUT_LINE(update_income);
    END IF;
COMMIT;
END;
Drop table employee;

create table employee(
    firstname char(10),
    lastname char(10),
    eid int ,
    salary int 
);

Insert into employee values('Yuvraj','Mann' ,1 , 100);
Insert into employee values('shubhankar','sde',2 , 200);

select * from employee ; 

DECLARE
update_income employee.salary%type;
BEGIN
    INSERT INTO employee VALUES ('Vikram','Vishnu',3 , 300);
    SAVEPOINT no_update;
    UPDATE employee SET salary = salary+100;
    SELECT sum(salary) INTO update_income FROM employee;
    IF update_income > 500 THEN
        ROLLBACK TO SAVEPOINT no_update;
        DBMS_OUTPUT.PUT_LINE('The savepoint has been executed');
END IF;
COMMIT;
END;

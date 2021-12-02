create table Students(
    name varchar(12),
    rollno varchar(8),
    marks varchar(5)
);
INSERT INTO students values('Yuvraj',118,92);
INSERT INTO students values('Tanya',107,92);
INSERT INTO students values('Sindhu',101,91);

SELECT * FROM students;
begin
Update students set marks=marks+1 where rollno=118;

if SQL %Found then
 dbms_output.put_line('Record fetched');
 dbms_output.put_line(SQL%rowcount);
else
 dbms_output.put_line('Record not fetched');
end if;
end;

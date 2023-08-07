1)
create table emp_info (employee_id number(3), first_name varchar2(20), last_name varchar2(20), 
salary number(10), department_id number(3));

insert into emp_info values (101, 'Ramesh', 'Kumar', 200000, 80);
insert into emp_info values (102, 'Suresh', 'Anand', 300000, 90);
insert into emp_info values (103, 'Sukesh', 'Kumar', 400000, 80);
insert into emp_info values (104, 'Venkatesh', 'Prasad', 600000, 80);
insert into emp_info values (105, 'Shree', 'Prakash', 600000, 90);
insert into emp_info values (109, 'Pratap', 'Reddy', 400000, 100);
insert into emp_info values (110, 'Raj', 'shekhar', 700000, 70);


DECLARE
  emp_id number(3) := 110;
  emp_sal number(10);
  emp_incent number(10);
BEGIN
    SELECT salary INTO emp_sal FROM emp_info WHERE employee_id = emp_id;
    emp_incent := emp_sal * (0.12/100);
    dbms_output.put_line('Employee ID: ' || emp_id || ' Salary: ' || emp_sal ||
     ' Incentive: ' || emp_incent);
    END;
/

2)
DECLARE
    emp_name varchar2(20);
BEGIN
    FOR emp_rec IN (SELECT first_name , last_name FROM emp_info
     WHERE first_name LIKE '%a%' AND last_name LIKE '%a%') LOOP
        dbms_output.put_line('Employee Name: ' || emp_rec.first_name 
        || ' ' || emp_rec.last_name);
    END LOOP;
    END;
/

3)
CREATE TABLE update_emp (employee_id number(3), employee_name varchar2(20), salary number(10),
incentive number(10), department_id number(3));

DECLARE
    emp_id number(3);
    emp_sal number(10);
    emp_incent number(10);
    emp_name varchar2(20);
    emp_dept_id number(3);
BEGIN
    FOR emp_rec IN (SELECT * FROM emp_info WHERE first_name LIKE '%e%' AND last_name LIKE '%e%') LOOP
        emp_id := emp_rec.employee_id;
        emp_sal := emp_rec.salary;
        emp_incent := emp_sal * 0.1;
        emp_name := emp_rec.first_name || ' ' || emp_rec.last_name;
        emp_dept_id := emp_rec.department_id;
        INSERT INTO update_emp VALUES (emp_id, emp_name, emp_sal, emp_incent, emp_dept_id);
    END LOOP;
    END;
/

4)
DECLARE
    emp_count number(3);
BEGIN
    SELECT COUNT(*) INTO emp_count FROM emp_info WHERE department_id = 90;
    dbms_output.put_line('Number of employees in department 90: ' || emp_count);
    END;
/

5)
DECLARE
    emp_dept_id number(3);
    emp_name varchar2(20);
BEGIN
    FOR emp_rec IN (SELECT * FROM emp_info) LOOP
        emp_dept_id := emp_rec.department_id;
        emp_name := emp_rec.first_name || ' ' || emp_rec.last_name;
        dbms_output.put_line('Department ID: ' || emp_dept_id || ' Employee Name: ' || emp_name);
    END LOOP;
    END;
/

6)


declare 
    midVal number(8,1);
    Max_sal number(8);
    Min_sal number(8);
begin
    select max(salary) , min(salary) into Max_sal, Min_sal from emp_info;
    midVal:=  (Max_sal + Min_sal)/2;
    dbms_output.put_line('The midValue of salaries is ' || midVal);
    for item in (select employee_id, salary from emp_info) loop
        if midVal > item.salary then 
            update emp_info set salary = midVal where employee_id = item.employee_id;
            dbms_output.put_line('The employee with id ' || item.employee_id || ' has salary less than the midValue.');
            dbms_output.put_line('Succesfully Updated!');
        elsif midVal < item.salary then
            update emp_info set salary = (midVal + midVal*0.08) where employee_id = item.employee_id;
            dbms_output.put_line('The employee with id ' || item.employee_id || ' has salary grater than midValue.');
            dbms_output.put_line('Succesfully Updated!');
        else dbms_output.put_line('The employee with id ' || item.employee_id || ' has salary same as midValue.');
        end if;
    end loop;
end;
/


7)

begin
    for item in (select * from emp_info) loop
        dbms_output.put_line(item.employee_id || '  ' || item.first_name || '  ' || item.last_name || '  ' || item.salary || '  ' || item.department_id);
    end loop;
end;
/
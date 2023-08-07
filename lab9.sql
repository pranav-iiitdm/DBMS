1)

declare
    a number ;
    b number ;
    c number ;
    s number;
    m number;
begin
    a:=&a;
    b:=&b;
    c:=&c;

    if(a<b) then
    s :=b;

    else
    s :=a;

    end if;

    if(s<c) then
    m :=c;

    else
    m :=s;

    end if;

    dbms_output.put_line('Max of entered three numbers is :' || m);
end;
/

2)

declare
    x number;
begin
    x:=&x;

    if mod(x,5)=0 and mod(x,11)=0 then
    dbms_output.put_line('Entered number is divisible by both 5 and 11');

    else
    dbms_output.put_line('Entered number is not divisible by both 5 and 11');

    end if;

end;
/

3)

declare 
    lr number;
    br number;
    ht number;
    bt number;
    ss number;
begin
    dbms_output.put_line('lr is length of rectangle');
    dbms_output.put_line('br is breadth of rectangle');
    dbms_output.put_line('ht is height of triangle');
    dbms_output.put_line('bt is base of triangle');
    dbms_output.put_line('ss is side of square');

    lr:=&lr;
    br:=&br;

    dbms_output.put_line('Area of rectangle is :' || lr*br);

    ht:=&ht;
    bt:=&bt;

    dbms_output.put_line('Area of triangle is :' || 0.5*ht*bt);

    ss:=&ss;

    dbms_output.put_line('Area of square is :' || ss*ss);
end;
/

4)

declare
    mat number;
    phy number;
    chem number;
    bio number;
    comp number;
    total number:=0;
begin
    mat:=&mat;
    phy:=&phy;
    chem:=&chem;
    bio:=&bio;
    comp:=&comp;

    total:=total+mat;
    total:=total+phy;
    total:=total+chem;
    total:=total+bio;
    total:=total+comp;

    total:=total/500;
    total:=total*100;

    if total>=90 then
    dbms_output.put_line('GRADE IS A');

    elsif total>=80 then
    dbms_output.put_line('GRADE IS B');

    elsif total>=70 then
    dbms_output.put_line('GRADE IS C');

    elsif total>=60 then
    dbms_output.put_line('GRADE IS D');

    elsif total>=40 then
    dbms_output.put_line('GRADE IS E');

    else
    dbms_output.put_line('GRADE IS F');

    end if;
end;
/

5)

declare
    x number:=0;
    i number:=0;
begin
    while i<=100 loop
    x:=x+i;
    i:=i+1;
    end loop;

    dbms_output.put_line('Sum of first 100 natural numbers is : ' || x);
end;
/

6)

create table Empinfo(id number,name varchar(15),age number,address varchar(20),salary number);

insert into Empinfo values(1,'Ramesh',32,'Ahmedabad',2000);
insert into Empinfo values(2,'Khilan',25,'Delhi',1500);
insert into Empinfo values(3,'koushik',23,'Kota',2000);
insert into Empinfo values(4,'chaitali',25,'Mumbai',6500);
insert into Empinfo values(5,'Hardik',27,'Bhopal',8500);
insert into Empinfo values(6,'Komal',22,'MP',4500);

a)

declare
    emp_id Empinfo.id%type :=1;
    emp_name Empinfo.name%type;
begin
    select name into emp_name from Empinfo where id=emp_id;

    dbms_output.put_line('The name of person having id=1 is '|| emp_name);
end;
/

b) 
DECLARE
    emp_addr Empinfo.address%type := 'Kota';
    emp_name Empinfo.name%type;
    emp_age Empinfo.age%type;
    emp_salary Empinfo.salary%type;
BEGIN
    select name,age,salary into emp_name,emp_age,emp_salary from Empinfo where address=emp_addr;

    dbms_output.put_line('The name, age, and salary lives in kota is '||emp_name||','||emp_age||','||emp_salary);
END;
/





































DECLARE
    stud_name student1.sname%type;
    stud_roll student1.rollNo%type := 'CS21B1056';
BEGIN
    select sname,rollNo into stud_name,stud_roll from student1 where rollNo=stud_roll;

    dbms_output.put_line('The name, age, and salary lives in kota is '||stud_name||','||stud_roll);
END;
/
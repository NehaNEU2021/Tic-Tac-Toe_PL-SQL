SET SERVEROUTPUT ON
 
 Drop table DEPARTMENT;
 
CREATE TABLE DEPARTMENT(
           dept_id number(5) NOT NULL,
           dept_name varchar(40) NOT NULL,
           dept_location varchar(40) NOT NULL,
           primary key(dept_id)
           );

Select * from department;
drop sequence dept_id;
create sequence dept_id minvalue 1 start with 1 cache 10; 

create or replace Procedure InsertDept(id Number,name in varchar,location in varchar) 
IS
x number;
camelname varchar(255);
ex_invalid_name  EXCEPTION; 
ex_invalid_location EXCEPTION;
length_name EXCEPTION;
Begin


IF(LENGTH(TRIM(TRANSLATE(name ' +-.0123456789', ' '))) is null)
THEN
RAISE ex_invalid_name;
ELSIF not regexp_like(name, '^[^1-9]*$') then
 dbms_output.put_line('DEPARTMENT NAME CANNOT BE NUMBER'); 
 elsif location not in ('MA', 'TX', 'IL', 'CA', 'NY', 'NJ', 'NH', 'RH') then 
  raise ex_invalid_location  ;
   elsif Length(name)>20 then 
  raise length_name  ;
  else 
camelname := substr(lower(name),1,1)||substr(replace(initcap(name),' '),2);
     select count(*) 
    into x  
    from department 
    WHERE dept_name =camelname ;
    


    if x != 0 then  
    update department set dept_location=location where dept_name=camelname;


    else  
     INSERT INTO DEPARTMENT(dept_id,dept_name, dept_location) VALUES (id,camelname,location);
    end if;  

 end if;
 exception
    when no_data_found then
        update department SET dept_location=dept_location where dept_name=dept_name;
    when ex_invalid_name  then
     dbms_output.put_line('Invalid Department Name');  
     when ex_invalid_location  then
     dbms_output.put_line('Invalid Location'); 
     when length_name  then
      dbms_output.put_line('Length is greater than 20 characters'); 
end InsertDept;
/


--exec InsertDepartment(dept_id.nextval,'engmana','TX');
-- CREATE DEPT TABLE AND INSERT 6 RECORDS INTO IT
exec InsertDept(dept_id.nextval,'ITM','TX');
exec InsertDept(dept_id.nextval,'MEM','MA');
exec InsertDept(dept_id.nextval,'DAE','IL');
exec InsertDept(dept_id.nextval,'CSYE','NJ');
exec InsertDept(dept_id.nextval,'IS','NY');
exec InsertDept(dept_id.nextval,'ProjectMgmt','CA');
select* from department;

--INSERT THE DEPARTMENT IF NAME DOESN'T EXISTS
exec InsertDept(dept_id.nextval,'Production','MA');
select* from department;

--RAISE ERROR IF THE DEPARTMENT NAME IS INVALID (NULL, ZERO LENGTH)
exec InsertDept(dept_id.nextval,'','MA');

--RAISE ERROR IF THE DEPARTMENT NAME IS A NUMBER
exec InsertDept(dept_id.nextval,'5678','MA');

--ACCEPTED LOCATIONS SHOULD BE AS BELOW
exec InsertDept(dept_id.nextval,'ITM','Boston');

-- DEPARTMENT ID SHOULD BE AUTO-GENERATED
exec InsertDept(dept_id.nextval,'Financial','MA');
select* from department;

--LENGTH OF THE DEPARTMENT NAME CANNOT BE MORE THAN 20 CHARS
exec InsertDept(dept_id.nextval,'QuantumFinancialEngineering','MA');

--WHILE INSERTING THE DEPARTMENT NAME CONVERT EVERYTHING TO CAMEL CASE
exec InsertDept(dept_id.nextval,'Enineering Mgmt','NH');
select* from department;

--MAKE SURE DEPARTMENT NAME IS UNIQUE
exec InsertDept(dept_id.nextval,'Enineering Mgmt','MA');
select* from department;
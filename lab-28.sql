--EMPLOYEE_LOG (LOGID, EID, OLDVALUE, NEWVALUE, FIELDNAME, OPERATIONTYPE, LOGDATE)

--From the table EMPLOYEE perform the following queries:

--Part – A:
select * from EMPLOYEE
--1. Create trigger for printing message after employee record insertion.
CREATE TRIGGER TR_EMPLOYEE_INSERT
ON EMPLOYEE
AFTER INSERT
AS
BEGIN
    PRINT 'Employee record inserted successfully.';
END;

insert into employee
values (101,'mayank','pathar','admin',99000,'jamnagar','male',2000)
--2. Create trigger for printing message after employee record update.
CREATE TRIGGER TR_EMPLOYEE_UPDATE
ON EMPLOYEE
AFTER UPDATE
AS
BEGIN
    PRINT 'Employee record updated successfully.';
END;

update EMPLOYEE
set SALARY=99999
where FIRSTNAME='mayank'

--3. Create trigger for printing message after employee record deletion.
CREATE TRIGGER TR_EMPLOYEE_DELETE
ON EMPLOYEE
AFTER DELETE
AS
BEGIN
    PRINT 'Employee record deleted successfully.';
END;
delete from EMPLOYEE
where LASTNAME='pathar'

--4. Create trigger for printing message after employee salary increment.
CREATE or alter TRIGGER TR_SALARY_INCREMENT
ON EMPLOYEE
AFTER UPDATE
AS
BEGIN
    IF UPDATE(SALARY)
    BEGIN
        IF EXISTS
        (
            SELECT 1
            FROM inserted I
            INNER JOIN deleted D ON I.EID = D.EID
            WHERE I.SALARY > D.SALARY
        )
        BEGIN
            PRINT 'Employee salary incremented successfully.';
        END
    END
END;
update EMPLOYEE
set SALARY=22000
where EID=101

--5. Create trigger for automatically converting CITY names into uppercase during insertion.
CREATE TRIGGER TR_CITY_UPPERCASE
ON EMPLOYEE
AFTER INSERT
AS
BEGIN
    UPDATE E
    SET E.CITY = UPPER(I.CITY)
    FROM EMPLOYEE E
    INNER JOIN inserted I
        ON E.EID = I.EID;
END;
insert into employee
values (101,'mayank','pathar','admin',99000,'jamnagar','male',2000)

--Part – B:

--6. Create trigger for updating employee city and printing old city and new city name.
CREATE TRIGGER TR_CITY_UPDATE
ON EMPLOYEE
AFTER UPDATE
AS
BEGIN
    IF UPDATE(CITY)
    BEGIN
        SELECT 
            D.EID,
            D.CITY AS OLD_CITY,
            I.CITY AS NEW_CITY
        FROM deleted D
        INNER JOIN inserted I ON D.EID = I.EID;
    END
END;

update EMPLOYEE
set CITY='rajkot'
where FIRSTNAME='mayank'


--7. Create trigger for automatically setting CITY as 'RAJKOT' if no city value is entered during employee
--insertion.
CREATE TRIGGER TR_DEFAULT_CITY
ON EMPLOYEE
AFTER INSERT
AS
BEGIN
    UPDATE E
    SET CITY = 'RAJKOT'
    FROM EMPLOYEE E
    INNER JOIN inserted I ON E.EID = I.EID
    WHERE I.CITY IS NULL OR I.CITY = '';
END;

insert into employee
values (101,'mayank','pathar','admin',99000,NULL,'male',2000)
select * from EMPLOYEE

--8. Create trigger for automatically adding current year in JOININGYEAR if no value is entered.
CREATE TRIGGER TR_DEFAULT_JOININGYEAR
ON EMPLOYEE
AFTER INSERT
AS
BEGIN
    UPDATE E
    SET JOININGYEAR = YEAR(GETDATE())
    FROM EMPLOYEE E
    INNER JOIN inserted I ON E.EID = I.EID
    WHERE I.JOININGYEAR IS NULL;
END;

insert into employee
values (101,'mayank','pathar','admin',99000,'jamnagar','male',NULL)



--9. Create trigger for printing employee full name after new employee insertion.
CREATE TRIGGER TR_PRINT_FULLNAME
ON EMPLOYEE
AFTER INSERT
AS
BEGIN
    SELECT 
        FIRSTNAME + ' ' + LASTNAME AS FULLNAME
    FROM inserted;
END;

--10. Create trigger for automatically assigning department as ‘GENERAL’ if DEPARTMENT value is NULL.
CREATE TRIGGER TR_DEFAULT_DEPARTMENT
ON EMPLOYEE
AFTER INSERT
AS
BEGIN
    UPDATE E
    SET DEPARTMENT = 'GENERAL'
    FROM EMPLOYEE E
    INNER JOIN inserted I ON E.EID = I.EID
    WHERE I.DEPARTMENT IS NULL;
END;

--Part – C:

--11. Create trigger for storing updated employee details such as EID, old salary, new salary, old department,
--new department, and update date into EMPLOYEE_UPDATE_LOG table.


--12. Create trigger for storing newly inserted employee details with insertion date into
--EMPLOYEE_INSERT_LOG table.

--13. Create trigger for storing old and new FIRSTNAME values after employee name update into
--NAME_CHANGE_LOG table.

--14. Create trigger for storing old city and new city details into CITY_UPDATE_LOG table after city update.

--15. Implement INSTEAD OF INSERT trigger on EMPLOYEE table to automatically remove extra spaces from
--FIRSTNAME and LASTNAME before insertion.
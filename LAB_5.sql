--Part – A:

--1. Add column state varchar(20).
ALTER TABLE DEPOSIT
ADD state varchar(20);

--2. Add two more columns city varchar(20) and pincode int.
ALTER TABLE DEPOSIT	
ADD city varchar(20),Pincode int;	

--3. Change the size of cname column from varchar(50) to varchar(35).
ALTER TABLE DEPOSIT
ALTER COLUMN cname varchar(35);

--4. Change the data type of amount from decimal to int.
ALTER TABLE DEPOSIT
ALTER COLUMN amount int;

--5. Delete column city from the DEPOSIT table.
 ALTER TABLE DEPOSIT
 DROP COLUMN city;

--6. Rename column actno to ano.
SP_rename 'DEPOSIT.actno', 'ano';

--7. Rename column bname to branch_name.
SP_rename 'DEPOSIT.bname', 'branch_name';

--8. Rename table DEPOSIT to DEPOSIT_DETAIL.
SP_rename 'DEPOSIT', 'DEPOSIT_DETAIL';

--9. Add column ifsc_code varchar(15).
ALTER TABLE DEPOSIT_DETAIL
ADD ifsc_code varchar(15);

--10. Change the size of bname column from varchar(50) to varchar(30).
ALTER TABLE DEPOSIT_DETAIL
ALTER COLUMN branch_name varchar(30);

--Part – B:

--11. Rename column adate to aopendate.
SP_rename 'DEPOSIT_DETAIL.adate', 'aopendate';

--12. Delete column aopendate from DEPOSIT_DETAIL table.
ALTER TABLE DEPOSIT_DETAIL
DROP COLUMN aopendate;

--13. Rename column cname to customer_name.
SP_rename 'DEPOSIT_DETAIL.cname', 'customer_name';

--14. Add column country varchar(20).
ALTER TABLE DEPOSIT_DETAIL
ADD country varchar(20);

--15. Add column account_type varchar(15).
ALTER TABLE DEPOSIT_DETAIL
ADD account_type varchar(15);

--Part – C:

--16. Change data type of pincode from int to bigint.
ALTER TABLE DEPOSIT_DETAIL
ALTER COLUMN pincode bigint;

--17. Delete column account_type.
ALTER TABLE DEPOSIT_DETAIL
DROP COLUMN account_type;

--18. Rename column amount to balance.
SP_rename 'DEPOSIT_DETAIL.amount', 'balance';

--19. Add column status varchar(10).
ALTER TABLE DEPOSIT_DETAIL
ADD status varchar(10);

--20. Change table name deposit_detail to bank_deposit.
SP_rename 'DEPOSIT_DETAIL', 'bank_deposit';

SELECT * FROM bank_deposit;

--Part – A2:

--1. Delete all the records having amount less than or equal to 3000.
DELETE FROM bank_deposit
WHERE balance <= 3000;

--2. Delete all the accounts of ‘BEDI’ branch customer.
DELETE FROM bank_deposit
WHERE branch_name = 'BEDI';

--3. Delete all the accounts having account number greater than 102 and less than 109.
DELETE FROM bank_deposit
WHERE ano > 102 AND ano < 109;

--4. Delete all the accounts whose branch is ‘BEDI’ or ‘MADHAPAR’.
DELETE FROM bank_deposit
WHERE branch_name = 'BEDI' OR branch_name = 'MADHAPAR';

--5. Delete all the accounts details where amount is 8000 and account open after 1-1-2025;
DELETE FROM bank_deposit
WHERE balance = 8000 AND aopendate > '2025-01-01';

--6. Delete all the accounts whose account branch is NULL.
DELETE FROM bank_deposit
WHERE branch_name IS NULL;

--7. Delete all the accounts details where amount is 7000 and name is CHARMI and branch is SHITAL PARK.
DELETE FROM bank_deposit
WHERE balance = 7000 AND customer_name = 'CHARMI' AND branch_name = 'SHITAL PARK';

--8. Delete all the remaining records using DELETE command.
DELETE FROM bank_deposit;

--9. Delete all the records of DEPOSIT table. (Use TRUNCATE)
TRUNCATE TABLE bank_deposit;

--10. Remove DEPOSIT table. (Use DROP)
DROP TABLE bank_deposit;

--Part – B2:

--11. Delete all the students whose stdid is greater than 105.
DELETE FROM STUDENT
WHERE STDID > 105;

--12. Delete the records whose branch is NULL and sname is not NULL.
DELETE FROM STUDENT
WHERE BRANCH IS NULL AND SNAME IS NOT NULL;

--13. Delete the records whose SPI is less than 9 and city is RAJKOT.
DELETE FROM STUDENT
WHERE SPI < 9 AND CITY = 'RAJKOT';

--14. Delete the records whose branch name is not empty.
DELETE FROM STUDENT
WHERE BRANCH <> '';

--15. Delete all the records of STUDENT table. (Use TRUNCATE)
TRUNCATE TABLE STUDENT;
--Part – A:
select * from student;
--1. Update SPI of all students from 7.00 to 8.00.
   UPDATE student
   SET SPI = 8.00
   WHERE SPI = 7.00;

--2. Change city of HETVI from RAJKOT to AHMEDABAD.
UPDATE student
SET CITY = 'AHMEDABAD'
WHERE SNAME = 'HETVI' AND CITY = 'RAJKOT';

--3. Update SPI of DEEP to 9.20 and city to VADODARA.
UPDATE student
SET SPI = 9.20, CITY = 'VADODARA'
WHERE SNAME = 'DEEP';

--4. Update SPI of DHARMIK to 8.50.
UPDATE student
SET SPI = 8.50
WHERE SNAME = 'DHARMIK';

--5. Update branch name from COMPUTER to IT.
UPDATE STUDENT
SET BRANCH = 'IT'
WHERE BRANCH = 'COMPUTER';
--6. Update branch of RAJ to AUTOMOBILE.
UPDATE student
SET BRANCH = 'AUTOMOBILE'
WHERE SNAME = 'RAJ';
--7. Update SPI to 7.50 where STDID is between 103 and 107.
UPDATE student
SET SPI = 7.50
WHERE STDID BETWEEN 103 AND 107;

--8. Update city of PARAG to MUMBAI.
UPDATE student
SET CITY = 'MUMBAI'
WHERE SNAME = 'PARAG';
--9. Update SPI of RIYA to 6.00.
UPDATE student
SET SPI = 6.00
WHERE SNAME = 'RIYA';

--10. Update SPI of SMAIR to 7.20 and branch to ELECTRICAL.
UPDATE student
SET SPI = 7.20, BRANCH = 'ELECTRICAL'
WHERE SNAME = 'SMAIR';

--Part – B:

--11. Give 10% increment in SPI.
	UPDATE student 
	SET SPI = SPI * 1.10;

--12. Increase SPI by 20% for all students.
UPDATE student
SET SPI = SPI * 1.20;

--13. Increase SPI by 0.50 in all records.
UPDATE student
SET SPI = SPI + 0.50;

--14. Update branch to 'EC' and SPI to 8.00 and city to Surat where SNAME is KRUNAL.
	UPDATE student 
	SET BRANCH = 'EC', SPI = 8.00, CITY = 'SURAT'
	WHERE SNAME = 'KRUNAL';

--15. Update city to 'RAJKOT' and SPI to 7.00 where branch is CIVIL and stdid is less than 105.
UPDATE student
SET CITY = 'RAJKOT', SPI = 7.00
WHERE BRANCH = 'CIVIL' AND STDID < 105;

--Part – C:

--16. Update SPI of student with stdid 110 to NULL.
UPDATE student 
SET SPI = NULL
WHERE STDID = 110;

--17. Update branch of VISHAL to NULL.
UPDATE student
SET BRANCH = NULL
WHERE SNAME = 'VISHAL';

--18. Display names of students whose SPI is NULL.
	SELECT SNAME FROM student
	WHERE SPI IS NULL;

--19. Display students who have branch assigned.
SELECT * FROM student
WHERE BRANCH IS NOT NULL;

--20. Update student with stdid 108 to name DARSHAN, branch COMPUTER, and SPI 8.50.
UPDATE student
SET SNAME = 'DARSHAN', BRANCH = 'COMPUTER', SPI = 8.50
WHERE STDID = 108;

--21. Update city to SURAT where SPI is less than 7.00.
UPDATE student
SET CITY = 'SURAT'
WHERE SPI < 7.00;

--22. Update city to NULL and branch to MECHANICAL where stdid is 109.
UPDATE student
SET CITY = NULL, BRANCH = 'MECHANICAL'
WHERE STDID = 109;

SELECT * FROM STUDENT


--1.UPDATE STUDENT SPI TO 8.20 WHERE NAME AMIT
UPDATE STUDENT
SET SPI = 8.20
WHERE SNAME = 'AMIT'

--2.CHANGE CITY OF PRIYA MUMBAI TO PUNE
UPDATE STUDENT
SET CITY = 'MUMBAI'
WHERE CITY = 'PUNE'

--3.CHANGE SPI TO 7.80 AND CITY TO SURAT EHRE NAME HARSH
UPDATE STUDENT
SET CITY = 'SURAT' , SPI = 7.80
WHERE SNAME = 'HARSH'

--4.UPDATE BRANCH NAME FROM 'MECH' TO 'MECHANICAL'
UPDATE STUDENT
SET BRANCH = 'MECHANICAL'
WHERE BRANCH = 'MECH'

--5.CHANGE BRANCH OF KAVYA TO CIVIL
UPDATE STUDENT
SET BRANCH = 'CIVIL'
WHERE SNAME = 'KAVYA'

--6.CHANGE SPI 9 ALL WHERE STDID BETWEEN 110 AND 115
UPDATE STUDENT
SET SPI = 9.00
WHERE STDID BETWEEN 110 AND 115;

--7.CHANGE CITY OF AYUSH TO BANGALORE
UPDATE STUDENT
SET CITY = 'BANGALORE'
WHERE SNAME = 'AYUSH';

--8.CHANGE SPI TO 8.40 AND BRANCH CHEMICAL WHERA NAME ANJALI
UPDATE STUDENT
SET SPI = 8.40 , BRANCH = 'CHEMICAL'
WHERE SNAME = 'ANJALI';

--9.GIVE 5% INCREMINET IN SPI
UPDATE STUDENT
SET SPI = SPI*0.5;

--10.INCRESE SPI TO 15% WHERE BRANCH IS IT
UPDATE STUDENT
SET SPI = SPI*1.5
WHERE BRANCH = 'IT';

-- 11. Decrease the SPI by 0.20 for all students who live in 'VADODARA'.
UPDATE student
SET SPI = SPI - 0.20
WHERE CITY = 'VADODARA';

-- 12. Update the branch to 'MINING', SPI to 6.50, and city to 'JAIPUR' where the student's name is VIKRAM.
UPDATE student
SET BRANCH = 'MINING', SPI = 6.50, CITY = 'JAIPUR'
WHERE SNAME = 'VIKRAM';

-- 13. Update the city to 'RAJKOT' and SPI to 7.50 for all students whose branch is 'COMPUTER' and STDID is greater than 105.
UPDATE student
SET CITY = 'RAJKOT', SPI = 7.50
WHERE BRANCH = 'COMPUTER' AND STDID > 105;

-- 14. Deduct 10% from the SPI of any student whose current SPI is greater than 9.00.
UPDATE student
SET SPI = SPI * 0.90
WHERE SPI > 9.00;

--15. Update the SPI of the student with STDID 112 to NULL.
UPDATE student
SET SPI = NULL
WHERE STDID = 112;

-- 16. Update the city of ROHAN to NULL.
UPDATE student
SET CITY = NULL
WHERE SNAME = 'ROHAN';

-- 17. Display all details of students whose branch is NULL.
	SELECT * FROM student
	WHERE BRANCH IS NULL;

-- 18. Display the names and cities of students who have an SPI assigned (is not NULL).
SELECT SNAME, CITY FROM student
WHERE SPI IS NOT NULL;

-- 19. Update the student with STDID 105 to have the name 'MEET', branch 'EC', and SPI 7.90.
UPDATE student
SET SNAME = 'MEET', BRANCH = 'EC', SPI = 7.90
WHERE STDID = 105;

-- 20. Update the city to 'AHMEDABAD' and branch to 'DATA SCIENCE' for the student with STDID 120.
UPDATE student
SET CITY = 'AHMEDABAD', BRANCH = 'DATA SCIENCE'
WHERE STDID = 120;
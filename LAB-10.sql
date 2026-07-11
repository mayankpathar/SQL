--Part – A:

--1. Display the result of 5 multiply by 30.
SELECT 30 * 5 AS RESULT;

--2. Find out the absolute value of -25, 25, -50 and 50.
SELECT ABS(-25);
SELECT ABS(25);
SELECT ABS(-50);
SELECT ABS(50);

-- 3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
SELECT CEILING(25.2), CEILING(25.7), CEILING(-25.2);

-- 4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
SELECT FLOOR(25.2), FLOOR(25.7), FLOOR(-25.2);

-- 5. Find out remainder of 5 divided by 2 and 5 divided by 3.
SELECT 5%2, 5%3;

-- 6. Find out value of 3 raised to 2nd power and 4 raised to 3rd power.
SELECT POWER(3,2), POWER(4,3);

-- 7. Find out the square root of 25, 30 and 50.
SELECT SQRT(25), SQRT(30), SQRT(50);

-- 8. Find out the square of 5, 15, and 25.
SELECT POWER(5,2), POWER(15,2), POWER(25,2);

-- 9. Find out the value of PI.
SELECT PI();

-- 10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
SELECT ROUND(157.732,2),
       ROUND(157.732,0),
       ROUND(157.732,-2);

-- 11. Find out exponential value of 2 and 3.
SELECT EXP(2), EXP(3);

-- 12. Find out logarithm having base e of 10 and 2.
SELECT LOG(10), LOG(2);

-- 13. Find logarithm base 10 of 5 and 100.
SELECT LOG10(5), LOG10(100);

-- 14. Find sine, cosine and tangent of 3.1415.
SELECT SIN(3.1415),
       COS(3.1415),
       TAN(3.1415);

-- 15. Find sign of -25, 0 and 25.
SELECT SIGN(-25),
       SIGN(0),
       SIGN(25);

-- 16. Generate random number using function.
SELECT RAND();

--Part – A:

--1. Find the length of following. (I) NULL (II) ‘ hello ’ (III) Blank
SELECT LEN(NULL),LEN(' hello')  ,LEN('');

--2. Display your name in lower & upper case.
SELECT LOWER('Mayank'),UPPER('Mayank');


--3. Display first three characters of your name.
SELECT SUBSTRING('Mayank', 1,3);


--4. Display 3rd to 10th character of your name.
SELECT SUBSTRING('Mayank Pathar', 3, 8);


--5. Replace examples.
SELECT REPLACE('abc123efg', '123', 'XYZ');

SELECT REPLACE('abcabcabc', 'c', '5');


--6. Display ASCII code.
SELECT ASCII('a') AS a,
       ASCII('A') AS A,
       ASCII('z') AS z,
       ASCII('Z') AS Z,
       ASCII('0') AS Zero,
       ASCII('9') AS Nine;


--7. Display character based on ASCII number.
SELECT CHAR(97) AS Char97,
       CHAR(65) AS Char65,
       CHAR(122) AS Char122,
       CHAR(90) AS Char90,
       CHAR(48) AS Char48,
       CHAR(57) AS Char57;


--8. Remove spaces from left.
SELECT LTRIM('hello world           ') ;


--9. Remove spaces from right.
SELECT RTRIM('       hello world       ') ;


--10. Display first 4 & last 5 characters of 'SQL Server'.
SELECT LEFT('SQL Server', 4),
       RIGHT('SQL Server', 5);


--11. Convert string '1234.56' to number.
SELECT CAST('1234.56' AS DECIMAL(10,2));

SELECT CONVERT(DECIMAL(10,2), '1234.56');


--12. Convert float 10.58 to integer.
SELECT CAST(10.58 AS INT) ;

SELECT CONVERT(INT, 10.58) ;


--13. Put 10 spaces before your name.
SELECT SPACE(10) + 'Mayank' ;


--14. Combine two strings.
SELECT 'Hello' + ' World';

SELECT CONCAT('Hello', ' ', 'World') ;


--15. Reverse of 'Darshan'.
SELECT REVERSE('Darshan') ;


--16. Repeat your name 3 times.
SELECT REPLICATE('Mayank ', 3);

--Part – B

--17. Display FIRSTNAME and LASTNAME in lowercase and uppercase.
SELECT
    LOWER(FIRSTNAME) ,
    UPPER(FIRSTNAME) ,
    LOWER(LASTNAME),
    UPPER(LASTNAME) 
FROM EMPLOYEE;


--18. Display full name by combining FIRSTNAME and LASTNAME.
SELECT FIRSTNAME + ' ' + LASTNAME
FROM EMPLOYEE;


--19. Display FIRSTNAME with first 3 characters only.
SELECT LEFT(FIRSTNAME, 3)
FROM EMPLOYEE;


--20. Display LASTNAME with last 2 characters only.
SELECT RIGHT(LASTNAME, 2)
FROM EMPLOYEE;


--21. Display length of each employee’s FIRSTNAME.
SELECT FIRSTNAME, LEN(FIRSTNAME)
FROM EMPLOYEE;


--22. Display FIRSTNAME after replacing 'A' with '@'.
SELECT FIRSTNAME,
       REPLACE(FIRSTNAME, 'A', '@')
FROM EMPLOYEE;


--23. Display FIRSTNAME and LASTNAME with '-' between them using CONCAT.
SELECT CONCAT(FIRSTNAME, '-', LASTNAME)


--Part – C

--24. Display FIRSTNAME without first and last character.
SELECT FIRSTNAME,
       SUBSTRING(FIRSTNAME, 2, LEN(FIRSTNAME) - 2)
FROM EMPLOYEE;


--25. Display FIRSTNAME after replacing vowels with '*'.
SELECT FIRSTNAME,
       REPLACE(
       REPLACE(
       REPLACE(
       REPLACE(
       REPLACE(UPPER(FIRSTNAME), 'A', '*'),
               'E', '*'),
               'I', '*'),
               'O', '*'),
               'U', '*')
FROM EMPLOYEE;


--26. Display employees where combined length of FIRSTNAME and LASTNAME is greater than 10.
SELECT * FROM EMPLOYEE
WHERE LEN(FIRSTNAME) + LEN(LASTNAME) > 10;


--27. Display FIRSTNAME and its reverse.
SELECT FIRSTNAME,REVERSE(FIRSTNAME) FROM EMPLOYEE;


--28. Display employees whose FIRSTNAME and LASTNAME start with same character using LEFT().
SELECT * FROM EMPLOYEE
WHERE LEFT(FIRSTNAME, 1) = LEFT(LASTNAME, 1);
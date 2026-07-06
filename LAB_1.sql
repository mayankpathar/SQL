
CREATE DATABASE CSE_3A_203


----------------------------DEPOSIT TABLE----------------------------------

CREATE TABLE DEPOSIT(
    ACTNO INT,
    CNAME VARCHAR(50),
    BNAME VARCHAR(50),
    AMOUNT DECIMAL(8,2),
    ADATE DATETIME
);

INSERT INTO DEPOSIT VALUES
(101 , 'MEET', 'MAVDI' , 10000 , '2025-03-01'),
(102 , 'JAY' , 'MADHAPAR' , 5000 , '2026-01-04'),
(103 , 'RAHUL' , 'BEDI' , 3500 , '2026-01-07'),
(104 , 'RIYA' , 'MAVDI' , 1200 , '2025-06-07'),
(105 , 'MANSI' , 'KKV HALL' , 3000 , '2024-03-02'),
(106 , 'DIYA' , 'MADHAPAR' , 2000 , '2025-03-01'),
(107 , 'MIRAL' , 'BEDI' , 1000 , '2025-09-05'),
(108 , 'UDAY' , 'UMIYA CHOWK' , 5000 , '2025-07-02'),
(109 , 'CHARMI' , 'SHITAL PARK' , 7000 , '2026-08-02'),
(110 , 'BHAVIN' , 'RING ROAD' , 8000 , '2025-02-02'),
(111 , 'BANSI', 'NULL', 9000 ,'2025-01-01');

SELECT * FROM DEPOSIT
    DROP TABLE DEPOSIT



----------------------------STUDENT TABLE----------------------------------

CREATE TABLE STUDENT
(
    STDID INT,
    SNAME VARCHAR(50),
    CITY VARCHAR(50),
    SPI DECIMAL(4,2),
    BRANCH VARCHAR(50),
  
);

INSERT INTO STUDENT (STDID, SNAME, CITY, SPI, BRANCH)
VALUES
(101, 'HETVI',   'RAJKOT',  7.40, 'COMPUTER'),
(102, 'RAJ',     'MORBI',   9.50, 'MECHANICAL'),
(103, 'VISHAL',  'RAJKOT',  9.00, 'CIVIL'),
(104, 'DEEP',    'SURAT',   8.80, 'COMPUTER'),
(105, 'DHARMIK', 'BARODA',  8.80, 'CHEMICAL'),
(106, 'KRUNAL',  'VAPI',    9.00, 'CIVIL'),
(107, 'RIYA',    'NAVSARI', 5.50, 'COMPUTER'),
(108, 'VRUNDA',  'KUTCH',   7.60, 'ELECTRICAL'),
(109, 'SMAIR',   'JAMNAGAR',6.80, 'EC'),
(110, 'PARAG',   'SURAT',   7.00, 'CHEMICAL'),
(111 ,'HARSH', 'RAJKOT', 4.00 ,'NULL');

SELECT * FROM STUDENT
DROP TABLE STUDENT

----------------------------EMPLOYEE TABLE----------------------------------

CREATE TABLE EMPLOYEE(
   EID INT,
   FIRSTNAME VARCHAR(50),
   LASTNAME VARCHAR(50),
   DEPARTMENT VARCHAR(50),
   SALARY DECIMAL(7,2),
   CITY VARCHAR(50),
   GENDER VARCHAR(10),
   JOININGYEAR INT
);

INSERT INTO EMPLOYEE VALUES
(101, 'HETVI', 'PATEL', 'ADMIN', 12000.00, 'RAJKOT', 'FEMALE', 2026),
(102, 'RAJ', 'MEHTA', 'IT', 14000.00, 'AHMEDABAD', 'MALE', 2022),
(103, 'VISHAL', 'SHARMA', 'HR', 15000.00, 'BARODA', 'MALE', 2020),
(104, 'DEEP', 'PATEL', 'ADMIN', 12500.00, 'RAJKOT', 'MALE', 2026),
(105, 'DHAVAL', 'SHAH', 'IT', 14000.00, 'JAMNAGAR', 'MALE', 2024),
(106, 'RIYA', 'KAUR', 'IT', 5000.00, 'AHMEDABAD', 'FEMALE', 2024),
(107, 'PARAG','PANDYA', 'HR', 7000.00, 'RAJKOT','MALE',2025),
(108, 'VRUNDA','VYAS', 'SERVER',10000.00, 'BARODA','FEMALE',2022),
(109, 'MEHUL', 'SINGH',  'HR',  12000.00, 'MORBI', 'MALE',2020),
(110, 'MUBIN', 'PARMAR', 'TRANSPORT', 12000.00,'SURAT','MALE',2021),
(111,'MAYANK', 'PUROHIT', 'ACCOUNT', 13000.00, 'NULL', 'MALE', 2020 );

SELECT * FROM EMPLOYEE 


CREATE TABLE MAYTABLE(
 OrderID INT,
CustomerName VARCHAR(50),
City VARCHAR(30),
Product VARCHAR(50),
Category VARCHAR(30),
Quantity INT,
UnitPrice DECIMAL(10,2),
OrderDate DATE,
PaymentMode VARCHAR(20)
);

CREATE TABLE PATIENTRECORD (
RecordID INT PRIMARY KEY,
PatientName VARCHAR(100),
DiagnosisCode VARCHAR(50),
TreatmentPlan VARCHAR(250)
);

INSERT INTO PATIENTRECORD (RecordID, PatientName, DiagnosisCode, TreatmentPlan) VALUES
(201, 'Amy Smith', 'ABC-123', 'Take vitamin pills daily.'),
(202, 'Bob Jones', 'abc-999', 'Rest and drink water.'),
(203, 'Cody Miller', 'XYZ-450', 'Take antibiotics daily.'),
(204, 'Dan_Webb', 'E11', 'Check blood sugar.'),
(205, '1st_Test', 'XYZ-%', 'Emergency care.');

SELECT * FROM PATIENTRECORD
DROP TABLE PATIENTRECORD

CREATE TABLE LIBRARYBORROWING (
BorrowID INT PRIMARY KEY,
MemberName VARCHAR (50),
BookGenre VARCHAR (30),
DaysBorrowed INT,
FineAmount DECIMAL (8,2)
);
INSERT INTO LIBRARYBORROWING VALUES
(1, 'Amit', 'Fiction', 12, 60.00),
(2, 'Neha', 'Science', 8, 20.00),
(3, 'Rahul', 'History', 15, 75.00),
(4, 'Priya', 'Fiction', 5, 0.00),
(5, 'Karan', 'Science', 10, 35.00),
(6, 'Sneha', 'Technology', 20, 120.00),
(7, 'Amit', 'History', 7, 15.00),
(8, 'Neha', 'Technology', 18, 95.00),
(9, 'Rahul', 'Fiction', 9, 30.00),
(10, 'Priya', 'Science', 11, 45.00);
SELECT * FROM LIBRARYBORROWING


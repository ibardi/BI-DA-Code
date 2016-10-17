CREATE DATABASE Sample2db;
GO

USE Sample2db;
GO

CREATE TABLE Student(
  StudentID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL);

  CREATE TABLE Course(
  CourseID bigint NOT NULL PRIMARY KEY,
  CourseTitle varchar(50) NOT NULL,
  Instuctor varchar(50) NOT NULL);

  
CREATE TABLE CourseEnrollment(
  EnrollmentID bigint NOT NULL PRIMARY KEY,
  StudentId bigint NOT NULL,
  CourseID bigint NOT NULL,
  Grade float NOT NULL);

 ALTER TABLE CourseEnrollment ADD CONSTRAINT FK_CourseEnrollment_Student 
FOREIGN KEY (StudentId) REFERENCES Student(StudentID);
GO

INSERT INTO Student (StudentID, FirstName, LastName) VALUES 
(1, 'Rachel', 'Burstiner'),
(2, 'Ryan', 'Colaco'),
(3, 'Julia', 'Harrigan'),
(4, 'Jillian', 'Klinvex'),
(5, 'Mark', 'Koerner'),
(6, 'Anne', 'McCormack'),
(7, 'Julie', 'Zhou'),
(8, 'Li', 'Liang'),
(9, 'Meaghan', 'Merullo'),
(10, 'Theresia', 'Susanto');

INSERT INTO Course(CourseID, CourseTitle, Instuctor) VALUES 
(1, 'MIS3545-BUSINESS INTELLIGENCE AND DATA ANALYTICS', 'Zhi'),
(2, 'MIS3690-WEB TECHNOLOGIES', 'Shankar'),
(3, 'QTM3000-CASE STUDIES IN BUSINESS ANALYTICS', 'Nathan'),
(4, 'QTM3625-FINANCIAL SIMULATION', 'Dessi'),
(5, 'SME2012-MANAGING INFORMATION TECH AND SYSTEMS', 'Clare');
GO

-- Delete the SME course
DELETE FROM Course
WHERE CourseTitle like 'SME%';
GO 


-- Some queries
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM CourseEnrollment;
GO

CREATE VIEW vwStudentGradeSummary WITH SCHEMABINDING AS
 SELECT
   s.StudentID, s.FirstName, s.LastName, 
   ISNULL(COUNT(ce.CourseID), 0) AS NumberOfCourses,
   ISNULL(SUM(ce.Grade), 0) AS TotalGrade
  FROM
   dbo.Student AS s
   LEFT OUTER JOIN dbo.CourseEnrollment AS ce ON s.StudentID = ce.StudentId
  GROUP BY
   s.StudentID, s.FirstName, s.LastName
GO

SELECT * FROM vwStudentGradeSummary;



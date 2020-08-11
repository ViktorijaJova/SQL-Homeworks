USE [SEDC_Homework]
GO

SELECT 
COUNT(g.Grade) as AllGrades
FROM dbo.[Grade] as g
GO

SELECT t.Id,t.FirstName,t.LastName,
COUNT(g.Grade) as GradePerTeacher
FROM dbo.[Grade] as g
INNER JOIN dbo.[Teacher] as t on t.Id = g.TeacherID
GROUP BY t.Id,t.FirstName,t.LastName
GO

SELECT t.Id,t.FirstName,t.LastName,
COUNT(g.Grade) as GradePerTeacher
FROM dbo.[Grade] as g
INNER JOIN dbo.[Teacher] as t on t.Id = g.TeacherID
INNER JOIN dbo.[Student] as s on s.Id = g.StudentId
WHERE s.Id < 100
GROUP BY t.Id,t.FirstName,t.LastName
GO

SELECT s.Id,s.FirstName,s.LastName,
MAX(g.Grade) as GradeMax,
AVG(g.Grade) as GradeAvg
FROM dbo.[Grade] as g
INNER JOIN dbo.[Student] as s on s.Id = g.StudentId
GROUP BY s.Id,s.FirstName,s.LastName
GO

SELECT t.Id,t.FirstName,t.LastName,
COUNT(g.Grade) as GradePerTeacher
FROM dbo.[Grade] as g
INNER JOIN dbo.[Teacher] as t on t.Id = g.TeacherID
GROUP BY t.Id,t.FirstName,t.LastName
HAVING COUNT(g.Grade) > 200
GO

SELECT t.Id, t.FirstName, t.LastName,
COUNT(g.Grade) as GradePerTeacher
FROM dbo.[Grade] as g
INNER JOIN dbo.[Teacher] as t on t.Id = g.TeacherID
INNER JOIN dbo.[Student] as s on s.Id = g.StudentId
WHERE s.Id < 100
GROUP BY t.Id,t.FirstName,t.LastName
HAVING COUNT(g.Grade) > 50
GO

SELECT s.Id,
COUNT(g.Grade) as GradeCount,
MAX(g.Grade) as GradeMax,
AVG(g.Grade) as GradeAvg
FROM dbo.[Grade] as g
INNER JOIN dbo.[Student] as s on s.Id = g.StudentId
GROUP BY s.Id,s.FirstName,s.LastName
GO

SELECT s.Id, s.FirstName,s.LastName,
COUNT(g.Grade) as GradeCount,
MAX(g.Grade) as GradeMax,
AVG(g.Grade) as GradeAvg
FROM dbo.[Grade] as g
INNER JOIN dbo.[Student] as s on s.Id = g.StudentId
GROUP BY s.Id,s.FirstName,s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)
GO

CREATE VIEW vv_StudentGrades
AS
SELECT s.Id, s.FirstName, s.LastName,
COUNT (g.Grade) as GradeCount
FROM dbo.[Student] as s
INNER JOIN dbo.[Grade] as g on g.StudentId = s.Id
GROUP BY s.Id, s.FirstName, s.LastName
GO

SELECT 
*
FROM vv_StudentGrades
GO

DROP VIEW vv_StudentGrades
GO

ALTER VIEW vv_StudentGrades
AS
SELECT s.FirstName,s.LastName,
COUNT(g.Grade) as GradeCount
FROM dbo.[Student] as s
INNER JOIN dbo.[Grade] as g on g.StudentId = s.Id
GROUP BY s.FirstName, s.LastName
GO

SELECT
*
FROM vv_StudentGrades as s
ORDER BY s.GradeCount DESC
GO

CREATE VIEW vv_StudentGradeDetails
AS
SELECT s.Id, s.FirstName, s.LastName,
COUNT(g.CourseId) as PassedCourse 
FROM dbo.[GradeDetails] as gd
INNER JOIN dbo.[Grade] as g on g.Id = gd.GradeId
INNER JOIN dbo.[Student] as s on s.Id = g.StudentId
GROUP BY s.Id, s.FirstName, s.LastName
GO

SELECT
*
FROM vv_StudentGradeDetails
GO

DROP VIEW vv_StudentGradeDetails
GO
CREATE DATABASE CourseDatabase;

CREATE TABLE Students (
    Id INT PRIMARY KEY identity(1,1),
    Name NVARCHAR(50),
    Surname NVARCHAR(50),
    Age INT,
    Email NVARCHAR(100),
    Address NVARCHAR(100)
);

insert into Students([Name],[Surname],[Age],[Address])
values('Nurane','Ismayilzade',22,'Ramana'),
	('Nunu','Ismayilzade',21,'Xalqlar'),
	('Ismayil','Ismayilov',17,'merdekan'),
	('Ruslan','Eliyev',20,'sumgayit'),
	('Nurlan','Eliyev',21,'ehmedli'),
	('Konul','Qasimova',46,'tovuz'),
	('Aqsin','Ismayilov',47,'gence'),
	('Huseyn','Huseynov',44,'naxcivan'),
	('Turane','Anarli',34,'seki')

CREATE TABLE StudentArchives (
    Id INT PRIMARY KEY identity(1,1),
    Name NVARCHAR(50),
    Surname NVARCHAR(50),
    Age INT,
    Email NVARCHAR(100),
    Address NVARCHAR(100),
    DeletedDate DATETIME DEFAULT GETDATE()
);


CREATE TABLE StudentArchives (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50),
    Surname NVARCHAR(50),
    Age INT,
    Email NVARCHAR(100),
    Address NVARCHAR(100),
    DeletedDate DATETIME DEFAULT GETDATE() -- Silinme tarihi alan?
);
GO

CREATE PROCEDURE DeleteStudent
    @StudentId INT
AS
BEGIN
    DECLARE @Name NVARCHAR(50);
    DECLARE @Surname NVARCHAR(50);
    DECLARE @Age INT;
    DECLARE @Email NVARCHAR(100);
    DECLARE @Address NVARCHAR(100);

    SELECT @Name = Name, @Surname = Surname, @Age = Age, @Email = Email, @Address = Address
    FROM Students
    WHERE Id = @StudentId;

    INSERT INTO StudentArchives (Id, Name, Surname, Age, Email, Address)
    VALUES (@StudentId, @Name, @Surname, @Age, @Email, @Address);

    DELETE FROM Students WHERE Id = @StudentId;
END;

EXEC DeleteStudent @StudentId = 1;

SELECT * FROM StudentArchives;

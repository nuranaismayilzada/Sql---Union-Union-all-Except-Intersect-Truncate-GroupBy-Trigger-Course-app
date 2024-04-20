create database Course
CREATE TABLE Countries (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50)
);
INSERT INTO Countries (Id, Name) VALUES
(1, 'USA'),
(2, 'UK'),
(3, 'Canada');

CREATE TABLE Cities (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50),
    CountryId INT,
    FOREIGN KEY (CountryId) REFERENCES Countries(Id)
);

INSERT INTO Cities (Id, Name, CountryId) VALUES
(1, 'New York', 1),
(2, 'London', 2),
(3, 'Toronto', 3);

CREATE TABLE Teachers (
    Id INT PRIMARY KEY,
    FullName NVARCHAR(100),
    Salary DECIMAL(10, 2),
    CityId INT,
    FOREIGN KEY (CityId) REFERENCES Cities(Id)
);

INSERT INTO Teachers (Id, FullName, Salary, CityId) VALUES
(1, 'Cavid Besirov', 50000, 1),
(2, 'Ismayil Seyidmemmedli', 55000, 2),
(3, 'Alisa Ismayilzade', 48000, 3);

CREATE TABLE Students (
    Id INT PRIMARY KEY,
    FullName NVARCHAR(100),
    Age INT,
    Email NVARCHAR(100),
    CityId INT,
    FOREIGN KEY (CityId) REFERENCES Cities(Id)
);
INSERT INTO Students (Id, FullName, Age, Email, CityId) VALUES
(1, 'Alice Ismayilll', 20, 'alice@example.com', 1),
(2, 'Nunu Nunuuu', 22, 'nunuuu@example.com', 2),
(3, 'Ismayill Ismayilofff', 17, 'isi@example.com', 3);


CREATE TABLE Rooms (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50),
    Capacity INT
);

INSERT INTO Rooms (Id, Name, Capacity) VALUES
(1, 'Room A', 30),
(2, 'Room B', 25),
(3, 'Room C', 35);


CREATE TABLE Groups (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50),
    RoomId INT,
    FOREIGN KEY (RoomId) REFERENCES Rooms(Id)
);

INSERT INTO Groups (Id, Name, RoomId) VALUES
(1, 'P140', 1),
(2, 'P418', 2),
(3, 'BP180', 3);


CREATE TABLE TeacherGroups (
    Id INT PRIMARY KEY,
    TeacherId INT,
    GroupId INT,
    FOREIGN KEY (TeacherId) REFERENCES Teachers(Id),
    FOREIGN KEY (GroupId) REFERENCES Groups(Id)
);

INSERT INTO TeacherGroups (Id, TeacherId, GroupId) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);


CREATE TABLE StudentGroups (
    Id INT PRIMARY KEY,
    GroupId INT,
    StudentId INT,
    FOREIGN KEY (GroupId) REFERENCES Groups(Id),
    FOREIGN KEY (StudentId) REFERENCES Students(Id)
);

INSERT INTO StudentGroups (Id, GroupId, StudentId) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

CREATE TABLE StafffMembers (
    Id INT PRIMARY KEY,
    FullName NVARCHAR(100),
    Position NVARCHAR(100),
    Salary DECIMAL(10, 2),
    CityId INT,
    FOREIGN KEY (CityId) REFERENCES Cities(Id)
);

INSERT INTO StafffMembers (Id, FullName, Position, Salary, CityId) VALUES
(1, 'Salammm', 'Programmer', 40000, 1),
(2, 'Hello', 'Teacher', 30000, 2),
(3, 'Hiiii', 'IT', 60000, 3);

CREATE TABLE Roles (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50)
);

INSERT INTO Roles (Id, Name) VALUES
(1, 'Admin'),
(2, 'Teacher'),
(3, 'Student'),
(4, 'Staff');
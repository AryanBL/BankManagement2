-- Fix column width first
ALTER TABLE Student ALTER COLUMN Field nvarchar(30);

-- Clear partial data
DELETE FROM STC;
DELETE FROM Student;
DELETE FROM Teacher;
DELETE FROM Course;

-- Reset identity counters
DBCC CHECKIDENT ('Student', RESEED, 0);
DBCC CHECKIDENT ('Teacher', RESEED, 0);
DBCC CHECKIDENT ('Course', RESEED, 0);

-- Insert Students
INSERT INTO Student (SName, SFamily, Field) VALUES
('Ali',     'Ahmadi',     'Computer Science'),
('Sara',    'Mohammadi',  'Mathematics'),
('Reza',    'Hosseini',   'Physics'),
('Mina',    'Karimi',     'Computer Science'),
('Hasan',   'Rezaei',     'Electrical Eng'),
('Zahra',   'Nazari',     'Mathematics'),
('Omid',    'Moradi',     'Physics'),
('Leila',   'Safari',     'Computer Science'),
('Dariush', 'Taheri',     'Electrical Eng'),
('Neda',    'Ghorbani',   'Mathematics'),
('Sina',    'Yousefi',    'Computer Science'),
('Fatemeh', 'Mansouri',   'Physics'),
('Mehdi',   'Sadeghi',    'Electrical Eng'),
('Parisa',  'Rahimi',     'Computer Science'),
('Kamran',  'Ebrahimi',   'Mathematics');

-- Insert Teachers
INSERT INTO Teacher (Tname, TFamily) VALUES
('Mohammad', 'Alavi'),
('Farhad',   'Bagheri'),
('Shirin',   'Darabi'),
('Javad',    'Esfahani'),
('Maryam',   'Farahani');

-- Insert Courses
INSERT INTO Course (CName, Units) VALUES
('Algorithms',       3),
('Linear Algebra',   3),
('Physics I',        2),
('Database',         3),
('Circuits',         2),
('Calculus',         3),
('Data Structures',  3),
('Signals',          2),
('Operating Systems',3),
('Statistics',       2);

-- Insert STC
INSERT INTO STC (Sid, Cid, Tid, mark) VALUES
(1, 1, 1, 18.5), (1, 4, 3, 17.0), (1, 7, 2, 19.0),
(2, 2, 2, 15.5), (2, 6, 4, 16.0), (2,10, 5, 14.5),
(3, 3, 3, 12.0), (3, 8, 1, 13.5), (3, 5, 4, 11.0),
(4, 1, 1, 20.0), (4, 4, 3, 18.0), (4, 9, 2, 17.5),
(5, 5, 4, 16.5), (5, 8, 1, 15.0), (5, 3, 3, 14.0),
(6, 2, 2, 19.5), (6, 6, 4, 18.0), (6,10, 5, 17.0),
(7, 3, 3, 10.0), (7, 8, 1, 11.5), (7, 5, 4, 12.5),
(8, 1, 1, 16.0), (8, 4, 3, 15.5), (8, 7, 2, 14.0),
(9, 5, 4, 13.0), (9, 8, 1, 12.5), (9, 9, 2, 11.0),
(10,2, 2, 17.5), (10,6, 4, 16.5), (10,10,5, 15.5),
(11,1, 1, 19.0), (11,4, 3, 18.5), (11,7, 2, 20.0),
(12,3, 3, 14.5), (12,8, 1, 13.0), (12,5, 4, 12.0),
(13,5, 4, 15.0), (13,8, 1, 14.5), (13,9, 2, 16.0),
(14,1, 1, 17.0), (14,4, 3, 16.5), (14,7, 2, 18.0),
(15,2, 2, 11.5), (15,6, 4, 12.0), (15,10,5, 13.5);
-- Create Tables
CREATE TABLE S (
    S# varchar(5) PRIMARY KEY,
    SName nvarchar(30),
    Status int,
    City nvarchar(20)
);

CREATE TABLE P (
    P# varchar(5) PRIMARY KEY,
    PName nvarchar(20),
    Color nvarchar(15),
    Weight int,
    City nvarchar(20)
);

CREATE TABLE SP (
    S# varchar(5) FOREIGN KEY REFERENCES S(S#),
    P# varchar(5) FOREIGN KEY REFERENCES P(P#),
    Qty int,
    PRIMARY KEY (S#, P#)
);

-- Load S
INSERT INTO S VALUES
('S1', N'فن آوران', 30, N'تهران'),
('S2', N'پولادین',  20, N'تبریز'),
('S3', N'آریا صنعت',45, N'اصفهان'),
('S4', N'کاران',    15, N'مشهد'),
('S5', N'پارس تک',  35, N'تهران'),
('S6', N'نوین پارت',25, N'شیراز'),
('S7', N'آلفا',     10, N'تبریز'),
('S8', N'بتا صنعت', 50, N'تهران');

-- Load P
INSERT INTO P VALUES
('P1', 'AA', 'Red',    10, N'تهران'),
('P2', 'BB', 'Green',  20, N'شیراز'),
('P3', 'CC', 'Red',    15, N'تهران'),
('P4', 'DD', 'Blue',   25, N'اصفهان'),
('P5', 'EE', 'Yellow', 12, N'مشهد'),
('P6', 'FF', 'Green',  30, N'تهران'),
('P7', 'GG', 'Blue',   18, N'شیراز'),
('P8', 'HH', 'Red',    22, N'تبریز');

-- Load SP
INSERT INTO SP VALUES
('S1','P1',300), ('S1','P2',200), ('S1','P4',150), ('S1','P6',500),
('S2','P2',400), ('S2','P3',100), ('S2','P5',250), ('S2','P7',350),
('S3','P1',200), ('S3','P3',300), ('S3','P6',100), ('S3','P8',450),
('S4','P2',150), ('S4','P4',200), ('S4','P5',100),
('S5','P1',600), ('S5','P3',250), ('S5','P6',300), ('S5','P7',200),
('S6','P2',350), ('S6','P4',150), ('S6','P8',200),
('S7','P1',100), ('S7','P5',300), ('S7','P6',400),
('S8','P2',500), ('S8','P3',350), ('S8','P4',200), ('S8','P7',150), ('S8','P8',100);
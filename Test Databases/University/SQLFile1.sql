create table Student(
	Sid int identity,
	SName nvarchar(20),
	SFamily nvarchar(20),
	Field nvarchar(20),
	primary key(Sid)
);


create table Teacher(
	Tid int identity,
	Tname nvarchar(20),
	TFamily nvarchar(20),
	primary key(Tid)
);


create table Course(
	Cid int identity,
	CName nvarchar(20),
	Units int,
	primary key(Cid)
);


create table STC(
	Sid int foreign key references Student(Sid),
	Cid int foreign key references Course(Cid),
	Tid int foreign key references Teacher(Tid),
	primary key(Tid, Sid, Cid),
	mark real
);
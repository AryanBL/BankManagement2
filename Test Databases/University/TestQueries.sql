select * from Student where Sid not in(
	select Sid from STC where Cid in(
		select Cid from Course where Units = 3 
	)
);

select * from Student, STC where Student.Sid = STC.Sid;

select * from Student join STC on Student.Sid > STC.Sid;

select * from Student join STC on Student.Sid = STC.Sid join Course on STC.Cid = Course.Cid join Teacher on Teacher.Tid = STC.Tid; 


select Student.*, Course.* from Student join STC on Student.Sid = STC.Sid join Course on Course.Cid = STC.Cid and Course.CName = 'Circuits' and STC.mark >= 10;

select Teacher.* from Teacher where Teacher.Tid not in(
	select Tid from STC where Cid in(
		select Cid from Course where Course.CName = 'Algorithms' and STC.mark >= 10
	)
)

select Student.Sid, Student.SFamily, Student.SName from Student, Student st where Student.SName = st.SName and Student.SFamily = st.SFamily and Student.Sid <> st.Sid;

select Student.*, STC.* from Student left join STC on Student.Sid = STC.Sid;

select count(Sid) from Student where Student.Field = 'Computer Science';


select count(distinct Sid) N from STC where mark <10; 
select max(STC.mark) N, min(STC.mark) M from STC join Student on Student.Sid = STC.Sid and Student.Field = 'Computer Science'; 


SELECT distinct STC.mark AS N
FROM STC
JOIN Student ON Student.Sid = STC.Sid 
WHERE Student.Field = 'Computer Science'
  AND NOT EXISTS (
    SELECT 1
    FROM STC STC2
    JOIN Student S2 ON S2.Sid = STC2.Sid
    WHERE S2.Field = 'Computer Science'
      AND STC2.mark > STC.mark
  );

SELECT distinct STC.mark AS M
FROM STC
JOIN Student ON Student.Sid = STC.Sid 
WHERE Student.Field = 'Computer Science'
  AND NOT EXISTS (
    SELECT 1
    FROM STC STC2
    JOIN Student S2 ON S2.Sid = STC2.Sid
    WHERE S2.Field = 'Computer Science'
      AND STC2.mark < STC.mark
  );

select count(distinct Teacher.Tid) M from Teacher join STC on STC.Tid = Teacher.Tid join Course on Course.Cid = STC.Cid and Course.CName = 'Database';

select count(distinct Teacher.Tid) M from Teacher where Teacher.Tid not in(
    select Tid from STC join Course on STC.Cid = Course.Cid and Course.CName = 'Database'
);


select distinct Student.* from Student join STC on Student.Sid = STC.Sid where STC.mark > (
    select avg(mark) from STC
);

SELECT * FROM Student WHERE Sid IN
(SELECT SId FROM STC WHERE mark>(SELECT AVG(mark)  FROM STC))

go

--create procedure selectStudents @name nvarchar(20)
--as select * from Student where SName = @name;

--go

exec selectStudents @name = 'Sina';

go

--create view fieldGroup as select Sid, Field from Student group by Field, Sid;

go

with belowAVG as (
    SELECT * FROM Student WHERE Sid IN
    (SELECT SId FROM STC WHERE mark<(SELECT AVG(mark)  FROM STC))
)


select * from belowAVG where Sid > 5;
select Sid as CS from fieldGroup where Field = 'Computer Science';

select top(10) 1 from Student 

select Sid, AVG(mark) as avg from STC group by Sid order by Sid

select Cid, MAX(mark) as max from STC group by Cid order by Cid

select Teacher.Tid,TFamily, Cid, count(Sid) as NOStudent from STC join Teacher on STC.Tid = Teacher.Tid group by Teacher.Tid, Cid, TFamily order by TFamily

select Sid, AVG(mark) as average from STC group by Sid having AVG(mark) < 16

select Sid from STC group by Sid having count(distinct Cid)>=3

select Sid from STC except ((select Sid from STC join Course on STC.Cid = Course.Cid) except select Sid from STC)

select Teacher.Tid, TFamily, count(Sid) as NOStudent from Teacher join STC on STC.Tid = Teacher.Tid where TFamily like 'B%' group by Teacher.Tid, TFamily having count(distinct Sid)>1

delete from Course where Cid not in(select Cid from STC)

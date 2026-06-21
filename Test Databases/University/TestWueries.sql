select * from Student where Sid not in(
	select Sid from STC where Cid in(
		select Cid from Course where Units = 3 
	)
);

select * from Student, STC where Student.Sid = STC.Sid;

select * from Student join STC on Student.Sid > STC.Sid;

select * from Student join STC on Student.Sid = STC.Sid join Course on STC.Cid = Course.Cid join Teacher on Teacher.Tid = STC.Tid; 


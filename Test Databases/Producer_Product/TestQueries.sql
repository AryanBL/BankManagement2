select * from S where S.S# in ( select S# from SP where P# = 'P2');
select * from s where status = 29 or status = 31 or status = 33;
select PName from P where P.Weight >any(select Weight from P);
select PName from P where P.Weight <=ALL(select Weight from P);
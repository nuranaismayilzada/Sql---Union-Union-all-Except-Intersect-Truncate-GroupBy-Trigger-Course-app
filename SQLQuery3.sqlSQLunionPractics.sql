select [FullName] from Teachersss
select [FullName] from Studentss

select [FullName] from Teachersss
union
select [FullName] from Studentss

select [FullName] from Teachersss
union all
select [FullName] from Studentss

select [FullName] from Teachersss
intersect
select [FullName] from Studentss

select [FullName] from Teachersss
except
select [FullName] from Studentss

select [FullName] from Studentss
except
select [FullName] from Teachersss

create table Doctors(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Address] nvarchar(100)
)

delete from Doctors

truncate table Doctors

select *from Studentss



select COUNT(*) as 'Count',Age
from Studentss
GROUP BY Age;


select COUNT(*) as 'Count',Age
from Studentss
GROUP BY Age
order by Age DESC

declare @counter int
set @counter=1
while (@counter <=10)
begin
	print 'The counter value is=' +convert (nvarchar,@counter)
	set @counter=@counter +1
end


select GETDATE()


create table StudentLogs(
[Id] int primary key identity(1,1),
[StudentId] int,
[Operation] nvarchar(20),
[Date] datetime
)

select *from StudentLogs

create trigger trg_writeLogAfterCreate on Students
after insert
as 
begin
	insert into StudentLogs([StudentId],[Operation],[Date])
	select [Id],'Insert',GETDATE() from inserted
end
	

insert into Studentss([FullName],[Email],[Age],[Address],[CityId])
values ('Nurane Ismayilzade','nunu@gmail.com',21,'ramana',7)


exec test 'df'

create trigger trg_writeLogAfterCreate on Students
after update
as 
begin
	insert into StudentLogs([StudentId],[Operation],[Date])
	select [Id],'Update',GETDATE() from deleted
end


update Studentss
set [Email]='test@gmail.com'
where [Id]=1

select *from Studentss


update Studentss
set [Email]='test@gmail.com'
where [Id]=4


select *from StudentLogs where [Operation]='Update'
order by [Date] desc

create table EmpLogs(
[Id] int primary key identity(1,1),
[EmpName] nvarchar(100),
[OldEmail] nvarchar(100),
[NewEmail] nvarchar(100),
[Operation] nvarchar(100),
[Date] datetime
)

create trigger trg_writeLogAfteerEditEmail on Employes
after update
as 
begin
	@declare @oldEmail nvarchar(200)=(select [Email] from Employes where [Id]=2)
	insert into StudentLogs([FullName],[OldEmail],[NewEmail],[Operation],[Date])
	select [FullName],[OldEmail],[NewEmail],'Update',GETDATE() from deleted
end


create trigger trg_writeLogAfteerEditEmail on EmployesLogs
after update
as 
begin
	@declare @oldEmail nvarchar(200)=(select [Email] from Employes where [Id]=2)
	insert into StudentLogs([FullName],[OldEmail],[NewEmail],[Operation],[Date])
	select [FullName],[OldEmail],[NewEmail],'Update',GETDATE() from deleted
end

update Employes
set [Email] ='salam@aaagmail.com'
where [Id]=13


select *from Employes
select *from EmployesLogs


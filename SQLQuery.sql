create database Payroll_Service
use Payroll_Service

Create Table employee_payroll
(ID int identity(1,1) primary key,Name varchar(20)NOT NULL,Salary float,StartDate Date)

Insert into employee_payroll values('Rajvardhan Singh', 2000, '2022-01-12')
Insert into employee_payroll values('Akshay Pratap', 3000, '2021-12-06')
Insert into employee_payroll values('Mohit Verma', 1800, '2022-03-30')

Select * from employee_payroll

Select Salary from employee_payroll where Name = 'Rajvardhan Singh'
Select Salary from employee_payroll where StartDate Between CAST('2021-12-10' as date) and GETDATE()

Alter table employee_payroll 
Add Gender varchar(1)

Update employee_payroll set Gender = 'F'
Update employee_payroll set Gender ='M' where Name = 'Rajvardhan Singh' or Name = 'Akshay Pratap' or Name = 'Mohit Verma'

select Sum(Salary) as "TotalSalary" from employee_payroll where Gender ='M' group by Gender
select Avg(Salary) as "AverageSalary" from employee_payroll where Gender ='M' group by Gender
select Min(Salary) as "MinimumSalary" from employee_payroll group by Gender;
select Max(Salary) as "MaximumSalary" from employee_payroll group by Gender;
select count(Salary) as "CountSalary" from employee_payroll group by Gender;

Alter table employee_payroll add PhoneNumber bigint, Address varchar(200) default 'Mumbai', Department varchar(100) not null default 'Marketing'

Alter table employee_payroll add Basic_Pay int, Deductions int, Taxable_Pay int, Income_Tax int, Net_Pay int

Insert into employee_payroll (Name, Basic_Pay, StartDate, Gender)
values('Terrisa', 2000, '2022-05-16', 'F')

Update employee_payroll set Department = 'Sales' where Name = 'Terrisa'
Insert into employee_payroll (Name, Department) values ('Terrisa', 'Marketing')

create Table Company
(
ID	int,
CompanyName	varchar(255),
constraint Company_foreign_Key_EmpID foreign key(ID) references employee_payroll(ID) on delete cascade
)
insert into Company select ID, Name from employee_payroll
Select * from Company

create Table Payrollofemployee
(
ID		int,
Basic_Pay	int,
Deductions	int,
Taxable_Pay	int,
Income_Tax	int,
Net_Pay		int
constraint Payrollofemployee_foreign_Key_ID foreign key(ID) references employee_payroll(ID) on delete cascade
)
Insert into Payrollofemployee select ID, Basic_Pay, Deductions, Taxable_Pay, Income_Tax, Net_Pay from employee_payroll
Select * from Payrollofemployee

create table Departmenttable
(
ID int,
Department varchar (20)
constraint Departmenttable_foreign_Key_ID foreign key(ID) references employee_payroll(ID) on delete cascade)
insert into Departmenttable select ID,Department from employee_payroll
Select * from Departmenttable


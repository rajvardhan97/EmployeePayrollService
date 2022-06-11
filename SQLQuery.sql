create database Payroll_Service
use Payroll_Service

Create Table employee_payroll
(ID int identity(1,1) primary key,Name varchar(20)NOT NULL,Salary float,StartDate Date)

Insert into employee_payroll values('Rajvardhan Singh', 2000, '2022-01-12')
Insert into employee_payroll values('Akshay Pratap', 3000, '2021-12-06')
Insert into employee_payroll values('Mohit Verma', 1800, '2022-03-30')

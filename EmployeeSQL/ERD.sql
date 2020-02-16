-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/CKWNB0
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [departments] (
    [dept_no] varchar(4)  NOT NULL ,
    [dept_name] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [dept_emp] (
    [emp_no] int  NOT NULL ,
    [dept_no] varchar(4)  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL 
)

CREATE TABLE [dept_manager] (
    [dept_no] varchar(4)  NOT NULL ,
    [emp_no] int  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL 
)

CREATE TABLE [employees] (
    [emp_no] int  NOT NULL ,
    [birth_date] date  NOT NULL ,
    [first_name] varchar(50)  NOT NULL ,
    [last_name] varchar(50)  NOT NULL ,
    [gender] varchar(1)  NOT NULL ,
    [hire_date] date  NOT NULL ,
    CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [salaries] (
    [emp_no] int  NOT NULL ,
    [salary] int(9)  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL 
)

CREATE TABLE [titles] (
    [emp_no] int  NOT NULL ,
    [title] varchar(50)  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL 
)

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_emp_no]

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_dept_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_dept_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_emp_no]

ALTER TABLE [salaries] WITH CHECK ADD CONSTRAINT [FK_salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [salaries] CHECK CONSTRAINT [FK_salaries_emp_no]

ALTER TABLE [titles] WITH CHECK ADD CONSTRAINT [FK_titles_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [titles] CHECK CONSTRAINT [FK_titles_emp_no]

COMMIT TRANSACTION QUICKDBD
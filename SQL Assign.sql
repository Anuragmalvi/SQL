-- Questions--
-- inserting comments
use hr;
select * from employees;
--  Q1 table return complete information 
					select * from employees;
					select * from departments;

-- Q2 Display the hire date and employee name for each employee
					select hire_date, concat(first_name, ' ' , last_name) as Fullname from employees;

-- Q3 Diplay ename concat with the job ID seperated by comma and name the column name Employee and title
					select concat( first_name, ' ' , last_name, ' ,' , job_id) as 'Employee and title' from employees;

-- Q4 Diplay hire date, name and department number for all clerks
					select hire_date ,concat(first_name, ' ' , last_name)as Full_name, department_id from employees;

-- Q5 Display all the information from Emp table and seperate each column by comma and name the column output

					select concat(employee_id,',',first_name,',',last_name,',',email,',',phone_number,',',hire_date,',',job_id,',',salary,',',manager_id,',',department_id) as "The ouput" from employees;

-- Q6 Diplaye names and salaries of all employees with a salary greater than 2000
					select concat(first_name, ' ' , last_name) as Full_name, Salary from employees where salary>2000;

-- Q7 Diplay name and dates of employees with column headers Name and Start Date
					select concat(first_name, ' ' , last_name)as Name, hire_date as StartDate from employees;

-- Q8 Display name and hire dates of employees in order they hired
					select concat(first_name, ' ' , last_name) as FullName, hire_date from employees order by hire_date asc;

-- Q9 Display names and salaries of employees in reverse salary order
					select concat(first_name, ' ' , last_name) as FullName, reverse(salary) from employees;

-- Q10 Display ename and deptno who are all earned commisiion and display the salary in reverse order 
use hr;
select * from employees;
					select concat(first_name,' ', last_name) as Ename, department_id, salary, commission_pct from employees where commission_pct is not null order by salary desc;
  
-- Q11. Display the last name and job title of all employees who do not have a manager
					select last_name, job_id from employees where manager_id is  null;

-- Q12. Display the last name, job, and salary for all employees whose job is sales representative 
-- or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
					select last_name, job_id, salary from employees where job_id='st_clerk' or job_id='sa_rep' and salary not in(2500,3500,5000);

-- Q13) Display the maximum, minimum and average salary and commission earned.    
					select max(salary) as Max_salary ,min(salary) as Mini_salary, avg(salary) as Avg_salary, max(commission_pct) as Max_commssion, min(commission_pct) as Min_commission, Avg(commission_pct) as Avg_commission from employees;


					select * from departments;
					select * from employees;
-- Department
use hr;
-- 1-- ) Display the department number, total salary payout and total commission payout for 
-- -- each department.
						select department_id, sum(salary) as 'Total Salary', sum(commission_pct)  as 'Total Commssion'from employees group by department_id ;

-- 3) Display the department number and number of employees in each department.   
						select department_id, count(employee_id) as 'Number of Employees' from employees group by department_id;

-- -- 4) Display the department number and total salary of employees in each department.   
						select department_id, sum(salary) as 'Total Salary' from employees group by department_id;

-- 5) Display the employee's name who doesn't earn a commission. Order the result set 
-- without using the column name   
						select concat(first_name,' ' , last_name) as Full_name, commission_pct from employees where commission_pct is null;

-- 6) Display the employees name, department id and commission. If an Employee doesn't  
-- earn the commission, then display as 'No commission'. Name the columns appropriately 
						select concat(first_name, ' ', last_name) as FUll_name, department_id, case when commission_pct>0 then commission_pct*1 else 'No commission'end as commission from  employees;

-- 7) Display the employee's name, salary and commission multiplied by 2. If an Employee 
-- doesn't earn the commission, then display as 'No commission. Name the columns 
-- appropriately  
						select concat(first_name, ' ', last_name) as FUll_name, salary, case when commission_pct>0 then commission_pct*2 else 'No commission'end  as Commission from  employees;
-- 8) Display the employee's name, department id who have the first name same as another 
-- employee in the same department  
						select e.first_name, d.department_id from employees as e join employees as d on e.first_name=d.first_name;

-- 9) Display the sum of salaries of the employees working under each Manager.  
						select Manager_id, sum(salary) as Salary from employees group by Manager_id;

-- 10) Select the--  Managers name, the count of employees working under and the department 
-- -- ID of the manager.   
		select * from employees;
						select first_name,count(employee_id), manager_id from employees group by manager_id;

-- 11) Select the employee name, department id, and the salary. Group the result with the 
-- manager name and the employee last name should have second letter 'a!   
						select last_name like '_a%', salary, department_id, salary  from employees group  by manager_id;
                       

-- 12) Display the average of sum of the salaries and group the result with the department id. 
-- Order the result with the department id. 
						select sum(salary) as ' avg sum salary', department_id from employees where  'avg sum salary' in (select avg( 'avg sum salary')
                        from employees) group by department_id;
                        
-- 13) Select the maximum salary of each department along with the department id   
						select department_id, max(salary) from employees group by department_id;

-- 14) Display the commission, if not null display 10% of salary, if null display a default value 1
						select  case when commission_pct>0 then '10% of Salary' else 1 end as Commission from employees;



-- 1. Write a query that displays the employee's last names only from the string's 2-5th 
-- position with the first letter capitalized and all other letters lowercase, Give each column an 
-- appropriate label.   
						select concat(upper(substring(last_name,2,1)),substring(last_name,3,5)) as 'Last name' from employees;
						select *from employees;


-- 2. Write a query that displays the employee's first name and last name along with a " in 
-- between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the 
-- month on which the employee has joined.  
						select concat(first_name,' ',last_name) as 'Emp name', hire_date from employees where 'Emp name' like '%a%';


-- 3. Write a query to display the employee's last name and if half of the salary is greater than 
-- ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
-- 1500 each. Provide each column an appropriate label.   
						select last_name, case when (salary/2)>10000 then (salary/2)*1.10 else (salary/2)*1.115+1500 end from employees;
select*from employees;
-- 4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, 
-- department id, salary and the manager name all in Upper case, if the Manager name 
-- consists of 'z' replace it with '$!   
							select * from employees;
                            select concat(substring(employee_id,2) from employees;


-- 5. Write a query that displays the employee's last names with the first letter capitalized and 
-- all other letters lowercase, and the length of the names, for all employees whose name 
-- starts with J, A, or M. Give each column an appropriate label. Sort the results by the 
-- employees' last names   
							select concat(upper(left(last_name,1)), substring(last_name,2)) as  Employee_name, length(last_name) as Selected_Last_name from employees where last_name like 'J%' or  last_name like 'A%' or  last_name like'M%';
-- 6. Create a query to display the last name and salary for all employees. Format the salary to 
-- be 15 characters long, left-padded with $. Label the column SALARY   
							select last_name, lpad(salary,15,'$')as SALARY from employees;					
-- 7. Display the employee's name if it is a palindrome   
							select first_name from employees where first_name=reverse(first_name);

-- 8. Display First names of all employees with initcaps.   
				select lower(first_name) from employees;
				select initcaps(First_name) from employees ;			

-- 9. From LOCATIONS table, extract the word between first and second space from the 
-- STREET ADDRESS column.   
select *from locations;
select delimeter(street_address,' ') from locations;

-- 10. Extract first letter from First Name column and append it with the Last Name. Also add 
-- "@systechusa.com" at the end. Name the column as e-mail address. All characters should 
-- be in lower case. Display this along with their First Name.   
select lower(concat(substring(first_name,1,1),last_name,'@systechusa.com')) as 'email address', first_name from employees;

-- 11. Display the names and job titles of all employees with the same job as Trenna.   
use hr;
select * from employees;
select first_name, last_name, job_id from employees where job_id=(select job_id from employees where first_name='Trenna');

-- 12. Display the names and department name of all employees working in the same city as 
-- Trenna.   
select first_name, last_name, department_name, city from employees join departments using (department_id) join locations using (location_id) where location_id =
(select location_id from departments where department_id in (select department_id from employees where first_name ='Trenna'));


-- 13. Display the name of the employee whose salary is the lowest.   
select first_name, salary from employees order by salary limit 1;

-- 14. Display the names of all employees except the lowest paid.
select first_name , salary from employees order by salary limit 5000 offset 1;

select first_name, min(salary) from employees group by first_name having min(salary);



-- 1. Write a query to display the last name, department number, department name for all 
-- employees. 
				select * from departments;
				
-- 2. Create a unique list of all jobs that are in department 4. Include the location of the 
-- department in the output.   
-- 3. Write a query to display the employee last name,department name,location id and city of 
-- all employees who earn commission.   
						select e.last_name, d.department_name, l.location_id, l.city, e.commission_pct from employees as e join departments as d on d.department_id=e.department_id join locations as l on l.location_id=d.location_id where commission_pct is not null;

-- 4. Display the employee last name and department name of all employees who have an 'a' 
-- in their last name   
						select e.last_name, d.department_name from employees as e join departments as d on d.department_id=e.department_id where last_name like '%a';

-- 5. Write a query to display the last name,job,department number and department name for 
-- all employees who work in SEATLE.   
						select last_name,  job_title, department_name, department_id from employees join departments using (department_id) join jobs using (job_id) join locations using (Location_id)
where city ='seattle';

-- 6. Display the employee last name and employee number along with their manager's last 
-- name and manager number.   
						select e.last_name, e.employee_id, (m.last_name) as Manager_Name, m.manager_id from employees as e 
                        join employees as m on e.employee_id=m.manager_id;


-- 7. Display the employee last name and employee number along with their manager's last 
-- name and manager number (including the employees who have no manager).   
select e.last_name, e.employee_id, (m.last_name) as Manager_Name, m.manager_id from employees as e 
                        join employees as m on e.employee_id=m.manager_id  where  m.manager_id is null;

-- 8. Create a query that displays employees last name,department number,and all the 
-- employees who work in the same department as a given employee.   
				select e.last_name, e.department_id, d.department_name from employees as e 
                join departments as d on e.department_id=d.department_id;

-- 9. Create a query that displays the name,job,department name,salary,grade for all 
-- employees.  Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)  
							select first_name, job_title, department_name, salary from employees join departments using (department_id) join jobs using (job_id) where salary 
                            between 9000 and 3000;
                            
-- 10. Display the names and hire date for all employees who were hired before their 
-- managers along withe their manager names and hire date. Label the columns as Employee 
-- name, emp_hire_date,manager name,man_hire_date


-- 1. Write a query to display the last name and hire date of any employee in the same 
-- department as SALES.   
						select e.last_name, e.hire_date from employees as e join departments as d on d.department_id=e.department_id where department_name='Sales';
                        
-- 2. Create a query to display the employee numbers and last names of all employees who 
-- earn more than the average salary. Sort the results in ascending order of salary.  
						select employee_id , last_name, salary from employees where salary>(select avg(salary) from employees);

-- 3. Write a query that displays the employee numbers and last names of all employees who 
-- work in a department with any employee whose last name contains a' u   
						select employee_id, last_name from employees  where last_name  like '%au%'; 

-- 4. Display the last name, department number, and job ID of all employees whose 
-- department location is ATLANTA.   
						select last_name, department_id, job_id  from employees where department_id = (select department_id from departments where location_id = (select location_id from locations where city ='Atlanta'));
                        select e.last_name , d.department_id, e.employee_id , l.city from employees as e join departments as d on d.department_id=e.department_id join locations as l on l.location_id=d.location_id where city='Atlanta';
                        
-- 5. Display the last name and salary of every employee who reports to FILLMORE.  

-- 6. Display the department number, last name, and job ID for every employee in the 
-- OPERATIONS department.   
						select department_id, last_name, job_id from employees where department_id in(select department_id from departments where department_name='Operations');
-- or
						select e.last_name, e.job_id, e.department_id from employees as e join departments as d on d.department_id=e.department_id and d.department_name='Operations';
-- 7. Modify the above query to display the employee numbers, last names, and salaries of all 
-- employees who earn more than the average salary and who work in a department with any 
-- employee with a 'u'in their name.   
select employee_id, last_name, salary from employees where department_id in(select department_id from employees where last_name like '%u%' and salary>(select avg(salary) from employees)); 
-- 8. Display the names of all employees whose job title is the same as anyone in the sales 
-- dept.   
select first_name , last_name from employees where department_id in (select department_id from departments where job_id in (select job_id from jobs where department_name='sales'));
-- 9. Write a compound query to produce a list of employees showing raise percentages, 
-- employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
-- employees in department 2 are given a 10% raise, employees in departments 4 and 5 are 
-- given a 15% raise, and employees in department 6 are not given a raise.  
 
-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last 
-- names and salaries.   
						select last_name, salary from employees order by salary desc limit 3;
-- 11. Display the names of all employees with their salary and commission earned. Employees 
-- with a null commission should have O in the commission column  
						select last_name, salary, case when commission_pct is null then 0  else commission_pct end from employees;
-- 12. Display the Managers (name) with top three salaries along with their salaries and 
-- department information. 
						select e.first_name, e.salary from employees as e right join departments as d on e.department_id=d.department_id order by salary desc limit 3;
use hr;

select *from locations;
select * from regions;
select *from countries;
select * from employees;
select * from departments;
select * from jobs;
select *from job_history;
use hr;
SELECT DEPARTMENT_ID, COUNT(*) AS COUNT_OF_EMPLOYEES FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, JOB_ID, COUNT(*) AS COUNT_OF_EMPLOYEES FROM EMPLOYEES
GROUP BY DEPARTMENT_ID,JOB_ID;

SELECT DEPARTMENT_ID, JOB_ID, COUNT(*) AS COUNT_OF_EMPLOYEES FROM EMPLOYEES
GROUP BY 1,2; -- we can use coulmn no. the one we used in the query  instead of thecolumn name

 -- TOTAL SALARY IN EACH DEPARTMENT

SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEES
GROUP BY 1 -- it will group by department 
ORDER BY 2 DESC; -- it will show the order by salary coulmn in descending order 

-- TOTAL, AVG, MIN SALARY IN EACH DEPARTMENT

SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL_SALARY, 
       AVG(SALARY) AS AVG_SALARY, 
                      MIN(SALARY) AS MIN_SALARY 
FROM EMPLOYEES
GROUP BY 1 
ORDER BY 2 DESC; -- bydefault it is aecn

-- TOTAL, AVG, MIN SALARY IN EACH DEPARTMENT WITH HAVING FILTER

SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL_SALARY, 
                      AVG(SALARY) AS AVG_SALARY, 
                      MIN(SALARY) AS MIN_SALARY 
FROM EMPLOYEES
GROUP BY 1
HAVING total_salary > 50000 and avg_salary between 1000 and 5000
ORDER BY MIN_SALARY,TOTAL_SALARY; -- or we can write ORDER BY 4.2;

-- DEPARTMENTS WHERE EMPLOYEES MORE THAN 10
SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL_SALARY, 
       AVG(SALARY) AS AVG_SALARY, 
                      MIN(SALARY) AS MIN_SALARY 
FROM EMPLOYEES
GROUP BY 1
HAVING COUNT(*) > 10 -- it will give the count of emplyoees who are woring on that department and it is department_id coz in group by we mentioned 1
ORDER BY 4,2;

-- GROUP BY ON JOINED TABLE
SELECT C.LOCATION_ID, COUNT(*) FROM EMPLOYEES A
INNER JOIN DEPARTMENTS B
USING(DEPARTMENT_ID)
INNER JOIN LOCATIONS C
USING(LOCATION_ID)
GROUP BY LOCATION_ID;

create database Regaluraexp;
use Regaluraexp;
CREATE TABLE regexp_example_tables (
  text_data VARCHAR(100)
);

INSERT INTO regexp_example_tables (text_data) VALUES
('abc123'),
('Hello World'),
('Testing 1 2 3'),
('NoNumbersHere'),
('start with whitespace'),
('123end with whitespace'),
('some random data'),
('Testing 123 Parkway');

select * from regexp_example_tables;
--  ^ CARET (START OF THE LINE)
SELECT * FROM regexp_example_tables WHERE TEXT_DATA LIKE 'A%'; -- NOT CASE SEN

SELECT * FROM regexp_example_tables WHERE TEXT_DATA REGEXP '^n'; -- NOT CASE SEN

SELECT * FROM regexp_example_tables WHERE TEXT_DATA collate utf8mb4_bin REGEXP '^S'; -- NO O/P COZ THERE IS NO CAPITAL S IN THE DATA

-- $ - END OF A LINE

SELECT * FROM regexp_example_tables WHERE TEXT_DATA REGEXP 'ce$'; -- TEXT ENDS WITH 'CE'

SELECT * FROM regexp_example_tables WHERE TEXT_DATA REGEXP 'ce$';

-- . - Any SINGLE character

SELECT * FROM regexp_example_tables WHERE TEXT_DATA REGEXP 'testing.';

SELECT * FROM regexp_example_tables WHERE TEXT_DATA REGEXP 'tes..ng';

SELECT * FROM regexp_example_tables WHERE TEXT_DATA REGEXP 'SOME ...... DATA';


SELECT * FROM regexp_example_tables WHERE TEXT_DATA collate utf8mb4_bin REGEXP '[NTPWH] [0-9]';
SELECT * FROM regexp_example_tables;

-- [] CHARACTER & numerical CLASS

SELECT * FROM regexp_example_tables WHERE TEXT_DATA REGEXP '[a-z]'; 

-- match either 12 or 45 but either 1 or 2 or 4 or 5
SELECT * FROM regexp_example_tables WHERE TEXT_DATA REGEXP '(12 | 45)';

-- any data that has atleast 1 number
SELECT * FROM regexp_example_tables WHERE TEXT_DATA REGEXP '[0-9]';

-- .* (.MATCHES SINGLE CHARACTER) '*' MATCHES ZERO OR MORE OCCURENCES
SELECT * FROM regexp_example_tables WHERE TEXT_DATA REGEXP '^H.*d$';

-- REGEXP REPLACE

SELECT regexp_replace('ODIN SCHOOL','[aeiou]','*');

SELECT REGEXP_REPLACE('Phone number +91 91234 91234','[0-9]','*');

-- replace only last 4 characters with *

select concat(substring('+91 91234 91234',1, length('+91 91234 91234') - 4), 
    regexp_replace(substring('+91 91234 91234',-4),'[0-9]', '*'));



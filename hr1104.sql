select * from tab;

--employees 테이블 전체 내용 조회

select * from employees;

--employees 테이블의 first_name, last_name, job_id만 조회

select first_name, last_name, job_id from employees;

-- 사원번호가 176인 사람의 LAST_NAME과 부서번호 조회
SELECT LAST_NAME, DEPARTMENT_ID FROM employees WHERE employee_id = 176;

-- 연봉이 12000 이상 되는 직원들의 LAST_NAME 및 연봉 조회
SELECT LAST_NAME, SALARY FROM employees WHERE SALARY>=10000;

-- 연봉이 5000에서 12000의 범위 이외의 사람들의 LAST_NAME 및 연봉 조회
SELECT LAST_NAME, SALARY FROM employees WHERE 5000 > SALARY OR SALARY >12000;

--20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서번호를 알파벳순으로 조회
SELECT LAST_NAME, DEPARTMENT_ID FROM employees WHERE department_id IN(20,50) ORDER BY LAST_NAME ASC, department_id ASC ;

--커미션을 버는 모든 사원들의 LAST_NAME, 연봉, 커미션 조회, 단, 연봉의 역순 및 커미션 역순
SELECT LAST_NAME, SALARY, commission_pct FROM employees WHERE commission_pct NOT IN(0) ORDER BY SALARY DESC, commission_pct DESC;


-- 연봉이 2500, 3500, 7000이 아니며, 직업이 SA_REP 이나 ST_CLERK인 사람들 조회
SELECT * FROM employees WHERE salary NOT IN(2500, 3500, 7000) AND job_id = 'SA_REP' OR job_id = 'ST_CLERK';


--2008/02/20 ~ 2008/05/01 사이에 고용된 사원들의 LAST_NAME, 사원번호, 고용일자 조회 단, 고용일자 내림차순으로 정렬
SELECT LAST_NAME,employee_id, hire_date FROM employees WHERE hire_date >= '2008-02-20' AND hire_date <= '2008-05-01' ORDER BY hire_date DESC;

-- 2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로 오름차순 정렬
SELECT LAST_VALUE, hire_date FROM employees WHERE hire_date >='2004-01-01' AND hire_date <= '2004-12-31' ORDER BY hire_date;

--연봉이 5000~ 12000, 20 OR 50번 부서에서 근무하는 사람들의 연봉을 조회하여 오름차순으로 보여주기(LAST_NAME, SALARY)
SELECT LAST_NAME,SALARY FROM employees WHERE department_id IN (20,50) AND SALARY BETWEEN 5000 AND 12000  ORDER BY SALARY ASC;

-- 2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로 오름차순 정렬
SELECT LAST_NAME, hire_date FROM employees WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-31' ORDER BY hire_date;

--연봉이 5000~12000가 아닌 사람들의 LAST_NAME, SALARY 조회
SELECT LAST_NAME,SALARY FROM employees WHERE SALARY NOT BETWEEN 5000 AND 12000;

-- 2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로 오름차순 정렬( LIKE 사용)
SELECT LAST_NAME, hire_date FROM employees WHERE hire_date LIKE '04%' ORDER BY hire_date ASC;

-- LAST_NAME 에 글자 u가 포함되는 사람들의 LAST_NAME 조회
SELECT LAST_NAME FROM employees WHERE LAST_NAME LIKE '%u%';

-- LAST_NAME 에 네번째 글자가 a인 사람들의 LAST_NAME 조회
SELECT LAST_NAME FROM employees WHERE LAST_NAME LIKE '___a%';

-- LAST_NAME 에 a혹은 e 글자가 있는 사원들의 LAST_NAME을 조회하여 LAST_NAME 기준으로 오른차순 정렬
SELECT LAST_NAME FROM employees WHERE LAST_NAME LIKE '%a%' OR LAST_NAME LIKE '%e%' ORDER BY LAST_NAME ASC;

-- LAST_NAME에 a와 e글자가 있는 사원들의 LAST_NAME을 조회하여 LAST_NAME 기준으로 오름차순 정렬
SELECT LAST_NAME FROM employees WHERE LAST_NAME LIKE '%a%e%' OR LAST_NAME LIKE '%a%e%' ORDER BY LAST_NAME ASC;

-- IS NULL
-- 매니저가 없는 사람들의 LAST_NAME, JOB_ID 조회
SELECT LAST_NAME, JOB_ID FROM employees WHERE manager_id IS NULL;

-- ST_CLERK인 JOB_ID를 가진 사원이 없는 부서 ID 조회. 부서 번호가 NULL인 값 제외
SELECT * FROM employees WHERE JOB_ID NOT IN('ST_CLERK') AND department_id IS NULL;

--COMMISSION_PCT NULL 이 아닌 사원들 중에서 COMMISSION = SALARY * COMMIUSSION_PCT를 구하여 EMPLOTEE_ID, FIRST_NAME, JOB_ID와 같이 조회
SELECT employee_id, FIRST_NAME, job_id, SALARY * COMMISSION_PCT AS COMMISION FROM employees WHERE commission_pct IS NOT NULL;

-- [실습] 문자열 함수
-- 1. first_name이 Curtis 인 사람의 first_name, last_name, email, phone_number, job_id를 조회한다, 단, job_id의 결과는 소문자로 출력되도록 한다.
SELECT FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, LOWER(JOB_ID)
FROM employees
WHERE FIRST_NAME = 'Curtis';

-- 2. 부서번호가 70,80,90인 사람들의 employee_id, first_name, hire_date, job_id를 조회한다. 단, job_id가 it_prog인 사원의 경우 프로그래머로 변경하여 출력한다.
SELECT employee_id, first_name, hire_date, REPLACE(job_id, 'IT_PROG','프로그래머')
FROM employees
WHERE department_id IN (60,70,80,90);

-- 3. job_id가 ad_pres, pu_clerk인 사원들의 employee_id, first_name,last_name,department_id, job_id를 조회하시오, 단, 사원명은 first_name과 last_name을 연결하여 출력한다
SELECT employee_id, CONCAT(first_name,CONCAT(' ',last_name)),department_id, JOB_ID FROM employees WHERE job_id IN('AD_PRES','PU_CLERK');

-- ppt 4번 문제
SELECT last_name,salary,
CASE WHEN salary < 2000 THEN 0
WHEN salary < 4000 THEN 0.09
WHEN salary < 6000 THEN 0.2
WHEN salary < 8000 THEN 0.3
WHEN salary < 10000 THEN 0.4
WHEN salary < 12000 THEN 0.42
WHEN salary < 14000 THEN 0.44
ELSE 0.45 END AS TAX_RATE FROM employees;

--join 실습
-- 자신의 담당 매니저의 고용일보다 빠른 입사자를 찾아 HIRE_DATE, LAST_NAME, MANAGER_ID를 출력하시오
--(EMPLOYEES SELF JOIN) - 37행



-- 도시 이름이 T로 시작하는 지역에 사는 사원들의 사번, LAST_NAME, 부서번호 조회
-- (EMPLOYEES 의 DEPARTMENT_ID 와 DEPARTMENTS의 DEPARTMENT_ID 연결 후 DEPARTMENTS의 LOCATION_ID 와 LOCATION의 LOCATION_ID 연결) -2행

SELECT employee_id, LAST_NAME, d.department_id FROM EMPLOYEES E,departments D,locations L 
WHERE E.department_ID = d.department_id AND D.LOCATION_ID = L.LOCATION_ID AND CITY LIKE 'T%';

-- 위치 ID가 1700인 동일한 사원들의 EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, SALARY 조회 (EMPLOYEES 와 DEPARTMENTS 조인) - 

SELECT employee_id, LAST_NAME, d.department_id, SALARY FROM EMPLOYEES E,departments D
WHERE E.department_ID = d.department_id AND D.LOCATION_ID = 1700;

-- DEPARTMENT_NAME, LOCATION_ID, 각 부서별 사원수, 각 부서별 평균 연봉 조회

SELECT d.department_NAME,d.location_id, COUNT(EMPLOYEE_ID),ROUND(AVG(SALARY),2) FROM EMPLOYEES E,departments D
WHERE E.department_ID = d.department_id
GROUP BY D.DEPARTMENT_NAME, LOCATION_ID;

-- EXECUTIVE 부서에 근무하는 모든 사원들의 DEPARTMENT_ID, LAST_NAME, JOB_ID 조회
-- (EMPLOYEES, DEPARTMENT 조인)

SELECT LAST_NAME, D.DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES E,departments D
WHERE E.department_ID = d.department_id AND D.DEPARTMENT_NAME = 'Executive';

-- 기존의 직업을 여전히 가지고 있는 사원들의 사번 및 JOB_ID 조회
-- (EMPLOYEES, JOB_HISTORY 조인)

SELECT e.EMPLOYEE_ID, e.JOB_ID
FROM EMPLOYEES E,job_history J
WHERE e.employee_id = j.employee_id AND e.job_id = j.job_id;

-- 각 사원별 소속 부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 사원이 존재하는 모든 사원들의 LAST_NAME을 조회
-- (EMPLOYEES SELF JOIN)

SELECT E1.EMPLOYEE_ID, E1.FIRST_NAME ||''|| E1.LAST_NAME AS NAME
FROM EMPLOYEES E1,employees E2
WHERE E1.department_ID = E2.department_id AND E1.HIRE_DATE < E2.HIRE_DATE AND e1.SALARY < E2.SALARY;
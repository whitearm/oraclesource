select * from tab;

--employees ���̺� ��ü ���� ��ȸ

select * from employees;

--employees ���̺��� first_name, last_name, job_id�� ��ȸ

select first_name, last_name, job_id from employees;

-- �����ȣ�� 176�� ����� LAST_NAME�� �μ���ȣ ��ȸ
SELECT LAST_NAME, DEPARTMENT_ID FROM employees WHERE employee_id = 176;

-- ������ 12000 �̻� �Ǵ� �������� LAST_NAME �� ���� ��ȸ
SELECT LAST_NAME, SALARY FROM employees WHERE SALARY>=10000;

-- ������ 5000���� 12000�� ���� �̿��� ������� LAST_NAME �� ���� ��ȸ
SELECT LAST_NAME, SALARY FROM employees WHERE 5000 > SALARY OR SALARY >12000;

--20�� �� 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ���ȣ�� ���ĺ������� ��ȸ
SELECT LAST_NAME, DEPARTMENT_ID FROM employees WHERE department_id IN(20,50) ORDER BY LAST_NAME ASC, department_id ASC ;

--Ŀ�̼��� ���� ��� ������� LAST_NAME, ����, Ŀ�̼� ��ȸ, ��, ������ ���� �� Ŀ�̼� ����
SELECT LAST_NAME, SALARY, commission_pct FROM employees WHERE commission_pct NOT IN(0) ORDER BY SALARY DESC, commission_pct DESC;


-- ������ 2500, 3500, 7000�� �ƴϸ�, ������ SA_REP �̳� ST_CLERK�� ����� ��ȸ
SELECT * FROM employees WHERE salary NOT IN(2500, 3500, 7000) AND job_id = 'SA_REP' OR job_id = 'ST_CLERK';


--2008/02/20 ~ 2008/05/01 ���̿� ���� ������� LAST_NAME, �����ȣ, ������� ��ȸ ��, ������� ������������ ����
SELECT LAST_NAME,employee_id, hire_date FROM employees WHERE hire_date >= '2008-02-20' AND hire_date <= '2008-05-01' ORDER BY hire_date DESC;

-- 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� �������� �������� ����
SELECT LAST_VALUE, hire_date FROM employees WHERE hire_date >='2004-01-01' AND hire_date <= '2004-12-31' ORDER BY hire_date;

--������ 5000~ 12000, 20 OR 50�� �μ����� �ٹ��ϴ� ������� ������ ��ȸ�Ͽ� ������������ �����ֱ�(LAST_NAME, SALARY)
SELECT LAST_NAME,SALARY FROM employees WHERE department_id IN (20,50) AND SALARY BETWEEN 5000 AND 12000  ORDER BY SALARY ASC;

-- 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� �������� �������� ����
SELECT LAST_NAME, hire_date FROM employees WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-31' ORDER BY hire_date;

--������ 5000~12000�� �ƴ� ������� LAST_NAME, SALARY ��ȸ
SELECT LAST_NAME,SALARY FROM employees WHERE SALARY NOT BETWEEN 5000 AND 12000;

-- 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� �������� �������� ����( LIKE ���)
SELECT LAST_NAME, hire_date FROM employees WHERE hire_date LIKE '04%' ORDER BY hire_date ASC;

-- LAST_NAME �� ���� u�� ���ԵǴ� ������� LAST_NAME ��ȸ
SELECT LAST_NAME FROM employees WHERE LAST_NAME LIKE '%u%';

-- LAST_NAME �� �׹�° ���ڰ� a�� ������� LAST_NAME ��ȸ
SELECT LAST_NAME FROM employees WHERE LAST_NAME LIKE '___a%';

-- LAST_NAME �� aȤ�� e ���ڰ� �ִ� ������� LAST_NAME�� ��ȸ�Ͽ� LAST_NAME �������� �������� ����
SELECT LAST_NAME FROM employees WHERE LAST_NAME LIKE '%a%' OR LAST_NAME LIKE '%e%' ORDER BY LAST_NAME ASC;

-- LAST_NAME�� a�� e���ڰ� �ִ� ������� LAST_NAME�� ��ȸ�Ͽ� LAST_NAME �������� �������� ����
SELECT LAST_NAME FROM employees WHERE LAST_NAME LIKE '%a%e%' OR LAST_NAME LIKE '%a%e%' ORDER BY LAST_NAME ASC;

-- IS NULL
-- �Ŵ����� ���� ������� LAST_NAME, JOB_ID ��ȸ
SELECT LAST_NAME, JOB_ID FROM employees WHERE manager_id IS NULL;

-- ST_CLERK�� JOB_ID�� ���� ����� ���� �μ� ID ��ȸ. �μ� ��ȣ�� NULL�� �� ����
SELECT * FROM employees WHERE JOB_ID NOT IN('ST_CLERK') AND department_id IS NULL;

--COMMISSION_PCT NULL �� �ƴ� ����� �߿��� COMMISSION = SALARY * COMMIUSSION_PCT�� ���Ͽ� EMPLOTEE_ID, FIRST_NAME, JOB_ID�� ���� ��ȸ
SELECT employee_id, FIRST_NAME, job_id, SALARY * COMMISSION_PCT AS COMMISION FROM employees WHERE commission_pct IS NOT NULL;

-- [�ǽ�] ���ڿ� �Լ�
-- 1. first_name�� Curtis �� ����� first_name, last_name, email, phone_number, job_id�� ��ȸ�Ѵ�, ��, job_id�� ����� �ҹ��ڷ� ��µǵ��� �Ѵ�.
SELECT FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, LOWER(JOB_ID)
FROM employees
WHERE FIRST_NAME = 'Curtis';

-- 2. �μ���ȣ�� 70,80,90�� ������� employee_id, first_name, hire_date, job_id�� ��ȸ�Ѵ�. ��, job_id�� it_prog�� ����� ��� ���α׷��ӷ� �����Ͽ� ����Ѵ�.
SELECT employee_id, first_name, hire_date, REPLACE(job_id, 'IT_PROG','���α׷���')
FROM employees
WHERE department_id IN (60,70,80,90);

-- 3. job_id�� ad_pres, pu_clerk�� ������� employee_id, first_name,last_name,department_id, job_id�� ��ȸ�Ͻÿ�, ��, ������� first_name�� last_name�� �����Ͽ� ����Ѵ�
SELECT employee_id, CONCAT(first_name,CONCAT(' ',last_name)),department_id, JOB_ID FROM employees WHERE job_id IN('AD_PRES','PU_CLERK');

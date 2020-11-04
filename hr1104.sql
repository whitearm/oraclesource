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
SELECT LAST_NAME,employee_id, hire_date FROM employees WHERE hire_date IN(2008/02/20) < hire_date IN(2008/05/01) ;

-- 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� �������� �������� ����
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
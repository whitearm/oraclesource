--������ ������ �ִ� ��� ���̺� ��ȸ

select * from tab;

--emp ���̺� ���� ��ȸ
DESC emp;

-- emp ���̺��� ��� ���� ��ȸ
SELECT * FROM emp;

-- emp 
SELECT ename, job, sal FROM emp;

--�ߺ� ���ڵ� ���� �� ��ȸ DISTINCT
SELECT DISTINCT deptno FROM emp;

-- ��Ī(alais)
select empno AS �����ȣ FROM emp;

SELECT ename, sal, sal*12+comm, comm FROM emp;

SELECT ename as ����̸�, job as "�� å" from emp;

-- �ϳ��� ���� ������ �־� ��������(ASC) ��ȸ, ORDER BY : �����Ͽ� ��ȸ
SELECT ename,sal FROM emp ORDER BY sal;

-- �ϳ��� ���� ������ �־� ��������(DESC) ��ȸ
SELECT ename,sal FROM emp ORDER BY sal DESC;

-- ��ü �����͸� ��ȸ(�����ȣ ��������)
SELECT * FROM emp ORDER BY empno;

--�μ���ȣ�� ���������̰�, �μ���ȣ�� �����ϴٸ� �޿��� ��������
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;


SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME, MGR AS MANAGER, SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTEMNT_NO FROM emp ORDER BY deptno DESC, ename ASC;

--WHERE ��ȸ�� �� �� ���� �����

-- �μ���ȣ�� 30���� ��� ��ȸ
SELECT * FROM emp WHERE deptno = 30;

-- �����ȣ�� 7782�� ��� ��ȸ
SELECT * FROM emp WHERE empno = 7782;

--�μ���ȣ�� 30�̰� �����å�� SALESMAN ������ȸ (������ Ÿ���� ������ �� ''�� ����� �Ѵ�)
SELECT * FROM emp WHERE deptno = 30 AND job ='SALESMAN';

-- �����ȣ�� 7499�̰�, �μ���ȣ�� 30�� ������ȸ
SELECT * FROM emp WHERE empno = 7499 AND deptno = 30;

-- �μ���ȣ�� 30�̰ų�, �����å�� CLERK ������ȸ
SELECT * FROM emp WHERE deptno = 30 OR job ='CLERK';

-- �μ���ȣ�� 20�̰ų�, �����å�� SALESMAN ������ȸ
SELECT * FROM emp WHERE deptno = 20 OR job ='SALESMAN'; 
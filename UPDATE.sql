CREATE TABLE DEPT_TEMP2 AS SELECT * FROM DEPT;

-- DEPT_TEMP2�� �ִ� LOC ��� ����
UPDATE dept_temp2 --���̺��
SET LOC='SEOUL'; --������ ����
SELECT * FROM DEPT_TEMP2;

ROLLBACK; -- Crtl + Z ���� ����

UPDATE dept_temp2 --���̺��
SET LOC='SEOUL' --������ ����
WHERE DEPTNO=10; --������Ʈ ����

SELECT * FROM DEPT_TEMP2;

-- EMP_TEMP ���̺��� ����� �߿��� �޿��� 3000 ������ ����� �߰������� 50���� ����

SELECT * FROM EMP_TEMP;

UPDATE emp_temp SET COMM = 50 WHERE SAL <= 3000;

--���������� �̿��� ������ ����

--40�� �μ��� �μ���� ���� ����
UPDATE dept_temp2 SET(DNAME,LOC) = (SELECT DNAME,LOC FROM DEPT WHERE DEPTNO=30)
WHERE DEPTNO=40;

UPDATE dept_temp2 SET LOC = 'SEOUL' 
WHERE DEPTNO= (SELECT DEPTNO FROM DEPT WHERE DNAME='OPERATIONS');

COMMIT;
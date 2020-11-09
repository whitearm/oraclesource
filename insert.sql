SELECT * FROM DEPT_TEMP;

CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;

--������ �߰��ϱ� (��� 1)
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
VALUES(50, 'DATABASE','SEOUL');

--������ �߰��ϱ� (��� 2)
INSERT INTO dept_temp VALUES(60,'NETWORK','BUSAN');

-- ���� ��Ȳ(INSERT 3�� �ߴµ� ����� 2������ ����)
--INSERT INTO dept_temp(DEPTNO, DNAME, LOC)  VALUES(50, 'DATABASE');
-- ������Ȳ (��ȭ_2020_11_09_14_39_16_730 ����)
--INSERT INTO dept_temp(DEPTNO, DNAME, LOC)  VALUES(500, 'DATABASE','seoul');


--NUUL ����
--����� NULL ���� 2���� ���
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)  VALUES(70, 'DATABASE','NULL');
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)  VALUES(80, 'DATABASE','');


--������ NULL ����
INSERT INTO dept_temp(DEPTNO, LOC)  VALUES(90,'INCHEON');

-- EMP ���̺��� �����Ͽ� EMP_TEMP ���̺� ����
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP;

-- ���̺� ����
DROP TABLE EMP_TEMP;

-- EMP���̺��� �����Ͽ� EMP_TEMP ���̺� �����ϵ� ������ �����ϱ�
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1;

SELECT * FROM EMP_TEMP;

DESC EMP_TEMP;

INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(9999,'ȫ�浿','PRESIDENT','','2020-11-09',4000,'',10);
INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(8888,'ȫ�浿','MANAGER','','2020-11-08',3000,'',10);

--�����ݿ�
COMMIT;

INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(7777,'����ȣ','MANAGER','',to_date('07/01/2010','dd/mm/yyyy'),4000,'',20);

INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(6666,'�̼���','MANAGER','',SYSDATE,4000,'',20);

-- EMP ���̺��� SALGRADE ���̺��� �����Ͽ� �޿� ����� 1����� ������� EMP_TEMP ���̺��� �߰��ϰ� ���� ���
-- ���������� �ۼ��ϱ�
INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno FROM EMP E, SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND s.hisal AND S.GRADE = 1;

COMMIT;


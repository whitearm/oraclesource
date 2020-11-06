--sum : �հ�

-- SELECT ename, SUM(sal) FROM emp;(x)


SELECT SUM(sal) FROM emp;

SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal) FROM emp;

-- count : ����

SELECT COUNT(*) FROM emp;

--�μ���ȣ�� 30���� ���� �� ���ϱ�

SELECT COUNT(*) FROM emp WHERE deptno=30;

SELECT COUNT(sal), COUNT(DISTINCT sal), COUNT(ALL sal) FROM emp;

--MAX(�ִ밪), MIN(�ּҰ�)
SELECT MAX(SAL), MIN(SAL) FROM emp;

-- �μ���ȣ�� 20�� ����� �Ի��� �� ���� �ֱ� �Ի��� ���ϱ�
SELECT MAX(hiredate) FROM emp WHERE deptno = 20;


-- AVG : AVERAGE : ���

SELECT AVG(SAL) FROM emp;
SELECT AVG(SAL) FROM emp WHERE deptno = 30;
SELECT AVG(DISTINCT SAL) FROM emp;

-- GROUP BY : ������� ���ϴ� ���� ���� ���
SELECT deptno,AVG(SAL) FROM emp GROUP BY deptno;

-- �μ���ȣ�� �߰����� ��� ���ϱ�
SELECT deptno, AVG(COMM) FROM emp GROUP BY deptno;

--�μ���ȣ, ��å�� �޿� ��� ���ϱ�
SELECT deptno, AVG(COMM),job FROM emp GROUP BY deptno,job ORDER BY deptno,job;

-- group by ���� ���� �ȵǴ� ���� select �� �����ϸ� �ȵ�
--SELECT ename,deptno, AVG(sal) FROM emp GROUP BY deptno;(x)
SELECT ename,deptno, AVG(sal) FROM emp GROUP BY ename,deptno;

-- HAVIG : GROUP BY ���� ������ �� �� ���
SELECT deptno, job, AVG(sal) FROM emp GROUP BY deptno, job HAVING AVG(sal) >= 2000 ORDER BY deptno, job ;

-- EMP ���̺��� �μ��� ��å�� ��� �޿��� 500�̻��� ������� �μ���ȣ, ��å, �μ��� ��å�� ��ձ޿� ���
SELECT deptno, job, AVG(sal) FROM emp GROUP BY deptno, job HAVING AVG(sal) >= 500;

SELECT deptno, job, AVG(sal) FROM emp WHERE sal<=3000 GROUP BY deptno, job HAVING AVG(sal) >= 2000 ORDER BY deptno, job;

-- �ǽ� sql �ۼ� ppt 28
SELECT deptno, FLOOR(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(DISTINCT deptno) FROM emp GROUP BY DEPTNO;

-- ����

-- ���� �� �ִ� ��� ����
SELECT * FROM emp, dept ORDER BY empno;


SELECT * FROM dept; -- 4��
SELECT * FROM emp;  -- 14��
SELECT COUNT(*) FROM emp, dept ORDER BY empno; -- 1��

-- 1) ��������(�����)
SELECT * FROM emp,dept 
WHERE emp.deptno = dept.deptno -- ���� ����
ORDER BY empno;

SELECT * 
FROM emp INNER JOIN dept
ON emp.deptno = dept.deptno -- ���� ����
ORDER BY empno;

SELECT * 
FROM emp E INNER JOIN dept D
ON E.DEPTNO = d.deptno -- ���� ����
ORDER BY empno;

-- �� ���̺� ���� �̸��� �ʵ尡 �����ϴ� ���
-- �׳� DEPTNO�� SELECT���� ���� ������ �����µ� E.DEPTNO�� D.DEPTNO�� �־� ��ȣ���� ����°� ������
SELECT EMPNO, ENAME, JOB, D.DEPTNO, DNAME 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;

--EMP ���̺�� DEPT ���̺��� �����Ͽ� EMPNO, ENAME, SAL, DEPTNO, DNAME, LOC �� ��ȸ�Ѵ�. ��, �޿��� 3000 �̻��� ����� ���
SELECT E.EMPNO, e.ename, e.sal, d.deptno, d.dname, d.loc
FROM EMP E, DEPT D
WHERE E.DEPTNO = d.deptno AND SAL>=3000;


--emp ���̺��� ��Ī�� e��, dept ���̺� ��Ī�� d�� �Ͽ� �޿��� 2500�����̰�, �����ȣ�� 9999 ������ ����� ���� ���

SELECT *
FROM emp e, dept d
WHERE E.DEPTNO = d.deptno AND SAL<=2500 AND EMPNO <= 9999;


-- emp ���̺��� ��Ī�� e��, salgrade ���̺� ��Ī�� s�� �Ͽ�
-- SALGRADE ���̺� ��Ī�� S�� �Ͽ� ������� ������ ���Ҿ� ����� �޿� ��� ������ ����ϴ� SQL �� �ۼ��ϱ�

SELECT *
FROM emp e, SALGRADE S
WHERE E.SAL BETWEEN s.losal AND S.HISAL;


--OUTER JOIN(�ܺ� ����) : ������ �������� �ʴ� ������ ����

--1) LEFT OUTER JOIN
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO;

--2) RIGHT OUTER JOIN
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO;

-- ���� ppt 11p
--1)
SELECT d.deptno,D.DNAME, e.EMPNO, E.ENAME, e.sal
FROM EMP E, DEPT D
WHERE E.DEPTNO = d.deptno AND SAL>=2000;

SELECT d.deptno,D.DNAME, e.EMPNO, E.ENAME, e.sal
FROM EMP E, DEPT D
WHERE E.DEPTNO = d.deptno AND SAL>=2000 ORDER BY e.deptno;

SELECT d.deptno,D.DNAME, e.EMPNO, E.ENAME, e.sal
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = d.deptno AND SAL>=2000 ORDER BY e.deptno;

--2)
SELECT E.deptno, D.DNAME, FLOOR(AVG(E.SAL)) AS AVG_SAL, MAX(E.SAL) AS MAX_SAL, MIN(E.SAL) AS MIN_SAL, COUNT(DNAME) AS CNT 
FROM emp e, DEPT D
WHERE e.deptno = d.deptno
GROUP BY E.deptno, D.DNAME
ORDER BY E.DEPTNO;

SELECT E.deptno, D.DNAME, FLOOR(AVG(E.SAL)) AS AVG_SAL, MAX(E.SAL) AS MAX_SAL, MIN(E.SAL) AS MIN_SAL, COUNT(DNAME) AS CNT 
FROM emp e INNER JOIN DEPT D ON e.deptno = d.deptno
WHERE e.deptno = d.deptno
GROUP BY E.deptno, D.DNAME
ORDER BY E.DEPTNO;


--4)
SELECT d1.DEPTNO, d1.DNAME, e1.EMPNO, e1.ENAME, E1.MGR, e1.SAL, E1.DEPTNO, S.LOSAL, S.HISAL,S.GRADE, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM emp e1
RIGHT OUTER JOIN DEPT D1 ON E1.DEPTNO = D1.DEPTNO
LEFT OUTER JOIN SALGRADE S ON E1.SAL BETWEEN S.LOSAL AND S.HISAL
LEFT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO
ORDER BY D1.DEPTNO, E1.EMPNO;

SELECT d1.DEPTNO, d1.DNAME, e1.EMPNO, e1.ENAME, E1.MGR, e1.SAL, E1.DEPTNO, S.LOSAL, S.HISAL,S.GRADE, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM emp e1, DEPT D1, SALGRADE S, EMP E2
WHERE E1.DEPTNO(+) = d1.deptno AND E1.SAL BETWEEN S.LOSAL(+) AND
    s.hisal(+) AND E1.MGR = E2.EMPNO(+)
ORDER BY E1.DEPTNO;


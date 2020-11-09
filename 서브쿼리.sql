-- ������ �ȿ� �ٸ� �������� �����ϰ� �ִ� ����


-- ������ ��������
select * FROM emp WHERE SAL > (SELECT SAL FROM emp WHERE ename='JONES');

-- ����̸��� ALLEN �� ����� �߰����纸�� ���� �޴� ����� ���

SELECT * FROM emp WHERE COMM > (SELECT COMM FROM emp WHERE ename ='ALLEN');

-- ����̸��� WARD �� �Ի��Ϻ��� ���� �Ի��� ����� ���

SELECT * FROM emp WHERE HIREDATE < (SELECT HIREDATE FROM emp WHERE ename ='WARD');

-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ��� ���
SELECT *
FROM emp
WHERE DEPTNO = 20 AND SAL > (SELECT AVG(SAL) FROM EMP);

-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ����� ����(�μ���, ������ġ) ���

SELECT E.EMPNO, e.ename, E.SAL, d.deptno, D.DNAME, d.loc
FROM emp E, DEPT D
WHERE E.DEPTNO = D.DEPTNO  AND DAPTNO = 20 AND SAL > (SELECT AVG(SAL) FROM EMP);

-- ������ ��������

-- �������� ����� 2�� �̻� ������ ����� ������ ���������� ������ ��� �Ұ�
-- ���� �� ���� ���ǿ� 2�� �̻��� ���� ���ϵ�
--SELECT *FROM emp WHERE SAL >= (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO;

--IN
SELECT * FROM emp WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- ANY(SOME)
-- = ANY : IN �� ���� ����� ���� ����, ��, IN �� �� ���� �����
SELECT * FROM emp WHERE SAL = ANY (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT * FROM emp WHERE SAL = SOME (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- 30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���
SELECT * FROM emp WHERE SAL < ANY (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30);

SELECT * FROM emp WHERE SAL < ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

SELECT DISTINCT SAL FROM EMP WHERE DEPTNO = 30;

-- 30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ��� ���
SELECT * FROM emp WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- ALL : ���� ������ ����� ��� �����ϴ� ���������� ������ ��
-- 30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ��� ���
SELECT * FROM emp WHERE SAL < ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- EXISTS : IN �� ����� ����, �� IN ���� ������ �����

SELECT * FROM emp WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 20);
SELECT * FROM emp WHERE NOT EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 20);

SELECT EMPNO, DEPTNO 
FROM emp 
WHERE EXISTS (SELECT DEPTNO FROM DEPT WHERE DEPTNO IN (20,30) AND EMP.DEPTNO = dept.deptno);

-- ����� �� �װ� �װŴ�
SELECT EMPNO, DEPTNO 
FROM emp 
WHERE EXISTS (SELECT 1 FROM DEPT WHERE DEPTNO IN (20,30) AND EMP.DEPTNO = dept.deptno);

-- NOT�� �־�ô�
SELECT EMPNO, DEPTNO 
FROM emp 
WHERE NOT EXISTS (SELECT 1 FROM DEPT WHERE DEPTNO IN (20,30) AND EMP.DEPTNO = dept.deptno);


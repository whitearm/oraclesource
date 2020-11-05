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

--�����ڸ� �̿��� ��ȸ ex) ��������� : sal*12 �� �ݾ��� 36000 �� ������ ��ȸ
SELECT * FROM emp WHERE sal*12=36000;

-- ���迬���� : >, <, >=, <=
SELECT * FROM emp WHERE sal > 3000;
SELECT * FROM emp WHERE sal >= 3000;

-- ���ĺ� ������ F���� �ڿ� �ִ� ���
SELECT * FROM emp WHERE ename >= 'F';

-- �������� : AND, OR 
-- �޿��� 2500 �̻��̰�, ������ ANALYST�� ������� ��ȸ
SELECT * FROM emp WHERE SAL >= 2500 AND job = 'ANALYST';

--������ MANAGER, SALEMAN, CLERK �� ������� ��ȸ
SELECT * FROM emp WHERE job = 'MANAGER' OR job = 'SALEMAN' OR job = 'CLERK';

-- ������� : ���� �׸��� ������ �˻� EX) SAL�� 3000�� �ƴ� ������� ���
SELECT * FROM emp WHERE sal!=3000;
SELECT * FROM emp WHERE sal<>3000;
SELECT * FROM emp WHERE sal!=3000;

-- IN ������
SELECT * FROM emp WHERE job IN ('MANAGER','SALESMAN','CLERK');

SELECT * FROM emp WHERE job != 'MANAGER' AND job !='SALESMAN' AND job !='CLERK';
SELECT * FROM emp WHERE job NOT IN('MANAGER','SALESMAN','CLERK');

-- IN �� ����ؼ� �μ���ȣ�� 10,20���� ������� ��ȸ
SELECT * FROM emp WHERE deptno IN(10,20);

--BETWEEN A AND B 1) �޿��� 2000 �̻� 3000 ������ ������� ��ȸ
SELECT * FROM emp WHERE sal >= 2000 AND sal <= 3000;
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 3000;

--1) �޿��� 2000 �̻� 3000 ���ϰ� �ƴ� ������� ��ȸ
SELECT * FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;

-- LIKE : ���ڿ� �˻� ���(s�� �����ϴ� ~~, H�� ������..., ����� T�� ������)
-- 1) ��� �̸��� S�� �����ϴ� ��� ������� ��ȸ�ϱ�
SELECT * FROM emp WHERE ename LIKE 'S%';

--2) ��� �̸��� �ι�° ���ڰ� L�� ����� ��ȸ
SELECT * FROM emp WHERE ename LIKE '_L%';

--3) ��� �̸��� AM�� ���ԵǾ� �ִ� ����� ��ȸ
SELECT * FROM emp WHERE ename LIKE '%AM%';

-- IS NULL
-- SELECT * FROM emp WHERE comm = NULL; (X)
SELECT * FROM emp WHERE comm IS NULL;

--MGR(�Ŵ��� ID)�� NULL �� ������� ��ȸ
SELECT * FROM emp WHERE mgr IS NULL;

--MGR(�Ŵ��� ID)�� NULL �� �ƴ� ������� ��ȸ
SELECT * FROM emp WHERE mgr IS NOT NULL;

--���տ����� : ������, ������, ������

--deptno �� 10�� ���̺�� deptno�� 20�� ����� ���ؼ� ���ؼ� �����ֱ�
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 20;

-- �μ���ȣ�� 10�� �ƴ� ������� ������ȸ
SELECT empno, ename, sal, deptno FROM emp
MINUS
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;

-- ����Ŭ �Լ�
--1) �����Լ� : UPPER

-- ENAME �� UPPER,LOWER,INITCAP���� ��ȯ�Ͽ� ��ȸ
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename) FROM emp;

-- DUAL ���̺� �̿�(SYS�� �����ϰ� �ִ� ���̺�� �ӽÿ����̳� �Լ��� ������� Ȯ���ϴ� �뵵)
-- ���� FROM���� �ؾ� ������ FROM���� ���� �Ұ� ���� SELECT ���������� ������ ���� �� DUAL�� ���
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�') FROM DUAL;

-- ��å �̸��� 6���� �̻��� ������� ���� ����
SELECT * FROM emp WHERE LENGTH(job) >= 6;

-- ���ڿ� �Լ� : substr
SELECT job, substr(job,1,2), substr(job,3,2), substr(job,5) FROM emp;

-- -length(job)�� ����� -5
SELECT job, substr(job,-length(job)), substr(job,-length(job),2), substr(job,-3) FROM emp;

-- ���ڿ� �Լ� : instr(Ư������ ��ġ ã��)
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2, 
INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
FROM DUAL;

-- ���ڿ��Լ� : REPLACE
SELECT REPLACE('�̰� oracle', '�̰�','this is') FROM dual;

SELECT '010-1234-5678' AS REPLACE_BEFORE_1,
    REPLACE('010-1234-5678','-') AS REPLACE_2
FROM dual;

-- ���ڿ� �Լ� : CONCAT(����)
-- empno, ename�� �����Ͽ� ��ȸ
SELECT CONCAT(empno,ename), CONCAT(empno, CONCAT(':',ename)) FROM emp WHERE ename='SCOTT';

SELECT empno || ename, empno || ':' || ename FROM emp WHERE ename='SCOTT';

-- ���ڿ� �Լ� : TRIM(��������), LTRIM(���� ���� ����)

-- �����Լ� : ROUND(�ݿø�), TRUNC(����), CEIL(�Էµ� ���ڿ� ����� ū ����), FLOOR(�Էµ� ���ڿ� ����� ���� ����), MOD(������)

SELECT ROUND(1234.5678) AS ROUND,
    ROUND(1234.5678,0) AS ROUND_1,
    ROUND(1234.5678,1) AS ROUND_2,
    ROUND(1234.5678,-1) AS ROUND_MINUS,
    ROUND(1234.5678,-2) AS ROUND_MINUS2
    FROM dual;
    
    SELECT TRUNC(1234.5678) AS TRUNC,
    TRUNC (1234.5678,0) AS TRUNC_1,
    TRUNC(1234.5678,1) AS TRUNC_2,
    TRUNC(1234.5678,-1) AS TRUNC_MINUS,
    TRUNC(1234.5678,-2) AS TRUNC_MINUS2
    FROM dual;
    
    SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14) FROM DUAL;
    
SELECT MOD(15,6), MOD(10,2), MOD(11,2) FROM dual;

--3. ��¥�Լ� : SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP
-- ��¥�����ʹ� ������ ������ : ��¥������ +1, -1, ��¥������-��¥������ ��..
-- �� ���ڵ����� + ���ڵ����ʹ� �ȵ�

SELECT SYSDATE, CURRENT_DATE, CURRENT_TUMESTAMP FROM DUAL;


SELECT SYSDATE AS NOW, STSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW FROM DUAL;

-- ��¥ �Լ� : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM DUAL;

-- �Ի� 10�ֳ��� �Ǵ� ����� ��ȸ
SELECT empno, ename, hiredate, ADD_MONTHS(hiredate,120) FROM emp;

-- ���� ��¥ �������� �Ի� 38�� �̸��� ��� ��ȸ
-- SELECT empno, ename, hiredate, ADD_MONTHS(hiredate,456) FROM emp;(x)
SELECT * FROM emp WHERE ADD_MONTHS(hiredate, 456) > SYSDATE;

SELECT * FROM emp WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) <456;

SELECT empno, ename, hiredate, SYSDATE, MONTHS_BETWEEN(hiredate,SYSDATE) AS MONTHS1,
MONTHS_BETWEEN(SYSDATE,hiredate) AS MONTHS2, TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate))
FROM emp;

-- ��¥�Լ� : NEXT_DAY, LAST_DAY
SELECT SYSDATE, NEXT_DAY(SYSDATE, '������'), LAST_DAY(SYSDATE) FROM DUAL;

4. ����ȯ �Լ� : TO_CHAR(��¥, ���ڵ����͸� ���ڷ� ��ȯ), TO_NUMBER(���ڵ����͸� ���ڷ� ��ȯ), TO_DATE(���� ���̸� ��¥�� ��ȯ)

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MM') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DAY') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH12:MI:SS') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS PM') AS ���糯¥ FROM DUAL;

-- ���ó�¥�� ��/��/�� 24�ð��� HH:MI:SS ǥ��
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS ���ó�¥ FROM DUAL;


SELECT 1300-'1500', '1300'+1500 FROM dual;
SELECT 1300-TO_NUMBER('1500'), TO_NUMBER('1300')+1500 FROM dual;
--,���� 1�� �ʵ�� �ν��ؼ� �̻��� ����� ���´�
SELECT 1,300-TO_NUMBER('1500'), TO_NUMBER('1300')+1,500 FROM dual;

-- SELECT TO_NUMBER('1,300')-TO_NUMBER('1,500') FROM DUAL;(X)

--TO_NUMBER�� ���ڷ� ���''�ؾ� �Ѵ� �ڿ� 999,999�� ���ڰ� �ƴ� ������ ���·� ��Ÿ���� �ϴ� ����
-- 9,0 (������ ���ڸ��� �ǹ���), 9 ���ڸ��� ä���� �ʴ� ����, 0 ���ڸ��� ä��� ����
SELECT TO_NUMBER('1,300','999,999')-TO_NUMBER('1,500','999,999') FROM dual;
SELECT TO_NUMBER('1,300','990,000')-TO_NUMBER('1,500','990,000') FROM dual;

-- L�� LOCALE�̶� �ؼ� �ش� ������ ȭ������� ����
SELECT SAL, TO_CHAR(SAL, '$999,999') AS SAL_$,
    TO_CHAR(SAL, 'L999,999') AS SAL_L,
    TO_CHAR(SAL, '$999,999.00') AS SAL_1,
    TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
    TO_CHAR(SAL, '000999999.99') AS SAL_3,
    TO_CHAR(SAL, '$999,999,00') AS SAL_4
FROM emp;

SELECT * FROM emp WHERE hiredate > TO_DATE('1981-06-01','YYYY-MM-DD');

SELECT TO_DATE('2019-12-20')-TO_DATE('2019-10-20') FROM DUAL;

-- ��ó�� �Լ� : NVL, NVL2 
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM FROM EMP;
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM, NVL(COMM,0), SAL+NVL(COMM,0) FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, NVL2(COMM,'O','X'), NVL2(COMM,SAL*12+COMM,SAL*12) AS ANNSAL FROM EMP;

-- DECODE �Լ��� CASE��

-- job�� manager, salesman, analyst ��쿡 ���� �ٸ� ������ �����ϰ� �ʹٸ�
SELECT empno,ename,job,sal,DECODE(JOB, 'MANAGER', SAL*1.1;, 'SALESMAN',SAL*1.05,'ANALYST',SAL,SAL*1.03
) END AS UPSAL FROM EMP;

SELECT empno,ename,job,sal,CASE
    WHEN COMM IS NULL THEN '�ش���׾���'
    WHEN COMM IS NULL THEN '�ش���׾���'
    WHEN COMM IS NULL THEN '�ش���׾���'
    
    -- ������ 2�� �ٽ�
--------------------------------------------------------------------------------------

--sum : 합계

-- SELECT ename, SUM(sal) FROM emp;(x)


SELECT SUM(sal) FROM emp;

SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal) FROM emp;

-- count : 개수

SELECT COUNT(*) FROM emp;

--부서번호가 30번인 직원 수 구하기

SELECT COUNT(*) FROM emp WHERE deptno=30;

SELECT COUNT(sal), COUNT(DISTINCT sal), COUNT(ALL sal) FROM emp;

--MAX(최대값), MIN(최소값)
SELECT MAX(SAL), MIN(SAL) FROM emp;

-- 부서번호가 20인 사원의 입사일 중 가장 최근 입사일 구하기
SELECT MAX(hiredate) FROM emp WHERE deptno = 20;


-- AVG : AVERAGE : 평균

SELECT AVG(SAL) FROM emp;
SELECT AVG(SAL) FROM emp WHERE deptno = 30;
SELECT AVG(DISTINCT SAL) FROM emp;

-- GROUP BY : 결과값을 원하는 열로 묶어 출력
SELECT deptno,AVG(SAL) FROM emp GROUP BY deptno;

-- 부서번호별 추가수당 평균 구하기
SELECT deptno, AVG(COMM) FROM emp GROUP BY deptno;

--부서번호, 직책들 급여 평균 구하기
SELECT deptno, AVG(COMM),job FROM emp GROUP BY deptno,job ORDER BY deptno,job;

-- group by 절에 포함 안되는 열을 select 에 포함하면 안됨
--SELECT ename,deptno, AVG(sal) FROM emp GROUP BY deptno;(x)
SELECT ename,deptno, AVG(sal) FROM emp GROUP BY ename,deptno;

-- HAVIG : GROUP BY 절에 조건을 줄 때 사용
SELECT deptno, job, AVG(sal) FROM emp GROUP BY deptno, job HAVING AVG(sal) >= 2000 ORDER BY deptno, job ;

-- EMP 테이블의 부서별 직책의 평균 급여가 500이상인 사원들의 부서번호, 직책, 부서별 직책의 평균급여 출력
SELECT deptno, job, AVG(sal) FROM emp GROUP BY deptno, job HAVING AVG(sal) >= 500;

SELECT deptno, job, AVG(sal) FROM emp WHERE sal<=3000 GROUP BY deptno, job HAVING AVG(sal) >= 2000 ORDER BY deptno, job;

-- 실습 sql 작성 ppt 28
SELECT deptno, FLOOR(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(DISTINCT deptno) FROM emp GROUP BY DEPTNO;

-- 조인

-- 나올 수 있는 모든 조합
SELECT * FROM emp, dept ORDER BY empno;


SELECT * FROM dept; -- 4행
SELECT * FROM emp;  -- 14행
SELECT COUNT(*) FROM emp, dept ORDER BY empno; -- 1행

-- 1) 내부조인(등가조인)
SELECT * FROM emp,dept 
WHERE emp.deptno = dept.deptno -- 조인 기준
ORDER BY empno;

SELECT * 
FROM emp INNER JOIN dept
ON emp.deptno = dept.deptno -- 조인 기준
ORDER BY empno;

SELECT * 
FROM emp E INNER JOIN dept D
ON E.DEPTNO = d.deptno -- 조인 기준
ORDER BY empno;

-- 두 테이블에 같은 이름의 필드가 존재하는 경우
-- 그냥 DEPTNO를 SELECT절에 쓰면 오류가 나오는데 E.DEPTNO와 D.DEPTNO가 있어 모호함이 생기는게 이유다
SELECT EMPNO, ENAME, JOB, D.DEPTNO, DNAME 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;

--EMP 테이블과 DEPT 테이블을 조인하여 EMPNO, ENAME, SAL, DEPTNO, DNAME, LOC 를 조회한다. 단, 급여가 3000 이상인 사원만 출력
SELECT E.EMPNO, e.ename, e.sal, d.deptno, d.dname, d.loc
FROM EMP E, DEPT D
WHERE E.DEPTNO = d.deptno AND SAL>=3000;


--emp 테이블의 별칭을 e로, dept 테이블 별칭을 d로 하여 급여가 2500이하이고, 사원번호가 9999 이하인 사원의 정보 출력

SELECT *
FROM emp e, dept d
WHERE E.DEPTNO = d.deptno AND SAL<=2500 AND EMPNO <= 9999;


-- emp 테이블의 별칭을 e로, salgrade 테이블 별칭을 s로 하여
-- SALGRADE 테이블 매칭을 S로 하여 각사원의 정보와 더불어 사원의 급여 등급 정보를 출력하는 SQL 문 작성하기

SELECT *
FROM emp e, SALGRADE S
WHERE E.SAL BETWEEN s.losal AND S.HISAL;


--OUTER JOIN(외부 조인) : 조건을 만족하지 않는 데이터 추출

--1) LEFT OUTER JOIN
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO;

--2) RIGHT OUTER JOIN
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO;

-- 조인 ppt 11p
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


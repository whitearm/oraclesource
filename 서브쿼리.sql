-- 쿼리문 안에 다른 쿼리문을 포함하고 있는 상태


-- 단일행 서브쿼리
select * FROM emp WHERE SAL > (SELECT SAL FROM emp WHERE ename='JONES');

-- 사원이름이 ALLEN 인 사원의 추가수당보다 많이 받는 사원을 출력

SELECT * FROM emp WHERE COMM > (SELECT COMM FROM emp WHERE ename ='ALLEN');

-- 사원이름이 WARD 인 입사일보다 빨리 입사한 사원을 출력

SELECT * FROM emp WHERE HIREDATE < (SELECT HIREDATE FROM emp WHERE ename ='WARD');

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원 출력
SELECT *
FROM emp
WHERE DEPTNO = 20 AND SAL > (SELECT AVG(SAL) FROM EMP);

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원의 정보(부서명, 지역위치) 출력

SELECT E.EMPNO, e.ename, E.SAL, d.deptno, D.DNAME, d.loc
FROM emp E, DEPT D
WHERE E.DEPTNO = D.DEPTNO  AND DAPTNO = 20 AND SAL > (SELECT AVG(SAL) FROM EMP);

-- 다중행 서브쿼리

-- 서브쿼리 결과가 2개 이상 나오는 경우라면 단일행 서브쿼리의 연산자 사용 불가
-- 단일 행 하위 질의에 2개 이상의 행이 리턴됨
--SELECT *FROM emp WHERE SAL >= (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO;

--IN
SELECT * FROM emp WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- ANY(SOME)
-- = ANY : IN 의 수행 결과와 같게 나옴, 단, IN 을 더 많이 사용함
SELECT * FROM emp WHERE SAL = ANY (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT * FROM emp WHERE SAL = SOME (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- 30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원 출력
SELECT * FROM emp WHERE SAL < ANY (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30);

SELECT * FROM emp WHERE SAL < ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

SELECT DISTINCT SAL FROM EMP WHERE DEPTNO = 30;

-- 30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 출력
SELECT * FROM emp WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- ALL : 서브 쿼리의 결과를 모두 만족하는 메인쿼리를 추출할 때
-- 30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 출력
SELECT * FROM emp WHERE SAL < ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- EXISTS : IN 과 비슷한 개념, 단 IN 보다 성능이 우수함

SELECT * FROM emp WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 20);
SELECT * FROM emp WHERE NOT EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 20);

SELECT EMPNO, DEPTNO 
FROM emp 
WHERE EXISTS (SELECT DEPTNO FROM DEPT WHERE DEPTNO IN (20,30) AND EMP.DEPTNO = dept.deptno);

-- 결과가 다 그게 그거다
SELECT EMPNO, DEPTNO 
FROM emp 
WHERE EXISTS (SELECT 1 FROM DEPT WHERE DEPTNO IN (20,30) AND EMP.DEPTNO = dept.deptno);

-- NOT을 넣어봤다
SELECT EMPNO, DEPTNO 
FROM emp 
WHERE NOT EXISTS (SELECT 1 FROM DEPT WHERE DEPTNO IN (20,30) AND EMP.DEPTNO = dept.deptno);


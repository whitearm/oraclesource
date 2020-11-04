--계정이 가지고 있는 모든 테이블 조회

select * from tab;

--emp 테이블 구조 조회
DESC emp;

-- emp 테이블의 모든 내용 조회
SELECT * FROM emp;

-- emp 
SELECT ename, job, sal FROM emp;

--중복 레코드 제거 후 조회 DISTINCT
SELECT DISTINCT deptno FROM emp;

-- 별칭(alais)
select empno AS 사원번호 FROM emp;

SELECT ename, sal, sal*12+comm, comm FROM emp;

SELECT ename as 사원이름, job as "직 책" from emp;

-- 하나의 열로 기준을 주어 오름차순(ASC) 조회, ORDER BY : 정렬하여 조회
SELECT ename,sal FROM emp ORDER BY sal;

-- 하나의 열로 기준을 주어 내림차순(DESC) 조회
SELECT ename,sal FROM emp ORDER BY sal DESC;

-- 전체 데이터를 조회(사원번호 오름차순)
SELECT * FROM emp ORDER BY empno;

--부서번호의 오름차순이고, 부서번호가 동일하다면 급여의 내림차순
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;


SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME, MGR AS MANAGER, SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTEMNT_NO FROM emp ORDER BY deptno DESC, ename ASC;

--WHERE 조회를 할 때 기준 만들기

-- 부서번호가 30번인 사원 조회
SELECT * FROM emp WHERE deptno = 30;

-- 사원번호가 7782인 사원 조회
SELECT * FROM emp WHERE empno = 7782;

--부서번호가 30이고 사원직책이 SALESMAN 정보조회 (데이터 타입이 가차일 때 ''로 묶어야 한다)
SELECT * FROM emp WHERE deptno = 30 AND job ='SALESMAN';

-- 사원번호가 7499이고, 부서번호가 30인 정보조회
SELECT * FROM emp WHERE empno = 7499 AND deptno = 30;

-- 부서번호가 30이거나, 사원직책이 CLERK 정보조회
SELECT * FROM emp WHERE deptno = 30 OR job ='CLERK';

-- 부서번호가 20이거나, 사원직책이 SALESMAN 정보조회
SELECT * FROM emp WHERE deptno = 20 OR job ='SALESMAN'; 
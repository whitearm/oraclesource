SELECT * FROM DEPT_TEMP;

CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;

--데이터 추가하기 (방법 1)
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
VALUES(50, 'DATABASE','SEOUL');

--데이터 추가하기 (방법 2)
INSERT INTO dept_temp VALUES(60,'NETWORK','BUSAN');

-- 에러 상황(INSERT 3개 했는데 밸류가 2개여서 생김)
--INSERT INTO dept_temp(DEPTNO, DNAME, LOC)  VALUES(50, 'DATABASE');
-- 에러상황 (녹화_2020_11_09_14_39_16_730 참조)
--INSERT INTO dept_temp(DEPTNO, DNAME, LOC)  VALUES(500, 'DATABASE','seoul');


--NUUL 삽입
--명시적 NULL 삽입 2가지 방법
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)  VALUES(70, 'DATABASE','NULL');
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)  VALUES(80, 'DATABASE','');


--묵시적 NULL 삽입
INSERT INTO dept_temp(DEPTNO, LOC)  VALUES(90,'INCHEON');

-- EMP 테이블을 복사하여 EMP_TEMP 테이블 생성
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP;

-- 테이블 삭제
DROP TABLE EMP_TEMP;

-- EMP테이블을 복사하여 EMP_TEMP 테이블 생성하되 구조만 복사하기
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1;

SELECT * FROM EMP_TEMP;

DESC EMP_TEMP;

INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(9999,'홍길동','PRESIDENT','','2020-11-09',4000,'',10);
INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(8888,'홍길동','MANAGER','','2020-11-08',3000,'',10);

--최종반영
COMMIT;

INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(7777,'유승호','MANAGER','',to_date('07/01/2010','dd/mm/yyyy'),4000,'',20);

INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(6666,'이순신','MANAGER','',SYSDATE,4000,'',20);

-- EMP 테이블에서 SALGRADE 테이블을 참조하여 급여 등급이 1등급인 사원만을 EMP_TEMP 테이블을 추가하고 싶은 경우
-- 서브쿼리로 작성하기
INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno FROM EMP E, SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND s.hisal AND S.GRADE = 1;

COMMIT;


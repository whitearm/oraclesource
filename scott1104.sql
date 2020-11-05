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

--연산자를 이용한 조회 ex) 산술연산자 : sal*12 한 금액이 36000 인 데이터 조회
SELECT * FROM emp WHERE sal*12=36000;

-- 관계연산자 : >, <, >=, <=
SELECT * FROM emp WHERE sal > 3000;
SELECT * FROM emp WHERE sal >= 3000;

-- 알파벳 순서가 F보다 뒤에 있는 경우
SELECT * FROM emp WHERE ename >= 'F';

-- 논리연산자 : AND, OR 
-- 급여가 2500 이상이고, 직업이 ANALYST인 사원정보 조회
SELECT * FROM emp WHERE SAL >= 2500 AND job = 'ANALYST';

--직무가 MANAGER, SALEMAN, CLERK 인 사원정보 조회
SELECT * FROM emp WHERE job = 'MANAGER' OR job = 'SALEMAN' OR job = 'CLERK';

-- 등가연산자 : 양쪽 항목이 같은지 검사 EX) SAL이 3000이 아닌 사원정보 출력
SELECT * FROM emp WHERE sal!=3000;
SELECT * FROM emp WHERE sal<>3000;
SELECT * FROM emp WHERE sal!=3000;

-- IN 연산자
SELECT * FROM emp WHERE job IN ('MANAGER','SALESMAN','CLERK');

SELECT * FROM emp WHERE job != 'MANAGER' AND job !='SALESMAN' AND job !='CLERK';
SELECT * FROM emp WHERE job NOT IN('MANAGER','SALESMAN','CLERK');

-- IN 을 사용해서 부서번호가 10,20번인 사원정보 조회
SELECT * FROM emp WHERE deptno IN(10,20);

--BETWEEN A AND B 1) 급여가 2000 이상 3000 이하인 사원정보 조회
SELECT * FROM emp WHERE sal >= 2000 AND sal <= 3000;
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 3000;

--1) 급여가 2000 이상 3000 이하가 아닌 사원정보 조회
SELECT * FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;

-- LIKE : 문자열 검색 사용(s로 시작하는 ~~, H로 끝나는..., 가운데에 T가 있으면)
-- 1) 사원 이름이 S로 시작하는 모든 사원정보 조회하기
SELECT * FROM emp WHERE ename LIKE 'S%';

--2) 사원 이름이 두번째 글자가 L인 사원만 조회
SELECT * FROM emp WHERE ename LIKE '_L%';

--3) 사원 이름에 AM이 포함되어 있는 사원만 조회
SELECT * FROM emp WHERE ename LIKE '%AM%';

-- IS NULL
-- SELECT * FROM emp WHERE comm = NULL; (X)
SELECT * FROM emp WHERE comm IS NULL;

--MGR(매니저 ID)이 NULL 인 사원정보 조회
SELECT * FROM emp WHERE mgr IS NULL;

--MGR(매니저 ID)이 NULL 이 아닌 사원정보 조회
SELECT * FROM emp WHERE mgr IS NOT NULL;

--집합연산자 : 합집합, 교집합, 차집합

--deptno 가 10인 테이블과 deptno가 20인 결과를 구해서 합해서 보여주기
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 20;

-- 부서번호가 10이 아닌 사원들의 정보조회
SELECT empno, ename, sal, deptno FROM emp
MINUS
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;

-- 오라클 함수
--1) 문자함수 : UPPER

-- ENAME 을 UPPER,LOWER,INITCAP으로 변환하여 조회
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename) FROM emp;

-- DUAL 테이블 이용(SYS가 소유하고 있는 테이블로 임시연산이나 함수의 결과값을 확인하는 용도)
-- 본래 FROM까지 해야 하지만 FROM으로 참조 할거 없고 SELECT 구문만으로 끝내고 싶을 때 DUAL을 사용
SELECT LENGTH('한글'), LENGTHB('한글') FROM DUAL;

-- 직책 이름이 6글자 이상인 사원들의 정보 추출
SELECT * FROM emp WHERE LENGTH(job) >= 6;

-- 문자열 함수 : substr
SELECT job, substr(job,1,2), substr(job,3,2), substr(job,5) FROM emp;

-- -length(job)의 결과는 -5
SELECT job, substr(job,-length(job)), substr(job,-length(job),2), substr(job,-3) FROM emp;

-- 문자열 함수 : instr(특정문자 위치 찾기)
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2, 
INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
FROM DUAL;

-- 문자열함수 : REPLACE
SELECT REPLACE('이건 oracle', '이건','this is') FROM dual;

SELECT '010-1234-5678' AS REPLACE_BEFORE_1,
    REPLACE('010-1234-5678','-') AS REPLACE_2
FROM dual;

-- 문자열 함수 : CONCAT(연결)
-- empno, ename을 연결하여 조회
SELECT CONCAT(empno,ename), CONCAT(empno, CONCAT(':',ename)) FROM emp WHERE ename='SCOTT';

SELECT empno || ename, empno || ':' || ename FROM emp WHERE ename='SCOTT';

-- 문자열 함수 : TRIM(공백제거), LTRIM(왼쪽 공백 제거)

-- 숫자함수 : ROUND(반올림), TRUNC(버림), CEIL(입력된 숫자와 가까운 큰 정수), FLOOR(입력된 숫자와 가까운 작은 정수), MOD(나머지)

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

--3. 날짜함수 : SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP
-- 날짜데이터는 연산이 가능함 : 날짜데이터 +1, -1, 날짜데이터-날짜데이터 등..
-- 단 날자데이터 + 날자데이터는 안됨

SELECT SYSDATE, CURRENT_DATE, CURRENT_TUMESTAMP FROM DUAL;


SELECT SYSDATE AS NOW, STSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW FROM DUAL;

-- 날짜 함수 : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM DUAL;

-- 입사 10주년이 되는 사원들 조회
SELECT empno, ename, hiredate, ADD_MONTHS(hiredate,120) FROM emp;

-- 오늘 날짜 기준으로 입사 38년 미만인 사원 조회
-- SELECT empno, ename, hiredate, ADD_MONTHS(hiredate,456) FROM emp;(x)
SELECT * FROM emp WHERE ADD_MONTHS(hiredate, 456) > SYSDATE;

SELECT * FROM emp WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) <456;

SELECT empno, ename, hiredate, SYSDATE, MONTHS_BETWEEN(hiredate,SYSDATE) AS MONTHS1,
MONTHS_BETWEEN(SYSDATE,hiredate) AS MONTHS2, TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate))
FROM emp;

-- 날짜함수 : NEXT_DAY, LAST_DAY
SELECT SYSDATE, NEXT_DAY(SYSDATE, '월요일'), LAST_DAY(SYSDATE) FROM DUAL;

4. 형변환 함수 : TO_CHAR(날짜, 숫자데이터를 문자로 변환), TO_NUMBER(문자데이터를 숫자로 변환), TO_DATE(문자 데이를 날짜로 변환)

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MM') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DAY') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH12:MI:SS') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS PM') AS 현재날짜 FROM DUAL;

-- 오늘날짜를 년/월/일 24시간제 HH:MI:SS 표현
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 오늘날짜 FROM DUAL;


SELECT 1300-'1500', '1300'+1500 FROM dual;
SELECT 1300-TO_NUMBER('1500'), TO_NUMBER('1300')+1500 FROM dual;
--,앞의 1을 필드로 인식해서 이상한 결과가 나온다
SELECT 1,300-TO_NUMBER('1500'), TO_NUMBER('1300')+1,500 FROM dual;

-- SELECT TO_NUMBER('1,300')-TO_NUMBER('1,500') FROM DUAL;(X)

--TO_NUMBER는 문자로 취급''해야 한다 뒤에 999,999는 숫자가 아닌 숫자의 형태로 나타내게 하는 구문
-- 9,0 (숫자의 한자리를 의미함), 9 빈자리를 채우지 않는 형태, 0 빈자리를 채우는 형태
SELECT TO_NUMBER('1,300','999,999')-TO_NUMBER('1,500','999,999') FROM dual;
SELECT TO_NUMBER('1,300','990,000')-TO_NUMBER('1,500','990,000') FROM dual;

-- L은 LOCALE이라 해서 해당 지역의 화폐단위가 나옴
SELECT SAL, TO_CHAR(SAL, '$999,999') AS SAL_$,
    TO_CHAR(SAL, 'L999,999') AS SAL_L,
    TO_CHAR(SAL, '$999,999.00') AS SAL_1,
    TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
    TO_CHAR(SAL, '000999999.99') AS SAL_3,
    TO_CHAR(SAL, '$999,999,00') AS SAL_4
FROM emp;

SELECT * FROM emp WHERE hiredate > TO_DATE('1981-06-01','YYYY-MM-DD');

SELECT TO_DATE('2019-12-20')-TO_DATE('2019-10-20') FROM DUAL;

-- 널처리 함수 : NVL, NVL2 
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM FROM EMP;
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM, NVL(COMM,0), SAL+NVL(COMM,0) FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, NVL2(COMM,'O','X'), NVL2(COMM,SAL*12+COMM,SAL*12) AS ANNSAL FROM EMP;

-- DECODE 함수와 CASE문

-- job이 manager, salesman, analyst 경우에 각각 다른 비율을 적용하고 싶다면
SELECT empno,ename,job,sal,DECODE(JOB, 'MANAGER', SAL*1.1;, 'SALESMAN',SAL*1.05,'ANALYST',SAL,SAL*1.03
) END AS UPSAL FROM EMP;

SELECT empno,ename,job,sal,CASE
    WHEN COMM IS NULL THEN '해당사항없음'
    WHEN COMM IS NULL THEN '해당사항없음'
    WHEN COMM IS NULL THEN '해당사항없음'
    
    -- 위에꺼 2개 다시
--------------------------------------------------------------------------------------

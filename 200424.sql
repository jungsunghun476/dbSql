SELECT empno,ename,hiredate,
        DECODE ( MOD(TO_CHAR(SYSDATE,'YYYY'),2), MOD(TO_CHAR(hiredate,'YYYY'),2), '건강검진대상자','건강검진비대상자')
FROM emp;

NULL처리하는 방법 (4가지 중에 본인 편한걸로 하나 이상은 기억)
NVL, NVL2...

condition : CASE, DECODE

실행계획 : 실행계획이 뭔지
          보는 순서;
          
emp 테이블에 등록된 직원들에게 보너스를 추가적으로 지급할 예정
해당 직원의 job이 SALESMAN일 경우 SAL에서 5% 인상된 금액을 보너스로 지급 (ex: sal 100 -> 105)

해당 직원의 job이 MANAGER이면서 deptno가 10이면 SAL에서 30% 인상된 금액을 보너스로 지급
                            그 외의 부서에 속하는 사람은 10% 인상된 금액을 보너스로 지급
                            
해당 직원의 job이 PRESIDENT일 경우 SAL에서 20% 인상된 금액을 보너스로 지급

그외 직원들은 sal만큼만 지급

SELECT empno, ename, job, sal, 
    DECODE(job,'SALESMAN' ,sal* 1.05,
               'MANAGER',DECODE(deptno,10,sal* 1.3,sal* 1.1),
               'PRESIDENT',sal* 1.2,sal) a                                          
FROM emp;

집합 A = (10, 15, 18, 23, 24, 25, 29, 30, 35, 37)
Prime Number 소수 : (23, 29, 37) : COUNT-3, MAX-37, MIN-23, AVG-29.66, SUM-99
비소수 : (10, 15, 18, 24, 25, 30, 37);

GROUP FUNCTION
여러행의 데이터를 이용하여 같은 그룹끼리 묶어 연산하는 함수
여러행을 입력받아 하나의 행으로 결과가 묶인다
EX : 부서별 급여 평균
     emp 테이벌에는 14명의 직원이 있고, 14명의 직원은 3개의 부서(10, 20, 30)에 속해 있다
     부서별 급여 평균은 3개의 행으로 결과가 반환된다

GROUP BY 적용시 주의 사항 : SELECT 기술할 수 있는 컬럼이 제한됨

SELECT 그룹핑 기준 컬럼, 그룹함수
FROM 테이블
GROUP BY 그룹핑 기준 컬럼
[ORDER BY ];

부서별로 가장 높은 급여 값
emp 테이블의 그룹 기준을 부서번호가 아닌 전체 직원으로 설정 하는 방법
SELECT  MAX(sal), --전체 직원중 가장 높은 급여 값
        MIN(sal), --전체 직원중 가장 낮은 급여 값
        ROUND(AVG(sal),2), --전체 직원의 급여 평균
        SUM(sal), --전체 직원의 급여 합
        COUNT(sal), --전체 직원의 급여 건수 (sal 컬럼의 값이 null이 아닌 row의 수)
        COUNT(*),  --전체 행의 수
        COUNT(mgr) --mgr 컬럼이 null이 아닌 건수 null값은 count 안됨
FROM emp;


* 그룹 함수를 통해 부서번호 별 가장 높은 급여를 구할 수는 있지만
  가장 높은 급여를 받는 사람의 이름을 알 수는 없다
    ==> 추후 WINDOW/분석 FUNCTION을 통해 해결 가능
    

SELECT deptno, sal
FROM emp
ORDER BY deptno;

----------------------------------------------------
발표 정답확인!
GROUP BY 절에 기술된 컬럼이
    SELECT 절에 나오지 않으면 ???? - 생략가능
GROUP BY 절에 기술되지 않은 컬럼이
    SELECT 절에 나오면 ???? - 안됨 오류
    
그룹화의 관련 없는 문자열, 상수 등은 SELECT 절에 표현 될 수 있다 (에러 아님);
SELECT  deptno, 'TEST', 1,
        MAX(sal), --전체 직원중 가장 높은 급여 값
        MIN(sal), --전체 직원중 가장 낮은 급여 값
        ROUND(AVG(sal),2), --전체 직원의 급여 평균
        SUM(sal), --전체 직원의 급여 합
        COUNT(sal), --전체 직원의 급여 건수 (sal 컬럼의 값이 null이 아닌 row의 수)
        COUNT(*),  --전체 행의 수
        COUNT(mgr) --mgr 컬럼이 null이 아닌 건수 null값은 count 안됨
FROM emp
GROUP BY deptno;

GROUP 함수 연산시 NULL 값은 제외가 된다
30번 부서에는 NULL값을 갖는 행이있지만 SUM(COMM)의 값이 정상적으로 계산된 걸 확인 할 수 있다
SELECT deptno, SUM(comm)
FROM emp
GROUP BY deptno;

10, 20번 부서의 SUM(COMM) 컬럼이 NULL이 아니라 0이 나오도록 NULL처리
* 특별한 사유가 아니면 그룹함수 계산결과에 NULL 처리를 하는 것이 성능상 유리

NVL(SUM(comm),0) : COMM컬럼에 SUM 그룹함수를 적용하고 최종 결과에 NVL을 적용(1회 호출)
SUM(NVL(comm),0) : 모든 COMM컬럼에 NVL 함수를 적용후(해당 그룹의 ROW수 만큼 호출) SUM 그룹함수 적용

SELECT deptno ,NVL(SUM(comm),0), SUM(NVL(COMM,0))
FROM emp
GROUP BY deptno;

signle row 함수는 where절에 기술할 수 있지만
multi row 함수(group 함수)는 where절에 기술할 수 없고
GROUP BY 절 이후 HAVING 절에 별도로 사용 가능

SELECT *
FROM emp
WHERE LOWER(ename) = 'smith';

부서별 급여 합이 5000이 넘는 부서만 조회
SELECT deptno, SUM(sal)
FROM emp
WHERE SUM(sal) > 9000
GROUP BY deptno;

SELECT deptno, SUM(sal)
FROM emp
GROUP BY deptno
HAVING SUM(sal) > 9000;

SELECT MAX(sal), MIN(sal), ROUND(AVG(sal),2), SUM(sal), COUNT(sal), COUNT(mgr), COUNT(*)
FROM emp;

SELECT deptno, MAX(sal) MAX_SAL, MIN(sal) MIN_SAL, ROUND(AVG(sal),2) AVG_SAL, SUM(sal) SUM_SAL, COUNT(sal) COUNT_SAL, COUNT(mgr)COUNT_MGR, COUNT(*) COUNT_ALL
FROM emp
GROUP BY deptno;

SELECT DECODE (deptno, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES') DNAME,
       MAX(sal) MAX_SAL, MIN(sal) MIN_SAL, ROUND(AVG(sal),2) AVG_SAL, SUM(sal) SUM_SAL, COUNT(sal) COUNT_SAL, COUNT(mgr)COUNT_MGR, COUNT(*) COUNT_ALL
FROM emp
GROUP BY DECODE (deptno, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES');

SELECT *
FROM emp;

SELECT TO_CHAR(hiredate,'YYYYMM') hire_yyyymm, count(*) CNT
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYYMM')
ORDER BY TO_CHAR(hiredate,'YYYYMM');

SELECT TO_CHAR(hiredate,'YYYY') hire_yyyymm, count(*) CNT
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYY');

SELECT COUNT(*) CNT
FROM dept;

SELECT * 
FROM emp;

SELECT COUNT(COUNT(*))
FROM emp
GROUP BY deptno;






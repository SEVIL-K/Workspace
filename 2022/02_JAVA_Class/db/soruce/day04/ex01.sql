/*
    문제1 ]
        직급이 MANAGER 인 사원들의
        사원이름, 직급, 입사일, 급여, 부서이름을 조회하세요
 */

SELECT ENAME 사원이름, JOB 직급, HIREDATE 입사일, SAL 급여, DNAME 부서이름
FROM EMP,
     DEPT
WHERE JOB = 'MANAGER'
  AND EMP.DEPTNO = DEPT.DEPTNO;


/*
    문제2 ]
        사원이름이 5글자인 사원들의
        사원이름, 직급, 입사일, 급여, 급여등급을 조회하세요.
 */

SELECT ENAME 사원이름, JOB 직급, HIREDATE 입사일, SAL 급여, GRADE 급여등급
FROM EMP,
     SALGRADE
WHERE LENGTH(ENAME) = 5
  AND SAL BETWEEN LOSAL AND HISAL;

/*
   문제3 ]
       입사일이 81년이고 직급이 MANAGER 인 사원들의
       사원이름, 직급, 입사일, 급여, 급여등급, 부서이름, 부서위치를 조회하세요.
 */

SELECT ENAME 사원이름, JOB 직급, HIREDATE 입사일, SAL 급여, GRADE 급여등급, DNAME 부서이름, LOC 부서위치
FROM EMP,
     DEPT,
     SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL
  AND to_char('yy') = 
  AND EMP.DEPTNO = DEPT.DEPTNO;


/*
    문제4 ]
        사원들의
        사원이름, 직급, 급여, 급여등급, 상사이름 을 조회하세요.
 */

SELECT e.ENAME 사원이름, e.JOB 직급, e.SAL 급여, GRADE 급여등급, s.ENAME 상사이름
FROM EMP e,
     EMP s,
     SALGRADE
WHERE e.SAL BETWEEN LOSAL AND HISAL
  AND e.MGR = s.EMPNO(+);

/*
    문제5 ]
        사원들의
        사원이름, 직급, 급여, 상사이름, 부서이름, 급여등급을 조회하세요.
 */

SELECT e.ENAME 사원이름, e.JOB 직급, e.SAL 급여, s.ENAME 상사이름, DNAME 부서이름, GRADE 급여등급
FROM EMP e,
     EMP s,
     SALGRADE,
     DEPT
WHERE e.SAL BETWEEN LOSAL AND HISAL
  AND e.MGR = s.EMPNO(+)
  AND e.DEPTNO = DEPT.DEPTNO;


SELECT E.DEPTNO,
       E.EMPNO,
       E.ENAME,
       E.SAL,
       LAST_VALUE(E.SAL)
                  OVER (PARTITION BY E.DEPTNO
                      ORDER BY E.SAL ROWS
                      --unbounded preceding and unbouned following
                      --unbounded：     ，
                      --preceding： ...
                      --following： ...
                      BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) MAX_SAL
FROM scott.EMP E;

--
SELECT job      부서이름,
       AVG(sal) 평균급여
FROM emp
GROUP BY job;

SELECT JOB, AVG(SAL) OVER (PARTITION BY JOB)
FROM EMP;
--


/*
    문제6 ]

 */

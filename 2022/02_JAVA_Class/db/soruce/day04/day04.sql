/*
    참고  ]
        HAVING 절
        ==> 그룹화한 결과를 필터링 할 때
            필터링 조건을 기술하는 절...

            참고  ]
                WHERE 절에는 그룹함수를 사용할 수 없다.
                HAVING 절에는 그룹함수를 사용할 수 있다.
 */

/*
   JOIN
   ==> Relation DataBase Management System(RDBMS) 에서는 데이터의 중복을 피하기 위해서
       테이블을 분리하고 그럼으로써 테이블들 간의 관계가 형성이 되었다.

       분리된 테이블에서 데이터를 추출해낼 때 사용하는 문법이 JOIN 이다

       참고  ]
           오라클은 ER 형태의 데이터베이스 이다.
           ER
           ==> 엔티티(테이블) 끼리의 관계를 이야기하고 이런 관계들로 테이블들을 관리하는 데이터베이스를
               관계형 데이터베이스라고 한다.

       참고  ]
           관계형 데이터베이스에서는 여러개의 테이블에서 동시에 검색하는 기능은 이미 가지고 있다.
           ==> 이 때 여러개의 테이블에서 데이터를 동시에 검색하면
               Cartesian Product 가 만들어지는데 이 결과에는 정확하지 않은 데이터도 포함되어 있다.
               따라서 정확한 데이터만 필터링해서 꺼내와야 하는데
               이 때 필터링하는 작업이 JOIN 이라고 한다.

    종류  ]

        Inner Join
        ==> 나열된 테이블들의 결과집합 안에서 꺼내오는 조인
            Equi Join
            ==> 조인을 할 때 동등비교 연산자로 조인 하는 경우

            Non Equi Join
            ==> 조인을 할 때 동등비교 연산자 이외의 연산자로 조인하는 경우

        Outer Join
        ==> Cartesian Product 에 포함되지 않는 데이터를 가져오는 조인
            형식  ]
                테이블이름.필드이름 = 테이블이름.필드이름(+)
                ==> 이 때 (+)는 NULL 로 표현되어야 할 테이블쪽에 붙여준다.
        Self Join
        ==> 조인을 하는데 대상테이블이 같은 테이블을 사용하는 조인


 */


-- 영문 색상이름 테이블

DROP TABLE ecolor;
CREATE TABLE ecolor
(
    ceno NUMBER(3)  -- 영문 컬러 일련번호
        CONSTRAINT ECLR_NO_PK PRIMARY KEY,
    code VARCHAR(7) -- 영문 컬러 코드값
        CONSTRAINT ECLR_CODE_UK UNIQUE
        CONSTRAINT ECLR_CODE_NN NOT NULL,
    name varchar2(20)
        CONSTRAINT ECLR_NAME_NN NOT NULL
);

-- 데이터 추가
INSERT INTO ecolor
VALUES (100, '#FF0000', 'red');

INSERT INTO ecolor
VALUES (101, '#00FF00', 'green');

INSERT INTO ecolor
VALUES (102, '#0000FF', 'blue');

INSERT INTO ecolor
VALUES (103, '#800080', 'purple');


-- 영문컬러 테이블 조회
SELECT *
FROM ecolor;
COMMIT; -- 메모리의 작업영역에서 작업한 내용을 데이터베이스에 적용시키는 명령

DROP TABLE kcolor;
CREATE TABLE kcolor
(
    ckno NUMBER(3)
        CONSTRAINT KCLR_NO_PK PRIMARY KEY,
    code varchar2(7)
        CONSTRAINT KCLR_CODE_UK UNIQUE
        CONSTRAINT KCLR_CODE_NN NOT NULL,
    name varchar2(20)
        CONSTRAINT KCLR_NAME_NN NOT NULL
);

-- 데이터 추가
INSERT INTO kcolor
VALUES (100, '#FF0000', '빨강');

INSERT INTO kcolor
VALUES (101, '#00FF00', '녹색');

INSERT INTO kcolor
VALUES (102, '#0000FF', '파랑');

-- 한글컬러 테이블 조회
SELECT *
FROM kcolor;
COMMIT; -- 메모리의 작업영역에서 작업한 내용을 데이터베이스에 적용시키는 명령

SELECT *
FROM ecolor,
     kcolor;


SELECT *
FROM EMP e,
     EMP ee;

-- Inner Join
SELECT ceno cno, e.code, e.name ename, k.name kname
FROM ecolor e,
     kcolor k
WHERE e.code = k.code;
-- 조인조건


-- Outer Join
SELECT ceno cno, e.code, e.name ename, k.name kname
FROM ecolor e,
     kcolor k
WHERE e.code = k.code(+);


-- Self Join
-- 사원이름, 상사번호, 상사이름, 상사급여를 조회하세요

SELECT e.ENAME 이름, e.MGR 상사번호, s.ENAME 상사이름, s.SAL 상사급여
FROM EMP e,
     EMP s
WHERE e.MGR = s.EMPNO(+);

-- Non equi join
-- 사원이름, 직급, 급여, 급여등급을 조회하세요
SELECT ENAME 이름, JOB 직급, SAL 급여, GRADE 급여등급
FROM EMP,
     SALGRADE
WHERE SAL BETWEEN losal AND hisal;

-- 사원번호, 사원이름, 직급, 부서이름, 부서위치를 조회하세요
SELECT EMPNO 사원번호, ENAME 이름, JOB 직급, DNAME 부서이름, LOC 부서위치
FROM EMP,
     DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;


-- 81년 입사한 사원의
-- 사원이름, 직급, 입사일, 부서이름 을 조회하세요

SELECT ENAME 이름, JOB 직급, TO_CHAR(HIREDATE, 'yyyy"년" mm"월" dd"일"') 입사일, DNAME 부서이름
FROM EMP,
     DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
  AND TO_CHAR(HIREDATE, 'yy') = '81';


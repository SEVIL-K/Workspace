/*
    참고 ]
        HAVING 절
        ==> 그룹화한 결과를 필터링을 할 때
            필터링 조건을 기술하는 절....
            
        참고 ]
            WHERE 절에는 그룹함수를 사용할 수 없다.
            HAVING 절에는 그룹함수를 사용할 수 있다.
*/

/*
    JOIN 
    ==> Relation DataBase Management System 에서는 데이터의 중복을 피하기 위해서
        테이블을 분리하고 그럼으로써 테이블들 간에 관계가 형성이 되었다.
        
        그런데 분리된 테이블에서 데이터를 추출해낼때 사용하는 문법이 JOIN 이다.
        
        참고 ]
            오라클 역시 ER 형태의 데이터베이스이다.
            ER
                엔티티(테이블)끼리의 관계를 이야기하고
                이런 관계들로 테이블을 관리하는 데이터베이스를 관계형데이터베이스라고 한다.
                
    참고 ]
        관계형데이터베이스에서는 여러개의 테이블에서 동시에 검색하는 기능은 이미 가지고 있다.
        ==> 이때 여러개의 테이블에서 데이터를 동시에 검색하면
            Cartesian Product(CROSS JOIN) 가 만들어지는데
            이 결과에는 정확하지 않은 데이터도 포함되어있다.
            따라서 정확한 데이터만 필터링해서 꺼내와야 하는데
            이때 이 필터링하는 작업이 JOIN 이라고 한다.
                
                
    종류 ]
        
        Inner Join
        ==>  나열된 테이블들의 결과집합 안에서 꺼내오는 조인...
            Equi Join
            ==> 조인을 할때 동등비교연산자로 조인을 하는 경우
            
            Non Equi Join
            ==> 조인을 할 때 동등비교연산자 이외의 연산자로 조인하는 겨우
            
        Outer Join
        ==> Catesian Product 에 포함되지 않는 데이터를 가져오는 조인
            
            형식 ]
                
                테이블이름.필드이름 = 테이블이름.필드이름(+)
                
                이때 (+) 는 NULL 로 표현되어야 할 테이블쪽에 붙여준다.
                
                
        Self Join
        ==> 조인을 하는데 대상테이블이 같은 테이블을 사용하는 조인
        
        
    참고 ]
        조인에서도 다른 일반조건을 사용할 수 있다.
*/

-- 영문색상이름 테이블
DROP TABLE ecolor;
CREATE TABLE ecolor (
    ceno NUMBER(3) -- 영문 칼라 일련번호
        CONSTRAINT ECLR_NO_PK PRIMARY KEY,
    code VARCHAR2(7) -- 칼라 코드값
        CONSTRAINT ECLR_CODE_UK UNIQUE
        CONSTRAINT ECLR_CODE_NN NOT NULL,
    name varchar2(20)
        CONSTRAINT ECLR_NAME_NN NOT NULL
);

-- 데이터추가
INSERT INTO
    ecolor
VALUES(
    100, '#FF0000', 'red'
);

INSERT INTO
    ecolor
VALUES(
    101, '#00FF00', 'green'
);

INSERT INTO
    ecolor
VALUES(
    102, '#0000FF', 'blue'
);

INSERT INTO
    ecolor
VALUES(
    103, '#800080', 'purple'
);

commit;

-- 영문칼라테이블 조회
SELECT * FROM ecolor;
COMMIT; -- 메모리의 작업영역에서 작업한 내용을 데이터베이스에 적용시키는 명령

DROP TABLE kcolor; --  테이블 삭제명령

CREATE TABLE kcolor (
    ckno NUMBER(3)
        CONSTRAINT KCLR_NO_PK PRIMARY KEY,
    code VARCHAR2(7)
        CONSTRAINT KCLR_CODE_UK UNIQUE
        CONSTRAINT KCLR_CODE_NN NOT NULL,
    name varchar2(20)
        CONSTRAINT KCLR_NAME_NN NOT NULL
);

-- 데이터추가
INSERT INTO
    kcolor
VALUES(
    100, '#FF0000', '빨강'
);

INSERT INTO
    kcolor
VALUES(
    101, '#00FF00', '녹색'
);

INSERT INTO
    kcolor
VALUES(
    102, '#0000FF', '파랑'
);

commit;


SELECT * FROM ecolor;
SELECT * FROM kcolor;

SELECT
    *
FROM
    ecolor, kcolor
;

SELECT
    *
FROM
    emp e, emp ee
;

SELECT
    e.ceno cno, e.code, e.name ename, k.name kname
FROM
    ecolor e, kcolor k
WHERE
    e.code = k.code -- 조인조건
;

-- Outer Join
SELECT
    e.ceno cno, e.code, e.name ename, k.name kname
FROM
    ecolor e, kcolor k
WHERE
    e.code = k.code(+)
;

-- self join
-- 사원들의 사원이름, 상사번호, 상사이름, 상사급여 를 조회하세요.

SELECT
    e.ename 사원이름, e.mgr 상사번호, s.ename 상사이름, s.sal 상사급여
FROM
    emp e, emp s
WHERE
    e.mgr = s.empno(+)
;

create table sansa 
as
    select * from emp;
    
-- 사원들의 사원이름, 직급, 급여, 급여등급 을 조회하세요.

SELECT
    ename 사원이름, job 직급, sal 급여, grade 급여등급
FROM
    emp, salgrade
WHERE
    sal BETWEEN losal AND hisal
;

-- 사원들의 사원번호, 사원이름, 직급, 부서이름, 부서위치 를 조회하세요.

SELECT
    empno 사원번호, ename 사원이름, job 직급, dname 부서이름, loc 부서위치
FROM
    emp e, dept d
WHERE
    e.deptno = d.deptno
;

-- 81년 입사한 사원의
-- 사원이름, 직급, 입사일, 부서이름 을 조회하세요.
SELECT
    ename 사원이름, job 직급, TO_CHAR(hiredate,'YYYY"년 "MM"월 "DD"일"') 입사일, dname 부서이름
FROM
    emp, dept
WHERE
    emp.deptno = dept.deptno    -- 조인조건
    AND TO_CHAR(hiredate, 'yy') = '81'  -- 일반조건
;

SELECT * FROM EMP, SALGRADE
WHERE
    ENAME = 'KING'
    AND SAL BETWEEN LOSAL AND HISAL
;

--------------------------------------------------------------------------------
/*
    ANSI JOIN
    ==> 질의 명령은 데이터베이스(DBMS)에 따라서 약간ㅆ기 그 분법이 달라진다.
        
        ANSI 형식이란
        미국 국립 표준 협회(ANSI)에서 공통의 질의 명령을 만들고자 해서 통일된 방식의
        명령을 만들어 놓은것.
        따라서 DBMS를 가리지 않고 실행이 된다.
        
    -------------------------------------------------------------------------------
    1. Cross Join
        ==> 오라클의 Cartesion Product 를 생성하는 조인
        
        형식 ]
            SELECT
                필드이름, ...
            FROM
                테이블1 CROSS JOIN 테이블2
            ;
        
    2. Inner Join
        ==> Equi Join, Non Equi Join, Self Join
        
        형식 ]
            SELECT
                필드이름, ....
            FROM
                테이블1 [INNER ]JOIN 테이블2
            ON
                조인조건
            ;
            
        참고 ]
            조인조건은 ON 절에서 기술하고
            일반조건은 WHERE 절에서 기술한다.
            
        참고 ]
            INNER JOIN이 가장 일반적인 조인이기 때문에 INNER 라는 단어를 생략하면
            INNER JOIN을 해석해서 실행하게 된다.
        
    3. Outer Join
        ==> Cartesion Product 에 없는 결과를 조회하는 조인 명령
        
        형식 ]
            
            SELECT
                필드이름, ...
            FROM
                테이블1 LEFT  또는 RIGHT 또는 FULL OUTER JOIN 테이블2
            ON
                조인조건
            ;
        
        이때 방향은 데이터가 있는 쪽 테이블을 가리키면 된다.
        
    참고 ]
        조인이 2개이상 되는 경우에는
        형식 ]
            
            SELECT
            
            FROM
                테이블이름 
            JOIN 
                테이블2
            ON
                조인조건
            JOIN
                테이블3
            ON
                조인조건2
            ;
            
*/

-- ANSI JOIN
-- CROSS JOIN
-- 사원정보와 부서정보를 크로스조인하세요.
SELECT
    *
FROM
    emp CROSS JOIN dept
;

-- INNER JOIN
-- 사원들의 사원이름, 직급, 부서번호, 부서이름 을 조회하세요.
SELECT
    ename 사원이름, job 직급, e.deptno 부서번호, dname 부서이름
FROM
    emp e INNER JOIN dept d
ON -- 조인조건절...
    e.deptno = d.deptno
;

-- 81년 입사한 사원들의 사원이름, 직급, 입사년도, 부서이름을 조회하세요.
SELECT
    ename 사원이름, job 사원직급, TO_CHAR(hiredate, 'YY') 입사년도, dname 부서이름
FROM
    emp e INNER JOIN dept d
ON
    -- 조인조건
    e.deptno = d.deptno
WHERE
    TO_CHAR(hiredate, 'YY') = '81'
;

-- 사원들의 사원이름, 상사이름 을 조회하세요.

-- INNER JOIN
 SELECT
    e.ename 사원이름, s.ename 상사이름
 FROM
    emp e JOIN emp s
 ON
    e.mgr = s.empno
 ;

-- OUTER JOIN
SELECT
    e.ename 사원이름, NVL(s.ename, '상사없음') 상사이름
FROM
    emp e LEFT OUTER JOIN emp s
ON
    e.mgr = s.empno
;

-- 사원들의 사원이름, 부서이름, 급여, 급여등급 을 조회하세요.
SELECT
    ename 사원이름, dname 부서이름, sal 급여, grade 급여등급
FROM
    emp e
JOIN
    dept d
ON
    e.deptno = d.deptno
JOIN
    salgrade
ON
    e.sal BETWEEN losal AND hisal
;

--------------------------------------------------------------------------------

/*
    NATURAL JOIN
    ==> 자동 조인
        반드시 조인 조건식에 사용하는 필드의 이름이 동일하고
        반드시 동일한 필드가 한개일때 사용할 수 잇는 조인
        자동으로 중복되는 필드를 사용해서 조인을 하기 때문에
        조인조건을 기술하지 않는다.
        
        형식 ]
            SELECT
                필드이름,...
            FROM
                테이블1
            NATURAL JOIN
                테이블2
            ;
            
    USING JOIN
    ==> 반드시 조인 조건식에 사용하는 필드의 이름이 동일한 경우
        그리고 같은 이름의 필드가 여러개 존재해도 무방하다.
        
        형식 ]
            SELECT
                필드이름, ...
            FROM
                테이블1
            JOIN
                테이블2
            USING
                ( 조인에 사용할 필드이름 )
            ;
*/

-- 사원들의 사원이름, 부서이름 을 조회하세요.
SELECT
    ename 사원이름, dname 부서이름
FROM
    emp
NATURAL JOIN
    dept
;

CREATE TABLE tmp
AS
    SELECT
        e.*, dname
    FROM
        emp e, dept d
    WHERE
        e.deptno = d.deptno
;

alter table tmp
rename column dno to deptno;
-- TMP 테이블과  부서정보테이블을 이용해서 
-- 사원들의 사원이름, 부서위치를 조회하세요.
SELECT
    ename, loc
FROM
    tmp
JOIN
    dept
USING
    (deptno)
;

--------------------------------------------------------------------------------
/*
    부질의(SUB QUERY, 서브질의)
    ==> 질의명령 안에 다시 질의명령을 포함하는 경우
        포함되는 그 질의 명령을 서브질의 또는 서브쿼리 라고 부른다.
        
        예 ]
            이름이 SMITH 인 사원과 같은 부서에 있는 사원들의 정보를 조회하세요.
            ==> 이 경우 SMITH 의 부서번호를 알아내기 위해서 먼저 질의명령이 실행되어야 한다.
            
            ==> 꺼내온 부서번호를 이용해서 정보를 조회
            
            이때 위의 질의명령을 아래 메인질의명령에서 조회해서 사용해야 한다.
            
    참고 ]
        이때 서브질의를 감싸는 질의 명령을 메인질의 명령이라 부른다.
        
    서브질의의 위치에 따른 결과
        1. SELECT 절
        ==> 이 부분에 사용되는 질의명령은 결과가 반드시 한행, 한필드가 나와야한다.
        2. FROM 절
        ==> FROM 절에는 테이블이 나열되어야 한다.
            그런데 조회 질의 명령의 결과는 마치 테이블과 같다.
            그러면 이 조회 질의 명령의 결과를 테이블처럼 사용할 수 있는 방법
            
            이때 FROM 절 안에 들어가는 서브질의를
            특별히 마치 테이블과 같다해서
                INLINE TABLE
            이라고 부른다.
            
            이때 사용은 질의명령을 보낼때 사용한 별칭을 
            사용해서 데이터를 꺼내야 한다.
            
        3. WHERE 절
            1. 단일행 단일필드로 결과가 발생하는 경우
            ==> 결과를 비교에 사용하면 된다.
            
            2. 다중행 단일필드로 결과가 발생하는 경우
                참고 ]
                    서브질의의 결과가 다중행 단일필드로 결과가 발생하는 경우
                    이때 사용하는 연산자
                    
                    IN  : 여러개의 데이터중 하나만 맞으면 되는 경우
                        ==> 묵시적으로  여러값중 하나와 동등비교처리를 한다.
                        
                    ANY : 여러개의 데이터 중 하나만 맞으면 되는 경우
                        ==> 대소비교 연산자도 사용가능 
                        
                    ALL : 여러개의 데이터가 모두 맞으면 되는 경우
                        ==> 동등비교는 사용할 수 없고
                            대소비교할 때 사용한다.
                    
                
            3. 다중행 다중필드로 결과가 발생하는 방법
            
                EXISTS : 질의명령의 결과가 있으면 참, 없으면 거짓...
*/
SELECT
    *
FROM
    emp
WHERE
    deptno = (
                SELECT
                    deptno
                FROM
                    emp
                WHERE
                    ename = 'SMITH'
            )
;

-- 사원들의 사원이름, 부서번호, 부서이름, 부서위치
SELECT
    ename 사원이름, deptno 부서번호, 
    (
        SELECT
            dname
        FROM
            dept
        WHERE
            deptno = e.deptno
    ) 부서이름,
    (
        SELECT
            loc
        FROM
            dept
        WHERE
            deptno = e.deptno
    ) 부서위치
FROM
    emp e
;


-- 조건절에 단일행 단일필드의 결과
-- SMITH 사원과 동일한 부서의 사원들의 정보를 조회하세요.
SELECT
    *
FROM
    emp
WHERE
    deptno = (
                SELECT
                    deptno
                FROM
                    emp
                WHERE
                    ename = 'SMITH'
            )
;

-- 10부서 사원들과 같은 직급의 직급 평균을 조회하세요.
SELECT
    job 직급이름, AVG(sal) 직급급여평균
FROM
    emp
WHERE

    job IN (
            SELECT
                job
            FROM
                emp
            WHERE
                deptno = 10 
                -- 질의명령의 결과는 다중값으로 발생한다. 
                --     MANAGER, PRESIDENT, CLERK
        )

--    deptno = 10
GROUP BY
    job
;

--------------------------------------------------------------------------------

-- IN
-- 직급이  MANAGER인 사원과 같은 부서에 속한 사원들의 
--      사원이름, 직급, 부서번호 를 조회하세요.
SELECT
    ename 사원이름, job 직급, deptno 부서번호
FROM
    emp
WHERE
    deptno IN (
                SELECT
                    deptno
                FROM
                    emp
                WHERE
                    job = 'MANAGER'
             )
;


/*
    NO IN (10, 20, 30)
    
    NO = 10 OR NO = 20 OR NO = 30
*/

-- ANY
-- 각 부서의 평균 급여보다 한부서라도 급여가 높은 사원들의 
-- 사원이름, 사원급여, 부서번호 를 조회하세요.
SELECT
    ename 사원이름, sal 사원급여, deptno 부서번호
FROM
    emp
WHERE
    sal > any (
            SELECT
                AVG(sal)
            FROM
                emp
            GROUP BY
                deptno
          )
;

-- 모든 각부서의 급여 평균보다 높은 급여를 받는 사원들의
-- 사원이름, 사원급여, 부서번호 를 조회하세요.
SELECT
    ename 사원이름, sal 사원급여, deptno 부서번호
FROM
    emp
WHERE
    NOT sal > ALL (
            SELECT
                AVG(sal)
            FROM
                emp
            GROUP BY
                deptno
          )
;

-- 사원중 40번 부서 사원이 존재하면 모든 사원들의
-- 사원이름, 부서번호 를 조회하세요.
SELECT
    scott.emp.ename 사원이름, deptno 부서번호
FROM
    scott.emp
    /*
        테이블을 가리킬때 원칙은
            계정.테이블이름
        의 형식으로 사용해야 한다.
        하지만 접속계정이 가지고있는 테이블에 한해서는
        테이블이름만 기술해도 된다.
    */
WHERE
    EXISTS ( -- 부정은 NOT EXISTS 로 표현한다.
                SELECT
                    *
                FROM
                    emp
                WHERE
                    deptno = 40
            )
;

--------------------------------------------------------------------------------
-- 사원들의 사원이름, 부서번호, 부서원수, 부서평균급여, 부서급여합계 를 조회하세요.

SELECT
    ename 사원이름, deptno 부서번호, 
    cnt 부서원수, 부서평균 부서평균급여, sum 부서급여합계
FROM
    emp,
    (
        SELECT
            deptno dno, COUNT(*) cnt, ROUND(AVG(sal), 2) 부서평균, SUM(sal) sum
        FROM
            emp
        GROUP BY
            deptno
    )
WHERE
    deptno = dno
;


SELECT
    ename 사원이름, deptno 부서번호, 
    (
        SELECT
            count(*)
        FROM
            emp
        WHERE
            deptno = e.deptno
    ) 부서원수, 
    (
        SELECT
            avg(sal)
        FROM
            emp
        WHERE
            deptno = e.deptno
    ) 부서평균급여, 
    (
        SELECT
            SUM(sal)
        FROM
            emp
        WHERE
            deptno = e.deptno
    ) 부서급여합계
FROM
    emp e
;

--------------------------------------------------------------------------------
-- 회사 평균급여보다 적게 받는 사원들의
-- 사원이름, 직급, 입사일, 급여 를 조회하세요.

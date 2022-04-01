-- 계층형 질의
/*
    댓글형 게시판의 경우
    목록을 꺼내올때 상위글 바로 다음에
    그글의 댓글이 조회가 되어야 한다.

    오라클의 경우는
    계층형 결과를 볼수 있는 문법을 만들어서 제공해주고 있다.

    형식 ]
        SELECT

        FROM

        START WITH
            계층 추적 시작 값...
        CONNECT BY
            계층추적 조건
        ORDER SIBLINGS BY
            계층간 정렬...

        참고 ]
            PRIOR : "이전" 이란 의미로
                    이전 계층을 의미...
*/

-- 사원들을 조회하는데 사장부터 계층으로 조회하세요...
SELECT LPAD(' ', (LEVEL - 1) * 3, ' ') || empno || ' - ' || ename || ' - ' || job || ' - ' || mgr || ' - ' || LEVEL 정보,
       HIREDATE
FROM emp START WITH
    mgr IS NULL
CONNECT BY
    mgr = PRIOR empno
ORDER SIBLINGS BY
    hiredate DESC
;


--------------------------------------------------------------------------------
/*
    CRUD - 데이터를 다루는 명령들의 약자

    따라서 CRUD 를 이야기하면
    DML 명령을 사용할 수 있는지를 이야기하는 것이된다.

    이제 우리가 배운 명령들은 모두
    CRUD 중에서 R 에 해당하는
    SELECT 질의명령만 공부했는데

    C - CREATE - INSERT
    U - UPDATE - UPDATE
    D - DELETE - DELETE

    을 공부할 예정이다.


    1. INSERT
        ==> 이미 만들어진 테이블에 데이터를 추가하는 명령

            형식 ]
                INSERT INTO
                     테이블이름[(필드이름1, 필드이름2, ....)]
                VALUES(
                    테이블이 가지는 모든 필드의 데이터
                    만약 필드이름을 지정해 놓으면
                    위에서 지정한 순서대로 필드에 해당하는 데이터를 입력해야 한다.
                );

            주의 ]
                입력을 할때는 필드의 순서에 맞게
                반드시 데이터의 갯수와 순서를 일치시켜서 입력해야 한다.

        참고 ]
            만약 데이터가 준비되지 않아서 데이터가 부족할 경우에는
                1. NULL로 그 부분을 대신 채우면 된다.

                2. 필드이름을 지정할 때 생략하면 된다.

         필드에 설정된 디폴드 값으로 입력되게 하려면
         필드를 나열할때 생략하면 된다.

*/


-- 연습용 테이블 복사...
-- emp 테이블을 구조만 복사해서 emp1으로 만들자.

CREATE TABLE emp1
AS
SELECT *
FROM emp
WHERE 1 = 2
;

-- emp1에 '제니' 사원을 입력해보자.
INSERT INTO emp1
VALUES (1001, '제니', '사장', NULL, sysdate, 300, 116, 99);

ALTER TABLE emp1
    MODIFY hiredate DEFAULT sysdate;

ALTER TABLE emp1
    ADD CONSTRAINT EMP1_NO_PK PRIMARY KEY (empno)
;

--DESC emp1;

-- emp1 테이블에 로제 사원을 입력하세요.
INSERT INTO emp1(empno, ename)
VALUES (1002, '로제');

-- emp1 테이블에 리사 사원을 추가하세요.
INSERT INTO emp1(ename, empno)
VALUES (
--     1003, '리사' -- 순서가 맞지 않아서 입력오류
           '리사', 1003);

/*
    **********
    참고 ]
        DML 명령은 메모리 상에 확보한 세션공간에서만
        작업이 이루어진다.
        따라서 데이터베이스에 적용은 안되어있는 상태이다.
        작업내용을 데이터베이스에 적용되기를 원하면
        반드시 commit 명령을 실행해야 한다.
*/

COMMIT;

INSERT INTO emp1(ename, empno)
VALUES (
--     1003, '리사' -- 순서가 맞지 않아서 입력오류
           '지수', 1004);

INSERT INTO emp1(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (1005, '둘리');

-- *** 다른테이블의 데이터를 복사해서 입력하는 방법
-- emp 테이블에 있는 KING 사원의 정보를 emp1 테이블에 복사해보자.
INSERT INTO emp1
    (
        SELECT *
        FROM emp
        WHERE ename = 'KING'
    )
;

--------------------------------------------------------------------------------
/*
    2. UPDATE
        ==> 기존 데이터의 내용을 수정하는 명령

        형식 ]
            UPDATE
                테이블이름
            SET
                필드이름 = 데이터,
                필드이름 = 데이터,
                ...
            [WHERE
                조건식
            ]

        ***
        참고 ]
            WHERE 조건절이 없는 경우는
            모든 데이터가 같은 내용으로 수정된다.
*/

CREATE TABLE emp2
AS
SELECT *
FROM emp1
;

UPDATE
    emp2
SET job = '메니저'
;

ROLLBACK;

--PDATE
--emp2
SET
    job = '메니저'
WHERE
    ename = '지수'
;

COMMIT;

/*
--  서브질의를 사용해서 데이터를 수정할 수 있다.
-- 이때 여러개의 필드를 동시에 질의명령의 결과로 대체하고자 한다면

    형식 ]
        UPDATE

        SET
            (필드1, 필드2) = (
                                SELECT
                                    꺼낼필드1, 꺼낼필드2
                                FROM
                                    테이블이름
                                WHERE
                                    조건식
                            )
        WHERE
            조건식
        ;

    참고 ]
        만약 수정을 원하지 않는 데이터를 반드시 써야한다면
        현재 데이터를 그대로 사용해도 된다.
*/

-- 로제의 직급과 급여를 EMP 테이블의 SMITH 사원의 데이터를 복사해서 수정하세요.
UPDATE
    emp2
SET (job, sal) = (
    SELECT job,
           sal + 300
    FROM emp
    WHERE ename = 'SMITH'
)
WHERE ename = '로제'
;

COMMIT;


UPDATE
    emp2
SET sal = sal,
    job = job
WHERE ename = '로제'
;
COMMIT;

--------------------------------------------------------------------------------
/*
    DELETE
    ==>  현재 데이터 중에서 필요하지 않는 데이터를 삭제하는 명령
        한행을 통째로 지운다는 의미

        형식 ]
            DELETE
            FROM
                테이블이름
            [WHERE
                조건식
            ]

        ***
        참고 ]
            조건식을 제시하지 않으면 모든 데이터가 삭제된다.

        참고 ]
            이 명령은 되도록이면 사용하지 않을 것을 권하는 명령이다.

            현업에서는
            isShow CHAR(1)라는 필드를 준비해두고
            기본값은 'Y'
            그리고 삭제가 필요한 경우는 'N' 으로 데이터를 수정한다.
            그리고 조회질의명령에서는
            반드시
                WHERE
                    isshow = 'Y'
            를 추가해서 조회한다.

--------------------------------------------------------------------------------

*/

DELETE
FROM emp2;

ROLLBACK;


/*
    참고 ]
        데이터베이스 명령의 종류

            1. DML
                C   - CREATE    -   INSERT
                R   - READ      -   SELECT  ==> QUERY
                U   - UPDATE    -   UPDATE
                D   - DELETE    -   DELETE
            2. DDL ( Data Definition Language )
                ==> 데이터베이스의 개체에 관련된 명령

                종류 ]
                    CREATE      : 개체를 만드는 명령
                    ALTER       : 만들어진 개체를 수정하는 명령
                    DROP        : 만들어진 개체를 삭제하는 명령
                    TRUNCATE    : 테이블의 데이터를 잘라내는 명령
            3. DCL

            4. 관리자 모드 처리

            5. PL/SQL

*/

TRUNCATE TABLE emp2;

ROLLBACK;
-- dcl  명령

/*
    참고 ]
        테이블 설계
            오라클은 정규화된 데이터를 기억하도록 하는 데이터베이스의 일종이다.
            ( ==> 정형데이터베이스 )
            정규화 데이터란?
            규칙이 정해진 데이터를 말한다.
            즉, 오라클은 어떤 데이터를 기억할지를 미리 정해놓고
            그 데이터에 한해서만 기억하도록 하는 데이터베이스이다.

            따라서 테이블을 만들때는
            여러가지 규칙을 정해놓고(정규화 규칙)
            테이블에 들어갈 데이터를 결정해야 한다.

            데이터베이스 설계 과정

                1. 개념적 설계
                    추상적인 개념 설계

                    개념적 설계의 결과로 개념적 데이터 모델이 만들어진다.

                2. 논리적 설계
                    ==> 개념적 설계의 결과를
                        물리적 저장장치에 저장할 수 있도록
                        특정 데이터베이스가 지원하는 논리적인 자료구조로 변환시키는 과정

                        데이터타입과
                        데이터들간의 관계 표현

                        ER-D, 테이블 명세서

                3. 물리적 설계
                    ==> 논리적 설계의 결과를
                        물리적으로 구현하는 단계
                        질의명령을 작성하는 것을 의미
                        DDL 명령 을 작성

                        결과물은 SQL 문


    정규화 과정

        1. 제1정규화
            ==> 개체가 갖는 속성은 원자값을 가져야한다.

            ==> 결과물로 제1정규형

        2. 제2정규화
            ==> 기본키에 대해서 모든키는 완전함수 종속이어야 한다.
            ==> 결과물로 제2정규형

        3. 제3정규화
            ==> 이행적 함수종속에서 벗어나야한다.

        4. BCNF 정규화

        5. 제4정규화
        ...

*/

CREATE TABLE tmp1
AS
SELECT e.*,
       dname,
       loc
FROM emp e,
     dept d
WHERE e.deptno = d.deptno
;
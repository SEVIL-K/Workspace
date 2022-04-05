-- day 07

/*
    제약조건 추가하기

        형식 1    ]
            컬럼이름    데이터타입 (길이)
                CONSTRAINT 제약조건이름 PRIMARY KEY
                CONSTRAINT 제약조건이름 REFERENCES 테이블이름(컬럼이름)
                CONSTRAINT 제약조건이름 UNIQUE
                CONSTRAINT 제약조건이름 NOT NULL
                CONSTRAINT 제약조건이름 CHECK (컬럼이름 IN(데이터1, 데이터2,...) )  << 조건식

        형식 2    ]
            컬럼이름    데이터타입 (길이),
            컬럼이름    데이터타입 (길이)
            ...
            CONSTRAINT 제약조건이름 PRIMARY KEY(컬럼이름),
            CONSTRAINT 제약조건이름 UNIQUE(컬럼이름),
            CONSTRAINT 제약조건이름 FOREIGN KEY(컬럼이름) REFERENCES 테이블이름(컬럼이름),
            CONSTRAINT 제약족건이름 CHECK(컬럼이름 IN (데이터1, 데이터2,...) )

            주의  ]
                컬럼이 만들어진 이후에는 NOT NULL 제약조건은 추가하지 못한다.
                <== 제약조건을 추가하지 않고 테이블을 만들게 되면
                    컬럼들은 NULL 데이터를 허용하는 컬럼으로 만들어진다..
                    따라서 NOT NULL 제약조건은 이런 컬럼속성을 수정해줘야 한다..

        형식 3    ]
            제약조건 없이 테이블을 만드는 경우 테이블 수정명령으로 제약조건을 추가하는 방법

            ALTER TABLE 테이블이름
            ADD CONSTRAINT 제약조건이름 제약조건(컬럼이름);
 */


CREATE TABLE TMP
(
    no   NUMBER(2),
    name VARCHAR2(10 CHAR)
);

DROP TABLE TMP;

/*
    여러 테이블을 생성할 때
        생성하는 순서는 참조해주는 테이블부터 생성해야 한다.
 */

-- 아바타 테이블
DROP TABLE avatar CASCADE CONSTRAINTS; -- 제약조건때문에 삭제가 불가능한 부분을 강제로 삭제하는 명령

CREATE TABLE avatar
(
    avt_no    NUMBER(2),
    avt_name  VARCHAR2(15 CHAR),
    avt_oname VARCHAR2(50 CHAR),
    avt_sname varchar2(50 CHAR),
    avt_dir   varchar2(100 CHAR),
    avt_len   number,
    avt_gen   CHAR(1)
        CONSTRAINT AVT_GEN_CK CHECK (avt_gen IN ('F', 'M', 'N'))
        CONSTRAINT AVT_GEN_NN NOT NULL,
    avt_date  date    DEFAULT SYSDATE,
    isshow    char(1) DEFAULT 'Y',
    CONSTRAINT AVT_NO_PK PRIMARY KEY (avt_no),
    CONSTRAINT AVT_SNAME__UK UNIQUE (avt_sname),
    CONSTRAINT AVT_SHOW__CK CHECK ( isshow IN ('Y', 'N'))
);

-- NOT NULL 제약조건 수정
ALTER TABLE avatar
    MODIFY avt_name CONSTRAINT AVT_NAME_NN NOT NULL;

ALTER TABLE avatar
    MODIFY avt_oname CONSTRAINT AVT_ONAME_NN NOT NULL;

ALTER TABLE avatar
    MODIFY avt_sname CONSTRAINT AVT_SNAME_NN NOT NULL;

ALTER TABLE avatar
    MODIFY avt_dir CONSTRAINT AVT_DIR_NN NOT NULL;

ALTER TABLE avatar
    MODIFY avt_len CONSTRAINT AVT_LEN_NN NOT NULL;

ALTER TABLE avatar
    MODIFY avt_date CONSTRAINT AVT_DATE_NN NOT NULL;

ALTER TABLE avatar
    MODIFY isshow CONSTRAINT AVT_SHOW_NN NOT NULL;


--회원테이블 추가
CREATE TABLE member
(
    user_no   NUMBER(4)
        CONSTRAINT MB_NO_PK PRIMARY KEY,
    user_name VARCHAR2(20 CHAR)
        CONSTRAINT MB_NAME_NN NOT NULL,
    user_id   VARCHAR2(15 CHAR)
        CONSTRAINT MB_ID_UK UNIQUE
        CONSTRAINT MB_ID_NN NOT NULL,
    user_pw   VARCHAR2(15 CHAR)
        CONSTRAINT MB_PW_NN NOT NULL,
    user_mail VARCHAR2(50 CHAR)
        CONSTRAINT MB_MAIL_UK UNIQUE
        CONSTRAINT MB_MAIL_NN NOT NULL,
    user_tel  VARCHAR2(13 CHAR)
        CONSTRAINT MB_TEL_UK UNIQUE
        CONSTRAINT MB_TEL_NN NOT NULL,
    user_avt  number(2) DEFAULT 10
        CONSTRAINT MB_ANO_FK REFERENCES AVATAR (AVT_NO)
        CONSTRAINT MB_ANO_NN NOT NULL,
    user_gen  CHAR(1)
        CONSTRAINT MB_GEN_CK CHECK (user_gen IN ('F', 'M'))
        CONSTRAINT MB_GEN_NN NOT NULL,
    joindate  DATE      DEFAULT SYSDATE
        CONSTRAINT MB_JOIN_NN NOT NULL,
    isShow    CHAR(1)   DEFAULT 'Y'
        CONSTRAINT MB_SHOW_CK CHECK (isshow IN ('Y', 'N'))
        CONSTRAINT MB_SHOW_NN NOT NULL
);

/*
    등록된 제약조건 확인하는 방법
    ==> 등록된 제약조건은 오라클이 테이블을 이용해서 관리한다.
        이 테이블 이름이 USER_CONSTRAINTS 이다.

        따라서 이 테이블의 내용을 확인하면 등록된 제약조건을 확인할 수 있다.
            참고 ]
            CONSTRAINT_TYPE

                P   - PRIMARY KEY
                R   - FOREIGN KEY
                U   - UNIQUE
                C   - NOT NULL, CHECK

        -------------------------------------------------------------
    제약조건 삭제하기

        형식 ]

            ALTER TABLE 테이블이름
            DROP CONSTRAINT 제약조건이름;

    참고 ]
        기본키(PRIMARY KEY)의 경우는 제약조건 이름을 몰라도 삭제할 수 있다.
        기본키는 테이블에 오직 한개만 만들어지기 때문에...

        형식 ]
            ALTER TABLE 테이블이름
            DROP PRIMARY KEY;
 */


-- 아바타 테이블의 제약조건조회

SELECT CONSTRAINT_NAME 제약조건이름, CONSTRAINT_TYPE 제약조건, TABLE_NAME 테이블이름
FROM USER_CONSTRAINTS
WHERE table_name IN ('AVATAT', 'MEMBER');


-- 회원테이블 기본키 제약조건 삭제
ALTER TABLE member
    DROP
        PRIMARY KEY;

-- 기본키 추가
ALTER TABLE member
    ADD CONSTRAINT MB_NO_PK PRIMARY KEY (mno);

-- tmp 테이블 생성
CREATE TABLE tmp
(
    tno number(4)
);


/*
    테이블 수정하기
        1) 필드 추가하기
            형식  ]
                ALTER TABLE 테이블이름
                ADD ( 필드이름 데이터타입(길이) CONSTRAINT 제약조건이름 제약조건 );

        2) 필드이름 변경하기
            형식  ]
                ALTER TABLe 테이블이름
                RENAME COLUMN 필드이름 TO 바꿀이름;

        3) 필드 길이 변경하기
            형식  ]
                ALTER TABLE 테이블이름
                MODIFY 필드이름 데이터타입(길이);

            참고  ]
                DEFAULT 값 추가
                ALTER TABLE 테이블이름
                MODIFY 필드이름 DEFAULT 데이터;

            참고  ]
                길이변경은 현재길이보다 늘이는 것은 가능하지만 줄이는것은 불가능하다..
                이미 입력되어있는 데이터가 수정된 길이를 넘는 것은 불가능하기 때문

        4) 필드 삭제하기
            형식  ]
                ALTER TABLE 테이블이름
                DROP COLUMN 필드이름




    ----------------------------------------------------------------
        1) 테이블이름 변경하기
            형식  ]
               ALTER TABLE 테이블이름
                RENAME TO 변경할테이블이름

        2) 테이블 삭제하기
            참고  ]
                테이블 내의 모든 데이터도 같이 삭제된다..
            형식 1  ]
                DROP TABLE 테이블이름;

            형식 2    ]
                DROP TABLE 테이블이름 purge;
                ==> 휴지통에 넣지 말고 완전 삭제하세요..

            참고  ]
                DML 명령은 복구가 가능하지만
                DDL 명령은 복구가 원칙적으로 불가능

            참고  ]
                10g부터 휴지통 개념을 추가해서 삭제된 데이터를 휴지통에 보관하도록 하고 있다..

            휴지통 관리  ]
                1. 휴지통에 있는 모든 데이터를 완전 지우기
                    purge recyclebin;

                2. 휴지통에 있는 특정 테이블만 완전삭제
                    purge table 테이블이름;

                3. 휴지통 확인하기
                    show recyclebin;

                4. 휴지통이 테이블 복구하기
                    flashback table 테이블이름 to before drop;
 */


-- tmp 테이블에 name 필드추가
ALTER TABLE tmp
    ADD (tname varchar2(10 CHAR)
        CONSTRAINT TMP_NAME_NN NOT NULL);

-- tmp 테이블의 no 필드에 기본키제약조건 추가
ALTER TABLE tmp
    ADD CONSTRAINT TMP_NO_PK PRIMARY KEY (TNO);

-- tmp 테이블의 no를 TNO 로 바꾸자
ALTER TABLE tmp
    RENAME COLUMN NO TO tno;

-- 휴지통 확인하기
SHOW
RECYCLEBIN;

---------------------------------------------------------------
/*
    TRUNCATE
        ==> DML 명령 중 BLELTE 명령과 같이
            테이블 안에 있는 모든 데이터를 삭제하는 명령

        형식  ]
            TRUNCATE TABLE 테이블이름;

        참고  ]
            DELETE 명령은 DML 소속이고 ==> 복구 가능
            TRUNCATE 명령은 DDL 소속 명령 ==> 복구 불가능

 */

/*
    무결성 체크
        ==> 데이터베이스는 프로그램 등 전산에서 작업할 때 필요한 데이터를 제공해주는 보조 프로그램이다..
            따라서 데이터베이스가 가진 데이터는 항상 완벽한 데이터여야 한다..
            그런데 데이터를 입력하는 것은 사람의 몫이고 따라서 완벽한 데이터를 보장할 수 없게 되었다..

            각각의 테이블에 들어가서는 안될 데이터나 빠지면 안되는 데이터등을 미리 결정해놓고
            데이터를 입력하는 사람이 잘못입력하면 그 데이터는 아예 입력되지 못하도록 방지하는 역할을 하는 기능이다..

            한마디로 정리하자면
                이상데이터가 입력되는 것을 방지하는 기능

            따라서 이 기능이 반드시 필요한 기능은 아니다..
            ( ==> 입력하는 사람이 정신 바짝차리고 입력하면 될 일이기 때문에
            실수를 미연에 방지할 수 있도록 하는 기능이다..

 */

/*
    참고  ]
        테이블을 생성하는 명령으로
        서브질의의 결과를 이용해서 테이블을 만드는 방법도 있다..

        CREATE TABLE 테이블이름
        AS 서브질의;

    참고  ]
        이렇게 복사하게되면 모든 데이터와 테이블의 구조를 복사할 수 있지만
        NOT NULL 제약조건을 제외한 모든 제약조건은 복사해 오지 않는다.

    참고  ]
        이 때 복사할 테이블의 구조만 복사하고 싶은 경우
        CREATE TABLE 테이블이름
        AS
            SELETE * FROM 테이블이름 WHERE 1=2;
 */

-- MEMBER 테이블의 모든 내용을 복사해요 MEMB02 테이블을 만들어보자
CREATE TABLE memb2
AS
SELECT *
FROM member;

-- SCOTT.EMP
SELECT ename,
       job,
       hiredate,
       deptno
FROM emp
WHERE ename = 'SMITH'
;

SELECT ename,
       job,
       hiredate,
       deptno
FROM emp
WHERE 1 = 2
;

-- INSERT 명령에 서브질의를 사용할 수 있다.
/*
    형식 ]
        INSERT INTO 테이블이름
            서브질의
        ;
*/

-- EMP테이블의 사원중 부서번호가 10번인 사원들의 데이터만 복사하세요.
INSERT INTO emp2
SELECT *
FROM emp
WHERE deptno = 10
;



-------------------------------------------------------------------------------

/*
    DCL(Data Control Language)

        트랜젝션 처리
        ==> 교과서적인 의미로
        오라클이 처리(실행) 하는 명령 단위를 의미한다..

        우리가 테이블을 만들 때 create 명령을 치고 엔터키를 누르면
        그 명령을 실행하게 되는데
        이것을 "트랜젝션이 실행되었다" 라고 표현한다..

            위와같이 대부분의 명령은 엔터키를 누르는 순간
            명령이 실행되고 그것은 곧 트랜젝션이 실행된 것이므로
            결국 오라클은 명령 한줄이 곧 하나의 트랜젝션이 된다.

            그런데 DML 명령 만큼은 트랜젝션의 단위가 달라진다.
                참고 ]
                    DML 명령 : INSERT, UPDATE, DELETE
                    ==> DML 명령은 곧장 실행되는 것이 아니고
                    버퍼 장소(임시 기억장소)에 그 명령을 모아만 놓는다.
                    ==> 결국 트랜젝션이 실행되지 않는다.

            따라서 DML  명령은 강제로 트랜젝션 실행 명령을 내려야 한다.
            이 때 트랜젝션은 한번만 일어나게 된다.

            왜?
                <==
                DML 명령은 데이터를 변경하는 명령이다.
                데이터베이스에서 가장 중요한 개념은 무결성인데
                이런곳에 DML 명령이 한순간 트랜젝션 처기가 된다면
                데이터의 무결성이 깨질 수 있다.
                이런 문제점을 해결하기 위한 목적으로
                트랜젝션 방식을 변경해 놓았다.

            그런데
            버퍼에 모아놓은 명령을 트랜젝션 처리하는 방법

                자동 트랜젝션 처리
                    1. sqlplus 를 정상적으로 종료하는 순간 트랜젝션 처리가 일어난다.
                        ==> exit 명령으로 세션을 정상적으로 닫는 순간 트랜젝션 처리가 일어난다.

                    2. DDL명령이나 DCL 명령이 내려지는 순간

                수동 트랜젝션 처리
                    3. commit 이라고 강제로 명령을 내리는 순간

                참고 ]
                    버퍼에 모아놓은 명령이 실행되지 않는 순간
                    ==> 트랜젝션 처리가 되지 못하고 버려지는 경우

                    자동
                        1. 정전등에 의해서 시스템이 셧다운 되는 순간
                        2. sqlplus 를 비정상 종료하는 순간

                    수동
                        3. rollback 이라고 명령을 내리는 순간

    *****
    결론적으로
    DML 명령을 내린 후 다시 검토해서 완벽한 명령이라고 판단되면
    COMMIT 이라고 명령해서 트랜젝션을 발생시키고
    만약 검토과정중 오류가 발견되면
    ROLLBACK 라는 명령으로 잘못된 명령을 취소하도록 한다.

    책갈피 만들기
        SAVEPOINT 적당한이름;

    이것을 사용해서 ROLLBACK 하는 방법

        ROLLBACK TO SAVEPOINT이름;

    예 ]
        SAVEPOINT a;
            DML (1)
            DML (2)
            DML (3)
        SAVEPOINT b;
            DML (4)
            DML (5)
            DML (6)
        SAVEPOINT c;
            DML (7)
            DML (8)
            DML (9)

        ROLLBACK TO c;   7,8,9만 취소
        ROLLBACK TO b;  4,5,6[,7,8,9] 가 취소
        ROLLBACK TO a;  1,2,3[,4,5,6,7,8,9] 가 취소

    참고 ]
        트랜젝션이 처리되면 SAVEPOINT는 자동 파괴된다.


 */

ALTER TABLE emp2
    ADD CONSTRAINT EMP2_NO_PK PRIMARY KEY (empno);

/*
    뷰(VIEW)

    종류 ]

        1. 단순뷰 : 하나의 테이블만 이용해서 만들어진 뷰
                    DML 명령이 원칙적으로 가능
        2. 복합뷰 : 두개 이상의 테이블을 이용해서 (조인해서) 만들어진 뷰
                    DML 명령이 불가능
            ==> 그냥 보기만 하세요...(SELECT명령만...)

    ----------------------------------------------------------------------------
    참고 ]
        원칙적으로 사용자 계정은 관리자가 허락한 일만 할 수 있다.
        그런데 뷰를 만드는 권한은 아직 부여되어있지 않다.
        따라서 권한을 부여하고 뷰를 만들어야 한다.

        권한 부여하는 방법 - 관리자계정에서(SYSTEM)

            GRANT 권한이름, 권한이름, ... TO 계정이름;

    ----------------------------------------------------------------------------

    뷰를 만드는 방법

        형식 1 ]
            CREATE[ OR REPLACE] VIEW 뷰이름
            AS
                서브질의;

        참고 ]
            뷰를 확인하는 방법
            오라클에서는 뷰를 관리하는 테이블이 존재하고 그 테이블에서 관리한다.
            그 테이블 이름이  USER_VIEW 이다.

        형식 2    ]
            ==> DML 명령으로 데이터를 변경할 때
                변경된 데이터는 기본 테이블만 변경되므로
                뷰 입장에서 보면 그 데이터를 실제로 사용할 수 없을 수 있다..

                CREATE [OR REPLACE] VIEW 뷰이름
                AS 질의명령
                WITH CHECK OPTION;

        형식  3   ]
            ==> 뷰를 이용해서 데이터를 변경하면
                뷰를 사용하는 데이터만 변경 가능하다..
                이것은 원본 테이블의 입장에서는 문제가 발생할 수 있다..
                뷰를 통해서 데이터를 수정하지 못하도록 방지하는 형식

                CREATE OR REPLACE VIEW

 */


-- 관리자계정에서 작업
GRANT
    CREATE VIEW TO scott;
GRANT
    CREATE VIEW TO JENNIE;



CREATE OR REPLACE VIEW dnosal
AS
SELECT deptno   dno,
       MAX(sal) MAX,
       MIN(sal) MIN,
       SUM(sal) SUM,
       AVG(sal) AVG,
       COUNT(*) cnt
FROM emp
GROUP BY deptno
;

-- 사원들의 사원이름, 부서번호, 부서최대급여, 부서원수를 조회하세요.
SELECT ename  사원이름,
       deptno 부서번호,
       max    부서최대급여,
       cnt    부서원수
FROM emp,
     dnosal
WHERE deptno = dno
;

-- USER_VIEWS 구조확인
DESC USER_VIEWS;

SELECT *
FROM USER_VIEWS
WHERE VIEW_NAME = 'DNOSAL';

-- EMP 테이블의 사원들의 사원번호, 사원이름, 부서번호, 부서이름, 부서위치 를 조회하는 뷰(EMP_DNO)를 만드세요.

CREATE OR REPLACE VIEW emp_dno
AS
SELECT empno,
       ename,
       e.deptno,
       dname,
       loc
FROM emp e,
     dept d
WHERE e.deptno = d.deptno
;

-- 데이터 추가( 두테이블을 조인해서 만든 복합뷰이므로 DML 명령을 사용할 수 없다.)
INSERT INTO emp_dno
VALUES (8000, 'JENNIE', 40, 'OPERATIONS', 'BOSTON');

/*
    문제 2 ]
        10번 부서 사원들의 사원번호, 사원이름, 급여, 커미션 을 조회하는 뷰(DNO10)을 만드세요.
*/
CREATE OR REPLACE VIEW dno10
AS
SELECT empno,
       ename,
       sal,
       comm
FROM emp
WHERE deptno = 10
;

-- 제니사원이 입사했습니다.
INSERT INTO dno10
VALUES (8000, 'jennie', 7000, 10000);


ROLLBACK;

-- EMP 테이블을 복사해서 EMPLOYEE 테이블을 만세요.
-- 기본키 제약조건과, 참조키 제약조건을 추가하세요.
CREATE TABLE employee
AS
SELECT *
FROM emp
;

-- PK
ALTER TABLE employee
    ADD CONSTRAINT EMPLY_NO_PK PRIMARY KEY (empno);

-- FK
ALTER TABLE employee
    ADD CONSTRAINT EMPLY_DNO_FK FOREIGN KEY (deptno) REFERENCES dept (deptno);

/*
    문제 3 ]
        EMPLOYEE 테이블의 10번 부서 사원들의 사원번호, 사원이름, 급여, 커미션, 부서번호 을 조회하는 뷰(DNO10)을 만드세요.
        뷰를 만드는 조건으로 사용되는 컬럼의 데이터는 수정하지 못하도록 하세요.
*/
CREATE OR REPLACE VIEW dno10
AS
SELECT empno,
       ename,
       sal,
       comm,
       deptno
FROM employee
WHERE deptno = 10
WITH CHECK
    OPTION
;

-- dno10 조회
SELECT *
FROM dno10;

-- CLARK 의 커미션을 500 으로 인상하세요.
UPDATE
    dno10
SET comm = NVL(comm + 500, 500)
WHERE ename = 'CLARK'
;

-- KING의 부서번호를 40번으로 수정하세요.( 에러가 발생 )
UPDATE
    dno10
SET deptno = 40
WHERE ename = 'KING'
;


UPDATE
    employee
SET deptno = 40
WHERE ename = 'KING'
;

ROLLBACK;

-- 게시판 테이블(BOARD)의  글번호, 작성자번호, 글제목, 작성일, 클릭수 를 조회하는 뷰를 작성하세요.
CREATE OR REPLACE FORCE VIEW brdlist
AS
SELECT bno,
       bmno,
       title,
       wdate,
       click
FROM board
;

-- brdlist 삭제
DROP VIEW brdlist;

















ALTER TABLE EMP1
    MODIFY job varchar2(20 char);

ALTER TABLE EMP1
    MODIFY ENAME varchar2(20 char);

-- DML(INSERT, UPDATE, DELETE)

/*
    문제1 ]
        EMP1 테이블에 다음 데이터를 입력하세요.
            사원번호 : 2001
            이름 : 둘리
            직급 : 머슴
            급여 : 10
            입사일 : 현재시간
 */

INSERT INTO EMP1 (EMPNO, ENAME, JOB, SAL, HIREDATE)
VALUES (2001, '둘리', '머슴', 10, SYSDATE);
COMMIT;

/*
    문제2 ]
        EMP1 테이블에 다음 데이터를 입력하세요.
            이름 : 고길동
            직급 : 애완동물
            입사일 : 2022년 03월 21일
 */

INSERT INTO EMP1 (EMPNO, ENAME, JOB, HIREDATE)
VALUES (2002, '고길동', '심통', '2022-03-21');
COMMIT;


/*
    문제3 ]
        EMP1 테이블에 다음 데이터를 입력하세요.
            이름 : 희동이
            직급 : 대장
            급여 : NULL
            입사일 : 2022년 01월 01일
 */

INSERT INTO EMP1 (EMPNO, ENAME, JOB, SAL, HIREDATE)
VALUES (2003, '희동이', '대장', NULL, '2022-01-01');
COMMIT;



-- 데이터 수정
/*
    문제4 ]
        EMP1 테이블에서 다음 데이터를 수정하세요.
            제니, 로제, 리사, 지수
            사원의 이름을 이름앞에 'Ms.'를 붙여서 수정하세요.
            나머지 사원들은 이름앞에 'Mr.'을 붙여서 수정하세요.
 */

SELECT *
FROM EMP1;

UPDATE EMP1
SET ENAME = '제니'
WHERE ENAME = 'Ms.제니';

UPDATE EMP1 E1
SET E1.ENAME = CASE
                 WHEN e1.ENAME IN ('제니', '로제', '리사', '지수') THEN 'Miss.' || E1.ENAME
                 ELSE 'Mr.' || ENAME
    END;
COMMIT;


/*
    문제5 ]
        EMP1 테이블에서 다음 데이터를 수정하세요.
            입사년도가 81년인 사원만 급여를 25% 인상하는데, 10단위 이하는 버림으로 처리하세요.
 */

UPDATE EMP1
SET SAL = TRUNC(SAL * 1.25, 2)
WHERE TO_CHAR(HIREDATE, 'yy') = '81';
COMMIT;


-- 다른 테이블의 데이터 복사
/*
    문제6 ]
        EMP 테이블의 'SMITH' 사원의 데이터를 복사해서
        EMP1 테이블에 입력하세요.
 */




-- 데이터 삭제
/*
    문제7 ]
        EMP1 테이블에서 부서번호가 10번인 사원만 삭제하세요.
 */


/*
    문제8 ]
        EMP1 테이블에서 이름이 'H'로 끝나는 사원만 삭제하세요.
 */
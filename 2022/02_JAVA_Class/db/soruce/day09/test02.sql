-- test02 계정으로 접속해서 작업

CREATE OR REPLACE VIEW shono
AS
    SELECT
        no
    FROM
        test01
;

GRANT CREATE VIEW TO test01;

GRANT SELECT ANY TABLE TO test01;

REVOKE CREATE VIEW FROM test01;


SELECT
    *
FROM
    scott.emp
WHERE
    deptno = 10
;

SELECT
    *
FROM
    jennie.member
;

-- test01에게 권한을 줄수 있는 권한까지 포함해서 scott.emp 를 조회하는 권한을 주세요.
GRANT SELECT ON scott.emp TO test01 WITH GRANT OPTION;
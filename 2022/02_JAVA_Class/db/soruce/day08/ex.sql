-- EMPLOYEES 테이블의 사원들중
-- 전화번호가 011로 시작하는 사원들만 조회해서
-- 다섯명씩 한페이지에 보여주려고 한다.
-- 3 페이지에 표시될 사원들을 조회하세요.
-- 이름순(first_name)으로 정렬해서 보여주세요.
SELECT
    *
FROM
    (
        SELECT
            ROWNUM rno, e.*
        FROM
            (
                SELECT
                    *
                FROM
                    employees
                WHERE
                    phone_number LIKE '011%'
                ORDER BY
                    first_name
            ) e
    )
WHERE
    rno BETWEEN 11 AND 15
;



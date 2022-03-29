/*
    9. REPLACE()
        ==> 문자열의 특정부분을 다른 문자열로 대체해서 반환해주는 함수
        
        형식  ]
            REPLACE(데이터, 찾을문자, 대체문자)
            
    10. TRIM
        =>> 문자열 중에서 앞 또는 뒤에 있는 지정한 문자를 삭제해서 반환해주는 함수
        
        형식  ]
            TRIM('삭제할 문자' FROM 데이터)
        참고  ]
            중간에 있는 문자는 삭제하지 못한다.
            같은 문자가 앞, 뒤로 연속되어 있으면 모두 지운다.
            가끔 데이터 앞 또는 뒤에 공백문자가 들어간 경우가 있다.
            이런 경우를 대비해서 앞 뒤에 들어간 공백 문자를 제거할 목적으로 많이 사용한다.
            
        10-1
            LTRIM
            RTRIM
            형식  ]
                LTRIM(데이터, 삭제문자)
                    
                    
    11. CHR()
        ==> ASCII 코드를 알려주면 그 코드에 해당하는 문자를 알려주는 함수
        
        형식  ]
            CHR(숫자)
        
    12. ASCII()
        ==> 문자열에 해당하는 ASCII 코드값을 알려주는 함수
        
        형식  ]
            ASCII(데이터)
        참고  ]
        두 글자 이상으로 이루어진 문자열은 맨 처음 문자만 반환한다.
        
    13. TRANSLATE
        ==> REPLACE 와 마찬가지로 문자열 중 지정한 부분을 
            다른 문자열로 바꿔서 반환해주는 함수
            
            차이점 ]
                REPLACE 함수는 바꿀 문자열 전체를 바꾸는데
                이 함수는 문자단위로 처리한다.

        
*/

SELECT
REPLACE('hong gil dong', 'n', 'nn') 홍길동
FROM
dual;


SELECT
REPLACE('hong gi l dong', ' ', '') 홍길동
FROM
dual;

SELECT
TRIM(' ' FROM '   hong gi l dong'   ) 홍길동
FROM
dual;

SELECT
LTRIM('oooooooooooooooraleoooooooooooooooooooo', 'o')
FROM
dual;

SELECT
ASCII('HONG') 코드값,
CHR(ASCII('HONG')) 알파벳
FROM
dual;

SELECT
TRANSLATE('ADBC', 'ABCD', '1234')
    /*
        A --> 1
        B --> 2
        C --> 3
        D --> 4 로 변환한다.
    */
FROM
dual;



-------------------------------------------------------------------------

/*
    날짜 처리 함수
    
        **
        참고 ]
            SYSDATE
            ==> 예약어 
                현재 시스템의 날짜와 시간을 알려주는 예약어
                (의사 컬럼으로 보면 된다.)
                
        참고 ]
            날짜 - 날짜 의 연산식이 가능하다.
            날짜 연번끼리 - 연산을 하게된다.
            
            참고 ]
                날짜연번 : 날수.시간
            
            날짜데이터의 기준점은 1970년 1월 1일 0시 0분 0초를 기준으로 한다.
            
        참고 ]
            날짜데이터의 연산은 오직 - 연산만 가능하다.
            날짜 + 날짜,
            날짜 * 날짜,
            날짜 / 날짜
            는 허락하지 않는다.
            
        참고 ]
            날짜 +(또는 -)  숫자
            의 연산은 가능하다.
            ==> 날짜 연번 +(-) 숫자이므로
                결국 날짜에서 원하는 숫자만큼 이동된 날짜를 표시한다.
                
    2. MONTHS_BETWEEN
        ==> 두 날짜 데이터의 개월수를 알려주는 함수
            
            형식 ]
                MONTHS_BETWEEN(날짜, 날짜)
     
*/
  
-- 사원들의 근무일수를 조회하세요.
SELECT
    ename 사원이름, 
    FLOOR(sysdate - hiredate) 근무일수
FROM
    emp
;

SELECT
    SYSDATE + 10 "10일후"
FROM
    DUAL
;


--------------------------------------------------------------------------------


  /*
    날짜데이터 처리함수
        
        1. ADD_MONTHS()
            ==> 날짜에 지정한 달수를 더하거나 뺀 날짜를 알려준다.
            
            형식 ]
                ADD_MONTHS(날짜, 더할개월수)
                
            참고 ]
                더할개월수에 음수를 입력하면
                해당 개월수를 뺀 날짜를 알려준다.
                
        3. LAST_DAY
            ==> 지정한 날짜가 포함된 월의 마지막 날짜를 알려주는 함수
        
            형식  ]
                LAST_DAY(날짜)
        
        4. NEXT_DAY
            ==> 지정한 날짜 이후에 가장 처음 오는 지정한 요일에 해당하는 날짜를 알려주는 함수
            
            형식  ]
                NEXT_DAY(지정날짜, 지정요일)
            
            참고  ]
                요일 정하는 방법
                    1. 우리는 한글 세티이 된 오라클이므로
                        '월' '화' '수',...
                        '월요일', '화요일'...
                    2. 영문권에서는
                    'SUN', 'MON'...
                    'SUNDAY', 'MONDAY'...
                    
        5. ROUND()
            ==> 날짜를 지정한 부분에서 반올림하는 함수
            이때 지정부분은 년, 월, 일, ...
            
            형식 ]
                ROUND(날짜, 기준단위)
            

*/

SELECT
    ADD_MONTHS(SYSDATE, 4) "4개월후",
    ADD_MONTHS(SYSDATE, -3) "3개월전"
FROM
    dual
;

-- 사원들의 근무개월수를 조회하세요.
SELECT
    ename 사원이름,
    hiredate 입사일,
    TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) "근무개월수"
FROM
    emp
;



-- 이번달 마지막 날자를 조회하세요.
SELECT LAST_DAY(SYSDATE) FROM dual;

-- 사원들의 첫번째 월급을 조회하세요. 급여지금은 매월 말일로 한다.
SELECT ename 이름, sal 급여, hiredate 입사일, LAST_DAY(hiredate) 첫급여일 FROM emp;


-- 사원들의 첫번째 월급을 조회하세요. 급여지금은 매월 1일로 한다.
SELECT ename 이름, sal 급여, hiredate 입사일, (LAST_DAY(hiredate) + 1) 첫급여일 FROM emp;

-- 이번주 일요일이 몇일인지 조회하세요
SELECT NEXT_DAY(SYSDATE, '일요일') FROM dual;

-- 올해 성탄절 이후 첫 토요일 조회
SELECT NEXT_DAY(TO_DATE('2022/12/25', 'YYYY//MM//DD'), '토요일') FROM dual;  
/*  이 경우는 날짜데이터를 입력해야 하지만 
    문자로 입력해도 실행되는 이유는 문자데이터를 날짜데이터로 변환해주는
    함수가 자동호출되어서 날짜데이터로 변환해주기 때문에 그렇다.
*/

-- 현재시간을 년도를 기준으로 반올림하세요
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:mi:ss') 현재시간,TO_CHAR(ROUND(SYSDATE, 'YEAR'), 'YYYY/MM/DD HH24:mi:ss') 반올림 FROM dual;

-- 현재시간을 월을 기준으로 반올림하세요
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:mi:ss') 현재시간,TO_CHAR(ROUND(SYSDATE, 'MONTH'), 'YYYY/MM/DD HH24:mi:ss') 반올림 FROM dual;

-- 현재시간을 일을 기준으로 반올림
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:mi:ss') 현재시간, TO_CHAR(ROUND(SYSDATE, 'DAY'), 'YYYY/MM/DD HH24:mi:ss') 반올림 FROM dual;


-----------------------------------------------------------------------------------

/*
    변환함수  
        ==> 함수는 데이터 형태에 따라서 사용하는 함수가 달라진다.
            그런데 만약 사용하려는 데이터가 함수에 필요한 데이터가 아닌 경우에는
            데이터의 형태를 변환해서 사용해야 한다.
            ==> 데이터의 형태를 바꾸어서 특정 함수에 사용 가능하도록 만들어 주는 함수

                        TO_CHAR()               TO_CHAR()
                    ----------->            <---------
         NUMBER     <---------->    CHAR    <--------->  DATE
                    <----------             ---------->
                        TO_NUMBER               TO_DATE()
                        
                        
    1. TO_CHAR()
        ==> 날짜나 숫자를 문자 데이터로 변환시켜주는 함수
        
        형식1 ]
            TO_CHAR(날짜 또는 숫자)
        
        형식2 ]  
            TO_CHAR(날짜 또는 숫자, 형식)
            ==> 바꿀 때 원하는 형태를 지정해서 문자열로 변환시키는 방법
            
            주의사항    ]
                숫자를 문자로 변환할 때 형식으로 사용하는 문자는
                9   - 무효숫자는 표현안한다.
                0   - 무효숫자도 표현한다.
            
    2. TO_DATE()
        ==> 문자로 된 내용을 날짜데이터로 변환시켜주는 함수
        
        형식1 ]
            TO_DATE(날짜 형식 문자열)
            
        형식2 ]
            TO_DATE(날짜형식 문자데이터, '변환형식'
            ==> 문자열이 오라클이 지정하는 형식의 날짜처럼 만들지 못한 경우 사용하는 방법
            
            '12/09/91'처럼 월 일 년의 순서로 문자가 만들어졌다.
            
            참고  ]
                여기에서의 변환형식이란?
                입력한 문자데이터가 어떤 의미를 가지고 만들었는지를 알려주는 기능
                
        
    3. TO_NUMBER()
        ==> 숫자형식의 문자데이터를 숫자로 변환시켜주는 함수
            문자데이터는 +, - 연산이 안된다..
            
            형식1 ]
                TO_NUMBER(문자데이터)
            
            형식2 ]
                TO_NUMBER(데이터, 변환형식))
                변환형식
                    현재 문자열이 어떤 의미로 만들어졌는지를 알려주는 기능

    4. TO_CHAR()
        ==>
        
    5. TO_CHAR()
        ==>
*/


-- TO_CHAR()
-- 사원이름, 입사일, 부서번호를 조회하세요
-- 단, 입사일은 '0000년 00월 00일'의 형식으로 조회되게 하세요.
SELECT
    ename 이름, TO_CHAR(hiredate, 'YYYY"년" MM"월" DD"일"') 입사일, deptno 부서번호
FROM emp;

-- 급여가 100~999 사이인 사원의 정보를 조회하세요.
SELECT ename 이름, sal 급여 FROM emp WHERE sal BETWEEN 100 AND 999;
SELECT ename 이름, sal 급여 FROM emp WHERE TO_CHAR(sal) LIKE '___';
SELECT ename 이름, sal 급여 FROM emp WHERE LENGTH(TO_CHAR(sal)) =3 ;

-- 사원급여를 조회하는데 앞에는 $를 붙이고 3자리마다 ,로 구분해서 조회하세요.
SELECT ename 이름, sal 급여, TO_CHAR(sal, '$9,999,999') 문자급여, TO_CHAR(sal, '$0,000,000') 문자급여2 FROM emp;


-- TO_DATE()
-- 자신이 지금까지 몇일동안 살고 있는지를 알아보자.
-- 힌트   ] 현재시간 - 생년월일
SELECT FLOOR(sysdate - TO_DATE('93/12/19')) 일, FLOOR(sysdate - TO_DATE('93/12/19'))*3 밥그릇수,
FLOOR(sysdate - TO_DATE('93-12-19')) 일
FROM dual;

SELECT sysdate - TO_DATE('12/26/1994', 'MM/DD/YYYY') from dual;
SELECT SYSDATE - TO_DATE('12161994', 'MMDDYYYY') FROM dual;


-- TO_NUMBER
-- '123'과 '456'를 더한 결과를 조회하세요
SELECT '123' + '456' 결과 FROM dual;      -- ㅣ 경우는 형변환 함수가 자동 호출이 되서 계산이 된다..

SELECT TO_NUMBER('123') + TO_NUMBER('456') 결과 FROM dual;

SELECT TO_NUMBER('1,234', '9,999') + TO_NUMBER('5,678', '9,999') 결과 FROM dual;


---------------------------------------------------------------------------------

/*
    기타 함수
    
    1. NVL()
        ==> NULL 데이터는 모든 연산(함수))에 적용되지 못한다..
            이 문제를 해결하기 위해 제시된 함수
            
            의미  ]
                NULL 데이터는 강제로 지정한 데이터로 바꾸어서
                연산,, 함수에 적용하도록 하는 함수
                
            형식  ]
                NVL(데이터, 바뀔내용)
                
            주의  ]
                지정한 데이터와 바뀔 내용은 반드시 형태가 일치해야 한다.
                
    2. NVL2()
        형식  ]
            NVL2(필드이름, 처리내용1, 처리내용2)
        
        의미  ]
            필드의 내용이 NULL이면 처리내용2를
            필드의 내용이 NULL이 아니면 처리내용1으로 처리하세요

    3. NULLIF()
        형식  ]
            NULLIF(데이터1, 데이터2)
        
        의미  ]
            두 데이터가 같으면 NULL로 처리하고
            두 데이터가 다르면 데이터1로 처리하세요..
            
    4. COALESCE()
        형식  ]
            COALESCE(데이터1, 데이터2,...)
        
        의미  ]
            나열한 데이터 중 제일 처음 NULL이 아닌 데이터를 반환
            
            
*/



SELECT ename 이름,
-- NVL(comm, 'NONE') 커미션        -- 대체할 데이터가 형태가 달라서 에러가 발생한다..
NVL(TO_CHAR(comm), 'NONE') 커미션      -- 반드시 데이터와 대체할 데이터의 형태는 일치시켜줘야 한다..
FROM emp;

-- 커미션이 있으면 급여를 급여+커미션으로 출력하고
-- 커미션이 없으면 큽여를 급여만 출력하세요..
SELECT ename 이름, NVL2(comm,sal+comm,sal) 급여
FROM emp;













/*
    문제1 ]
        comm이 존재하면
            현재 급여의 10%를 인상한 금액 + 커미션
        존재하지 않으면
            현재급여의 5%를 인상한 금액 + 100
        으로 조회하세요
        
        사원이름, 급여, 커미션, 지급급여

*/

SELECT
ename 이름, sal 급여, comm 커미션, NVL2(comm, sal*1.1 + comm, sal*1.05+100) 지급급여
FROM emp;


/*
    문제2 ]
        커미션에 50%를 추가해서 지급하고자 한다..
        만약 커미션이 존재하지 않으면,, 급여를 이용해서 10%를 지급하고자 한다..
        
        사원이름,, 급여,, 커미션,, 지급급여
    
*/

SELECT
ename 이름, sal 급여, comm 커미션, NVL2(comm, comm*1.5, sal*1.1) 지급커미션
FROM emp;



----------------------------------------------------------------------------------------------------

/*
    조건 처리 함수
        ==> 함수라기 보다는 오히려 명령에 가깝다
            자바의 switch~case, if 를 대신하기 위해서 만들어 둔것
            
        1. DECODE : switch~case 명령에 해당하는 함수
        
            형식  ]
                DECODE(필드이름,, 값1, 처리내용1,
                                    값2, 처리내용2, 
                                    ... 처리내용n)
                                    
            의미  ]
                필드의 내용이
                    값1과 같으면 처리내용1을
                    값2와 같으면 처리내용2를 ...
                    이외의 값은 처리내용을 조회한다..
                    
            주의  ]
                DECODE 함수내에서는 조건식을 사용할 수 없다..
                
                
                
        2. CASE : IF 명령에 해당하는 명령
        
            형식1  ]
                CASE WHEN 조건식1 THEN 내용1
                    WHEN 조건식2 THEN 내용2
                    WHEN 조건식3 THEN 내용3
                    ...
                    ELSE 내용
                END
            
            의미  ]
                조건식1이 참이면 내용1을
                조건식2가 참이면 내용2를 ...
                그 이외는 내용을 실행한다.
                    
            형식2 ]
                CASE 필드이름 WHEN 값1 THEN 실행내용1
                                WHEN 값2 THEN 실행내용2
                                WHEN 값3 THEN 실행내용3
                                ...
                                ELSE 실행내용
                END
            
            의미  ]
                DECODE 함수와 동일한 의미
                묵시적으로 동등비교만 사용하는 명령이다..
                
                                
                                
                                

*/



/*
    사원이름, 직급, 부서번호,, 부서이름
    부서이름은
        부서번호가 10이면 회계부
                    20이면 연구부
                    30이면 영업부
                    나머지는 관리부
        로 처리
*/

SELECT
ename 이름, job 직급, deptno 부서번호,
DECODE(deptno, 10, '회계부', 20, '연구부' , 30, '영업부', '관리부') 부서이름
FROM
emp;



--급여가 1000미만이면 20% 인상하고
--      1001~3000 미만이면 15%를 인상하고
--      3000이상이면 10%를 인상하여
--  사원이름 직급 급여 인상급여를 조회하세요


SELECT
ename 이름, job 직급, sal 급여,
CASE WHEN sal < 1000 THEN sal*1.20
    WHEN sal < 3000 THEN sal*1.15
    ELSE sal*1.1
    END 인상급여
FROM emp;

--------------------------------------------------------------------------

/*
    그룹함수
        ==> 여러행의 데이터를 하나로 만들어서 뭔가를 계산하는 함수
        
        중요  ]
            그룹합수는 결과가 오직 한개만 나오게 된다..
            따라서 그룹함수는 결가가 여러개 나오는 경우와 혼용해서 사용할 수 없다..
            오직 결과가 한줄로만 나오는 것과만 혼용할 수 있다..
            
        1. SUM()
            ==> 데이터의 합계 구해주는 함수
            
            형식  ]
                SUM(필드이름))
        
        2. AVG()
            ==> 데이터의 평균을 구하는 함수
            
            형식  ]
                AVG(필드이름)
        
        3. COUNT()
            ==> 데이터들의 갯수를 구해주는 함수
                지정한 필드 중에서 데이터가 존재하는 필드의 갯수를 알려주는 함수
        
            형식  ]
                COUNT(필드이름)
            참고  ]
                필드이름 대신 * 를 사용하면 각각의 필드들의 카운터를 따로 구한 후 
                결과 중에서 가장 큰 값을 알려준다..
        
        4. MAX/MIN()
            ==> 저정한 필드의 데이터 중에서 최대값과 최소값을 알려주는 함수
        
        ---- 잘 안씀----
        5.STDDEV
            ==> 표준편차를 구해주는 함수
        
        6. VARIANCE
            ==> 분산을 구해주는 함수
        
        

*/


-- 사원들의 급여의 합계를 조회하세요

SELECT SUM(sal) 총급여, MAX(sal) 최대급여, MIN(sal) 최소급여, AVG(sal) 급여평균, COUNT(sal) 사원수
FROM emp;


SELECT AVG(comm) FROM emp;


-----------------------------------------------------------------------------------

/*
    
    
    형식  ]
        
        SELECT
            그룹함수, 그룹기준필드
        FROM
            테이블이름
        [WHERE]
            조건식
        GROUP BY
            필드이름
        [HAVING]    -- GROUP BY의 조건절
            조건
        ORDER BY
            필드이름...
            
    참고  ]
        GROUP BY를 사용하는 경우에는
        GROUP BY에 적용된 필드는 같이 조회할 수 있다..
        
    HAVING
        ==> 그룹화 한 경우 계산된 그룹중에서 출력에 적용될 그룹을 지정하는
        조건식을 기술하는 절
        
            참고  ]
                WHERE 조건절은 계산에 포함된 데이터를 선택하는 조건절
                HAVING 조건절은 그룹화해서 계산한 후 출력할지 말지를 결정하는 조건절
*/


--직급별 급여평균을 직급명과 함께 조회하세요

SELECT
    job 부서이름, AVG(sal) 평균급여
FROM emp
GROUP BY job;

/*
 부서별 최대급여를 조회
 부서번호가
    10은 회계부
    20은 연구부
    30은 영업부
    그이외는 관리부
    
    부서번호, 부서이름, 부서최대급여 를 조회하세요
*/


SELECT
deptno 부서번호,
DECODE(deptno, 10, '회계부', 20, '연구부', 30, '영업부', '관리부') 부서이름,
MAX(sal) 부서최대급여
FROM emp
GROUP BY deptno;


-- 부서별 평균 급여를 조회하세요.. 단, 부서평균 급여가 2000 이상인 부서만 조회되게 하세요..

SELECT
deptno 부서번호,
DECODE(deptno, 10, '회계부', 20, '연구부', 30, '영업부', '관리부') 부서이름,
AVG(sal) 부서최대급여
FROM emp
GROUP BY deptno
HAVING AVG(sal) >= 2000;



-- 직급별 사원수를 조회하세요
-- 단 사원수가 1명인 직급은 조회되지 않게 하세요..

SELECT
job 직급, COUNT(*) 사원수
FROM
emp
GROUP BY
job
HAVING
COUNT(*) > 1;





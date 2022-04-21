-- day 02


/*
    참고 ] 
        오라클이 데이터를 보관하는 방법
            테이블(Entity, 개체) 단위로 데이터를 보관한다.
                ERD - Entity Relation Diagram
                    테이블 간의 관계를 도식화 한 다이어그램
        
                오라클은 테이블들 간의 관계를 형성해서 데이터를 저장한다.
                이런 종류의 데이터베이스 관리시스템을
                    RDBMS - 개체들의 관계를 형성해서 데이터를 관리하는 시스템
                            관계형 데이터베이스 관리시스템
        
        테이블이란 필드와 레코드(ROW, 행)로 구성된 데이터를 보관하는 가장 작은 단위
        
        필드      : 같은 개념의 데이터 모임(칼럼, 열, 칸, ...)
        레코드    : 같은 목적을 가진 데이터 모임(행, 로우, ...)
        
        참고로 필드에는 그 항목을 구분하기 위한 이름이 부여되어 있다.
        이것을 우리는 필드이름이라고 부른다.
        하지만 레코드는 각 행을 구분하는 방법이 존재하지 않는다. 
        

    참고  ]
        우리가 오라클에 접속하게되면 오라클이 접속자에게 메모리를 할당해준다.
        이때 이 메모리가 할당된 상태를 '세션이 하나 열렸다' 라고 표현한다.
        오라클에서는 접속을 세션으로 표현한다.
        
        오라클에서는 같은 계정으로 여러 컴퓨터에서 동시에 접속할 수 있다.
        이 때 확보된 메모리 공간은 서로 공유가 안된다.
        
        따라서 접속한 사람은 확보한 공간에서만 작업(DML 명령)을 하게되고
        최종적으로 데이터베이스에 적용시키는 작업은 별도로 명령을 해야한다. (TCL 명령)
*/


-- 내가 접속한 계쩡안에 테이블 이름들을 조회해보자.

SELECT
    tname
FROM
    tab;

-- 참고 ] 
--      오라클은 명령과 테이블이름, 필드이름 을 구분하는데 대소문자를 구분하지 않는다.
--      주의 ] 데이터는 대소문자를 구분해야 한다.

-------------------------------------------------------------------------------------------------

/*
    조회된 데이터 중 중복된 데이터를 한번만 조회되도록 하는 방법
    ==> 같은 데이터는 한번만 출력되도록 하는 방법

    주의사항 ]
        이 명령은 질의명령에서 한 번만 사용해야 하고
        조회된 데이터의 각 행들이 같은 경우에만 적용된다.
        ==> 각 필드의 데이터들 마저 동일해야 중복된 데이터로 간주한다.
        
        형식 ]
            SELECT
                DISTINCT 칼럼이름
            FROM
                테이블이름
            ;
*/

    
-- 사원들의 직급을 조회하세요. 단, 중복된 직읍은 한번만 출력되도록 하세요.
SELECT DISTINCT
    job,
    ename
FROM
    emp;

SELECT DISTINCT
       DEPTNO
FROM emp;

SELECT COUNT(COMM) "comm 받는 사람"
	FROM emp;






    
-- 사원들의 직급, 부서번호를 조회하는데 중복된 데이터는 한번만 출력되도록 하세요.

SELECT DISTINCT
    job,
    deptno
FROM
    emp;
    
/*
    참고 ]
        원칙적으로 데이터를 조회할 때는 조회할 필드의 이름을 정확하게 나열해서 조회하는 것이 원칙
        간혹 모든정보(모든 필드)를 보고싶은 경우에
        필드이름을 나열하는 대신 ' * ' 기호를 사용해서 대신하는 경우가 있다.
        
        하지만 실무에서는 절대로 사용하면 안되는 방법. (민감한 데이터를 꺼내오는 순간이 생김)


------------------------------------------------------------------------------------------------------

    질의 명령 안에 연산식을 포함할 수 있다.
    연산삭이 포함되면 연산된 결과가 출력된다.
    이 때 출력되는 필드의 이름은 연산식이 된다.
    
*/  

-- 사원들의 이름, 급여, 10% 인상된 급여를 조회하세요.
SELECT
    ename     AS 사원이름,
    sal       AS 원급여,
    sal * 1.1 "인상 급여"
FROM     -- 공백이 포함된 별칭은 반드시 큰따옴표로 감싸준다.
    emp;
    
/*
    참고  ]
        DUAL 테이블
        ==> 우리가 조회하게되면 테이블의 저장된 데이터 중에서
            필터링이 되어서 그 결과를 가지고 보여주게 된다.
            그런데 데이터 자체를 조회하게되면 (SELECT 절에 데이터를 나열하면..)
            조회되는 데이터는 아마도 필터링 된 데이터 갯수만큼 출력이 될 것이다.
        
            이 때 간단한 계산식의 결과만 원하는 경우는 이렇게 조회하면 불편할 것이다.
        
            따라서 이런 경우에 사용할 수 있도록 만들어서 제공하는 테이블이 있는데
            그 테이블이 dual 테이블이다.
            
            하지만 이 테이블은 물리적으로 저장되어 있는 테이블은 아니다.
            오라클 시스템 자체가 제공해주는 가상의 테이블이다.
            
            이 테이블은 한개의 row만 가지고 있는 테이블이다.
*/

SELECT
    '지수'
FROM
    emp;
-- 이 질의명령은 각 데이터에서 '지수'를 조회해 달라는 명령과 같은 의미


-- 현재 시간을 조회해보세요.
SELECT
    sysdate
FROM
    dual;
    
/*
    참고  ]
        시스템의 현재시간을 반환해주는 연산자.
            sysdate
    
    참고  ]
        오라클에서는 자바와 마찬가지로 날짜와 시간은 분리해서 기억하지 않는다.
*/


/*
    오라클에서 사용하는 산술 연산자
    + - * /
*/

SELECT
    10 / 3
FROM
    dual; -- 오라클에서는 정수의 연산결과가 실수가 될 수 있다.
    
-------------------------------------------------------------------------------------------

/*
    NULL 데이터
    ==> 필드 안에는 데이터가 보관되어야 하는데 없는 정보는 데이터가 없을 수 있다.
    이처럼 필드의 데이터가 없는 상태를 NULL 데이터라 한다.
    
    주의  ]
        NULL 데이터는 모든 연산에서 제외된다.
        ==> NULL데이터로 연산하는 데이터는 조회에서 제외가 된다.
        
        
    ***
    참고  ]
        NVL 함수
            형식  ]
                NVL(필드이름(또는 필드계산식), 대신할데이터)
                
            의미  ]
                NULL 데이터를 강제로 특정 데이터로 바꾸어주는 명령
                따라서 특정데이터로 변경하게되면 연산에 포함될 수 있다.
        
*/

-- 사원들의 상사번호에 1000을 추가해서 사원이름, 상사번호를 조회하세요
SELECT
    ename,
    mgr + 1000 상사번호
FROM
    emp;
    
-- 사원들의 연봉을 계산해서 사원이름, 입사일, 연봉을 조회하세요.
-- 연봉은 급여 * 12 + 커미션, 커미션이 없는 사원은 0으로 계산하세요
SELECT
    ename               사원이름,
    hiredate            입사일,
    ( sal * 12 + comm ) 연봉
FROM
    emp;
    
-- NVL 함수사용
SELECT
    ename                       사원이름,
    hiredate                    입사일,
    ( sal * 12 + nvl(comm, 0) ) 연봉
FROM
    emp;

SELECT
    ename                          사원이름,
    hiredate                       입사일,
    nvl(sal * 12 + comm, sal * 12) 연봉     -- comm이 null이면 앞부분이 null이 되니까 sal*12로 채워넣는다.
FROM
    emp;
    
    
---------------------------------------------------------------------------------


/*
    결합연산자 ==> 결합된 결과는 문자열로 만들어진다.
    ==> 오라클 역시 문자열을 결합하여 출력할 수 있다.
    이때는 두개의 필드를 결합할 수도 있고 데이터를 결합할 수도 있다.
*/

SELECT
    10 || 20
FROM
    dual;
    
-- 사원번호와 사원이름을 조회하는데 형식은 사원번호 - 사원이름 의 형식으로조회하세요
SELECT
    empno
    || ' - '
    || ename 사원
FROM
    emp;
    
    
-- 사원번호, 사원이름을 조회하는데
--      0000번, 홍길동 님
-- 의 형식으로 조회하세요.

SELECT
    empno || '번'  사원번호,
    ename || ' 님' 사원이름
FROM
    emp;
    
    

/* 
    조건조회
    형식 ]
            SELECT
                필드이름들...
            FROM
                테이블이름
            WHERE
                조건식

    참고  ]
        NULL 검색
        ==> NULL 데이터는 모든 연산에서 제외된다.
            따라서 비교연산자로 NULL데이터를 비교할 수 없다.
            
            따라서 NULL데이터의 비교는 IS NULL
*/


-- 커미션이 없는 사원들이 이름, 급여, 커미션을 조회하세요.

SELECT
    ename,
    sal,
    comm
FROM
    emp
WHERE
    comm = NULL;

SELECT
    ename,
    sal,
    comm
FROM
    emp
WHERE
    comm IS NULL;
    
-- 커미션이 있는 사원들의 사원번호, 사원이름, 급여, 커미션을 조회하세요. 
-- 단, 커미션은 100을 추가해서 조회하세요.
SELECT
    empno      사원번호,
    ename      사원이름,
    sal        급여,
    comm       원커미션,
    comm + 100 커미션
FROM
    emp
WHERE
    comm IS NOT NULL;       -- NOT comm IS NULL 도 가능
    
    
----------------------------------------------------------------------------

/*
    조회된 결과 정렬하기
    ==> 원칙적으로 데이터베이스는 종류에 따라 나름의 기준을 가지고 데이터를 조회한다.
    (반드시 입력 순서대로 조회되는 것은 아니다.)
    
    오라클은 내부적으로 인덱스를 이용해서 출력순서를 조절하고 있다.
    ==> 출력 순서는 모를 수 있다.
    
    조회된 결과를 원하는 순서대로 정렬하도록 지정해야 한다.
    
    형식  ]
        SELECT
            필드 이름
        FROM
            테이블 이름
        WHERE
            조건식
        ORDER BY
            필드이름 [ASC || DESC], 필드이름 [ASC || DESC], ...;
            
        참고  ]
            ASC     : 오름차순 정렬
            DESC    : 내림차순 정렬
*/

-- 사원의 이름, 직급, 입사일을 조회하세요.
-- 단, 이름을 내림차순 정렬해서 조회하세요.

SELECT
    ename    이름,
    job      직급,
    hiredate 입사일
FROM
    emp
ORDER BY
    ename DESC;
     
-- 위 문제를 입사일 기준 오름차순 정렬해서 조회하세요

SELECT
    ename    이름,
    job      직급,
    hiredate 입사일
FROM
    emp
ORDER BY
    hiredate --ASC
    ;
    

/*
    참고  ]
        정렬할 때 오름차순 정렬의 경우 ASC를 생략해도 된다.
*/

-- 사원들의 사원이름, 급여, 부서번호 를 조회하고, 부서번호 기준 오름차순 정렬
-- 같은 부서의 경우 급여가 많은 사람이 먼저 출력되게 하세요.
SELECT
    ename  사원이름,
    sal    급여,
    deptno 부서번호
FROM
    emp
ORDER BY
    deptno,
    sal DESC;       
    -- 부서번호, 급여 DESC; 조회된 결과를 가지고 정렬하는 것이므로 별칭으로 정렬명령을 써도 된다.
    
/*
    정렬은 윗 절들의 실행 결과를 가지고 정렬을 하게 된다.
    
    따라서 ORDER BY 절은 다른 절들의 이후에 기술되어야 한다.
*/

/*
    문자열의 길이를 알려주는 함수
    LENGTH() - 문자열의 문자열 수를 반환해주는 함수
*/

-- 사원이름, 직급, 급여를 조회하세요
-- 단, 이름 길이가 짧은 사람이 먼저 출력되게 하고, 같은 길이면 오름차순 정렬하세요.
SELECT
    ename 이름,
    job   직급,
    sal   급여
FROM
    emp
ORDER BY
    length(ename),
    ename;

SELECT
    length('윤아')  문자수,
    lengthb('윤아') 바이트수
FROM
    dual;
    
    ----------------------------------------------------
/*
    집합연산자
    ==> 두 개 이상의 SELECT 질의 명령을 이용해서
    그 결과의 집합을 얻어내는 방법
    
    형식  ]
        SELECT
        집합연산자
        SELECT;
        
    종류  ]
        UNION
            ==> 합집합의 개념
                두 가지 질의 명령의 결과를 하나로 합쳐서 조회한다.
        UNION ALL
            ==> 합집합의 개념
                단, UNION 과 다른점은 
                UNION은 중복데이터를 한번만 출력하는데
                UNION ALL은 중복데이터를 모두 출력한다.
        INTERSECT
            ==> 교집합의 개념
                조회 질의명령의 결과 중 양쪽 모두 존재하는 결과만 출력해준다.
        MINUS
            ==> 차집합의 개념
                앞의 질의명령 결과에서
                뒤의 질의명령의 결과에 포함된 데이터를 뺀 결과를 출력해준다.
    
    참고  ]
        공통적인 특징
            1. 두 질의명령에서 나온 결과는 같은 필드의 갯수를 가져야 한다.
            2. 두 질의명령의 결과는 같은 형태의 필드이면 된다.(타입만 같으면 된다)
  
    되도록 안쓰는것이 좋다.      
*/


SELECT
    ename 사원이름,
    sal   급여
FROM
    emp
UNION
SELECT
    job  직급,
    comm 커미션
FROM
    emp;
    
    
-------------------------------------------------------------------------------------


/*
    함수(Function)
    ==> 데이터를 가공하기 위해 오라클이 제시한 명령들.. 또는 개체..
    
        참고  ]
            DBMS는 데이터베이스 벤더들 마다 다르다.
            그런데 함수 부분은 DBMS들 마다 매우 다르다.
            
        오라클 함수 종류
            1. 단일행 함수
                ==> 한줄 한줄마다 매번 명령이 실행되는 함수
                
            2. 그룹함수
                ==> 여러행이 모여서 한번만 실행되는 함수
                따라서 그룹 함수는 출력 갯수가 오직 한개이다.
*/


-- 사원들의 사원이름, 이름의 문자수를 조회하세요.

SELECT
    ename         사원이름,
    length(ename) 이름문자수
FROM
    emp;
    
-- 10번 부서의 사원들의 사원수를 조회하세요.
SELECT
    COUNT(*) 사원수
FROM
    emp
WHERE
    deptno = 10;

-- 커미션이 없는 사원들의 수를 조회하세요.
SELECT
    COUNT(*) "커미션 없는 사원 수"
FROM
    emp
WHERE
    comm IS NULL;

-- null 데이터는 모든 연산에서 제외된다.
-- 따라서 함수에서도 제외가 된다.
SELECT
    ( COUNT(*) - COUNT(comm) ) "커미션 없는 사원 수"
FROM
    emp;

    
    
-----------------------------------------------------------------------------------
/*
    단일행 함수
    
    숫자 <---------------> 문자 <---------------> 날짜
    
    1. 숫자함수
        ==> 데이터가 숫자인 경우에만 사용할 수 있는 함수
            1) ABS()        - 절대값
                형식  ]
                    ABS(데이터 또는 필드 또는 연산식)
            2) ROUND()      - 반올림해주는 함수
                형식  ]
                    ROUND(데이터 또는 필드 또는 연산식, 자릿수)
            3) FLOOR()      - 버림함수, 소수점 이하를 무조건 버림
                형식  ]
                    FLOOR(데이터 또는 필드 또는 연산식)
            4) TRUNC()      - 자리수 이하 버림함수, 자리수를 지정해서 버림가능
                형식  ]
                    TRUNC((데이터 또는 필드 또는 연산식, 자릿수)
                    자릿수는 소수이하 자릿수를 의미하고 음수형태로 입력하면 소수이상 자릿수를 의미.
            5) M0D()        - 나머지 구하는 함수
                형식  ]
                    MOD(데이터, 나눌 수)
        
    2. 문자함수
        
    3. 날짜함수
    
    
    참고  ]
        CLOB    - 문자데이터를 4기가까지 저장할 수 있는 타입
        BLOB    - 바이너리코드를 4기가까지 저장할 수 있는 타입
            문자열 데이터타입의 최대 크기는 4KB이다.



*/

SELECT
    abs(- 3.14) pi
FROM
    dual;

SELECT
    round(- 3.14, 1) pi
FROM
    dual;

SELECT
    floor(- 3.14) pi
FROM
    dual;

SELECT
    trunc(- 3.14) pi
FROM
    dual;

SELECT
    mod(10, 3) pi
FROM
    dual;


-- 사원들의 급여를 15% 인상한 급여를 조회하세요
-- 단, 소수 첫째자리에서 반올림하여 조회하세요.
SELECT
    ename                  사원,
    sal                    원급여,
    sal * 1.15             계산값,
    round(sal * 1.15, - 2) 인상급여,
    floor(sal * 1.15)      버림함수,
    trunc(sal * 1.15, - 2) 자릿수버림
FROM
    emp;
    
    
-- 급여가 짝수인 사원만 출력하세요.
SELECT
    ename,
    job,
    sal
FROM
    emp
WHERE
    mod(sal, 2) = 0;
    
    
--------------------------------------------------------------------

/*
    2. 문자 처리함수
        1. LOWER()                  : 소문자로 변환
        2. UPPER()                  : 대문자로 변환
        3. INITCAP()                : 각 단어의 첫문자가 대문자로 나머지는 소문자로 변환해주는 함수
        4. LENGTH() / LENGTHB()     : 문자열의 문자수 / 바이트수 반환
            형식  ]
                LENGTH(문자열데이터)
                LENGTHB(문자열데이터)
        5. CONCAT()                 : || 결합연산자와 같은 기능
            형식  ]
                CONCAT(데이터1, 데이터2)
        6. SUBSTR() / SUBSTRB()     : 문자열 중에서 특정위치의 문자열만 따로 추출해서 반환해주는 함수
            형식  ]
                SUBSTR(데이터, 시작위치, 꺼낼 갯수)
                주의사항 : 위치값는 데이터베이스에서는 1부터 시작한다.
                
            참고  ]
                갯수는 생략할 수 있다. 이 때 꺼내오는 갯수는 문자열의 끝부부까지 꺼내오게 된다.
                시작위치를 음수로 기입하는 경우는 문자열의 뒤에서부터 자릿수를 의미한다.
        7. INSTR() / INSTRB() : 문자열 중에서 원하는 문자열이 몇번째 글자에 있는지를 알아내주는 함수
            형식  ]
                INSTR(데이터1, 데이터2, 시작위치, 출현 횟수) - 시작위치, 출현횟수 생략가능
        
        8. LPAD() / RPAD()  : 문자열의 길이를 지정한 후 
                              문자열을 만드는데 남는 공간은 지정한 문자로 채워서
                              문자열을 만들어주는 함수
                              
                              차이점은 남는 공간을 채울때
                                왼쪽으로 채우려면 LPAD
                                오른쪽으로 채우려면 RPAD
            형식  ]
                LPAD(데이터, 만들길이, '채울문자')
        

*/

SELECT
    lower(ename)        소문자이름,
    upper(lower(ename)) 대문자이름,
    initcap(ename)      "첫글자만 대문자"
FROM
    emp;

SELECT
    initcap('hello iu')
FROM
    dual;  -- 각 단어의 첫문자가 대문자로 바뀜

-- 사원들이 이름, 직급, 급여를 조회하는데
-- 출력형식을
--  Mr.이름, ---직급. --- 달러 형식으로 출력하세요.

SELECT
    concat('Mr.', ename) 사원이름,
    concat(job, ' 직급')   직급,
    concat(sal, ' 달러')   급여
FROM
    emp;

SELECT
    substr('Hello IU', 1, 5)
FROM
    dual;

SELECT
    substr('Hello IU', - 3, 5)
FROM
    dual;

SELECT
    instr('Hello IU', 'l', 1, 1)
FROM
    dual;


-- 사원이름을 조회하는데 이름을 10글자로 만들어서 표현하세요.
SELECT
    lpad(ename, 10, '*') "오른쪽 정렬",
    rpad(ename, 10, '*') "왼쪽 정렬"
FROM
    emp;


-----------------------------------------------------------------------------------

--사원들의 이름을 앞 두글자만 표시하고 나머지는 *로 표시하세요.

SELECT
    substr(ename, 1, 2)                           앞두글자,
    rpad(substr(ename, 1, 2), length(ename), '*') 꺼내온이름,
    ename                                         이름
FROM
    emp;

-------------------------------------------------------------------------------------
/*
    문제 1
        사원이름이 5글자 이하인 사원들의
        사원번호, 사원이름, 사원이름 글자수, 직급, 급여를 조회하세요
        
        출력은 글자수가 작은 사원의 이름순으로 정렬해서 조회하세요

*/
SELECT
   empno 사원번호, ename 사원이름, LENGTH(ename) 사원이름글자수, job 직급, sal 급여
FROM
emp
WHERE
LENGTH(ename) < 6
ORDER BY
LENGTH(ename),ename;


/*
    문제 2
        사원이름 뒤에 ' 사원' 을 붙여서 
        사원이름 직급 입사일을 조회하세요

*/

SELECT
CONCAT(ename, ' 사원') 사원이름, job 직급, hiredate 입사일
FROM
emp;


/*
    문제 3
        사원이름의 마지막 글자가 'N'인 사원들의
        사원이름 입사일 부서번호를 조회하세요
        정렬은 부서번호 순으로 하고 같은부서는 이름순으로 정렬해서 조회하세요

*/

SELECT
ename 사원이름, hiredate 입사일, deptno 부서번호
FROM
emp
WHERE
SUBSTR(ename,-1,1) = 'N'
ORDER BY
deptno,ename;

/*
    문제 4
        사원이름 중 'A'가 존재하지 않는 사원의 정보를 조회하세요

*/
SELECT
ename 사원이름
FROM
emp
WHERE
INSTR(ename, 'a', 1)=0;


/*
    문제 5
        사원이름 중에서 뒤 두글자만 남기고 앞글자는 모두 '#'으로 대체해서
        사원이름 입사일 급여를 조회하세요

*/
SELECT
LPAD(SUBSTR(ename,-2,2),LENGTH(ename),'#') 사원이름, hiredate 입사일, sal 급여
FROM
emp;

/*
    문제 6
        'dlwlrma@githrd.com' 이라는 메일에서
        아이디부분은 세번째 문자만 표시하고
        나머지 문자는 '*'로 대체하고
        @는 표시하고
        .com 도 표시하고 나머지는 '*'로 대체해서 조회되는 질의명령을 작성하세요
        
*/

SELECT
CONCAT(CONCAT('**',RPAD(SUBSTR('dlwlrma@githrd.com',3,1),INSTR('dlwlrma@githrd.com','@')-3,'*')), LPAD(SUBSTR('dlwlrma@githrd.com',-4,4),LENGTH('dlwlrma@githrd.com')-INSTR('dlwlrma@githrd.com','@'),'*'))

--
--LPAD(SUBSTR('dlwlrma@githrd.com',3,1),3,'*') || LPAD(SUBSTR('dlwlrma@githrd.com',4,LENGTH('dlwlrma@githrd.com')-INSTR('dlwlrma@githrd.com','@')-3-1)) 메일
FROM
dual;


SELECT
LPAD(SUBSTR('dlwlrma@githrd.com',3,1),3,'*') "3글자 추출",
INSTR('dlwlrma@githrd.com','@') - 1 "ID 길이",
RPAD(LPAD(SUBSTR('dlwlrma@githrd.com',3,1),3,'*'),INSTR('dlwlrma@githrd.com','@') - 1,'*') "ID 완성",

SUBSTR('dlwlrma@githrd.com',-4) ".com 추출",
LPAD(SUBSTR('dlwlrma@githrd.com',-4),LENGTH(SUBSTR('dlwlrma@githrd.com',INSTR('dlwlrma@githrd.com', '@')+ 1)),'*') "메일주소 추출",
CONCAT('@', LPAD(SUBSTR('dlwlrma@githrd.com',-4),LENGTH(SUBSTR('dlwlrma@githrd.com',INSTR('dlwlrma@githrd.com', '@')+ 1)),'*')) "메일주소 완성",

CONCAT(RPAD(LPAD(SUBSTR('dlwlrma@githrd.com',3,1),3,'*'),INSTR('dlwlrma@githrd.com','@') - 1,'*'), CONCAT('@', LPAD(SUBSTR('dlwlrma@githrd.com',-4),LENGTH(SUBSTR('dlwlrma@githrd.com',INSTR('dlwlrma@githrd.com', '@')+ 1)),'*'))) "완성"

FROM
dual;

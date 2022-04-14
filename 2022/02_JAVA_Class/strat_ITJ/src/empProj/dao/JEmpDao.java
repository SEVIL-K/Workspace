package empProj.dao;
/*
    Created by HG on 2022-04-13

    이 클래스는 JEmp 테이블에 관련된 데이터베이스 작업만 전담으로 처리해주는 기능들을 모아둔 클래스

*/

import empProj.db.ScottJDBC;
import empProj.sql.JEmpSQL;
import empProj.vo.EmpVO;

import java.sql.*;

public class JEmpDao {
    private ScottJDBC db;

    private Connection con;
    private Statement stmt;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private JEmpSQL jSQL;


    public JEmpDao() {
        db = new ScottJDBC();
        jSQL = new JEmpSQL();
    }

    // jemp 테이블 생성여부 조회 전담 처리함수
    public int tabCnt() {
        // 반환값 변수
        int cnt = 0;

        // 할 일

        // 1. 커넥션 꺼내기
        con = db.getCON();

        // 2. 질의명령 꺼내오기
        String sql = jSQL.getSQL(jSQL.SEL_TNAME);

        // 3. 명령전달도구 꺼내오기
        stmt = db.getSTMT(con);

        try {
            // 4. 질의명령 보내기
            rs = stmt.executeQuery(sql);

            // 5. 데이터 꺼내서 변수에 담기
            rs.next();      // 가상 레코드포인터 한 줄 내리기
            cnt = rs.getInt("cnt");
            System.out.println("### JEmp 테이블 체크 완료 ###");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(rs);
            db.close(stmt);
            db.close(con);
        }
        // 6. 반환해주기
        return cnt;
    }




    // emp 테이블을 구조만 복사해서 jemp 테이블을 만들기 전담 함수
    public void addJEmp() {
        // 할 일

        // 1. 커넥션 꺼내기
        con = db.getCON();

        // 2. 질의명령 꺼내오기
        String sql = jSQL.getSQL(jSQL.ADD_TABLE);

        // 3. 명령전달도구 꺼내오기
        stmt = db.getSTMT(con);

        // 4. 질의명령 보내기
        try {
            stmt.execute(sql);
            System.out.println("### JEmp 테이블 생성 성공 ###");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(stmt);
            db.close(con);
        }
    }


    // 이름, 직급, 부서번호를 jemp 테이블에 추가해주는 함수
    public int insertJemp(EmpVO eVO) {
        // 할 일
        // 반환값 변수
        int cnt = 0;

        // 1. 커넥션 꺼내기
        con = db.getCON();

        // 2. 질의명령 꺼내오기
        String sql = jSQL.getSQL(jSQL.INSERT_JEMP);

        // 3. 명령전달도구 꺼내오기
        pstmt = db.getPSTMT(con, sql);


        try {
            // 4. 질의명령 완성하기
            String name = eVO.getEname();
            String job = eVO.getJob();
            int dno = eVO.getDno();

            pstmt.setString(1, name);
            pstmt.setString(2, job);
            pstmt.setInt(3, dno);

            // 5. 질의명령 보내기 , 반환값 받기 -- 변경된 행 수를 반환해준다.
            cnt = pstmt.executeUpdate();
            /*
                executeUpdate() 는 반환값 타입이 int 이고
                반환값의 의미는 테이블의 변경된 행 수를 의미한다.
             */
            System.out.println("### 정보 입력 성공 ###");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(pstmt);
            db.close(con);
        }

        return cnt;
    }


    // 마지막에 추가된 데이터 조회 -- empno 를 이용함
    public EmpVO getLast() {
        // 할 일

        // 반환값 변수
        EmpVO eVO = new EmpVO();

        // 1. 커넥션 꺼내기
        con = db.getCON();

        // 2. 질의명령 꺼내오기
        String sql = jSQL.getSQL(jSQL.SEL_LAST);

        // 3. 명령전달도구 꺼내오기
        stmt = db.getSTMT(con);

        // 4. 질의명령 보내기
        try {
            rs = stmt.executeQuery(sql);

            // 5. 꺼내서 VO에 넣어주기
            // 가상 레코드포인터 한줄 내리기
            rs.next();

            // 데이터 꺼내기
            int eno = rs.getInt("eno");
            String name = rs.getString("name");
            String job = rs.getString("job");
            Date hdate = rs.getDate("hdate");
            Time htime = rs.getTime("hdate");
            int dno = rs.getInt("dno");

            // 데이터 VO에 넣어주기
            eVO.setEno(eno);
            eVO.setEname(name);
            eVO.setJob(job);
            eVO.setHdate(hdate);
            eVO.setHtime(htime);
            eVO.setSdate();
            eVO.setDno(dno);

            System.out.println("### 마지막에 입사한 사원 데이터 조회 성공 ###");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(rs);
            db.close(stmt);
            db.close(con);
        }

        return eVO;
    }


    // 30번 사원들 백업 전담 처리함수
    public int backupDno30() {
        // 반환값 변수
        int cnt = 0;

        // 1. 커넥션 꺼내기
        con = db.getCON();

        // 2. 질의명령 꺼내오기
        String sql = jSQL.getSQL(jSQL.INSERT_JEMP_D30);

        // 3. 명령전달도구 꺼내오기
        stmt = db.getSTMT(con);


        try {
            // 4. 질의명령 보내고 결과 받기
            cnt = stmt.executeUpdate(sql);

            System.out.println("### 30번부서 사원정보 백업 성공 ###");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(stmt);
            db.close(con);
        }

        return cnt;
    }

    public int delDno30() {
        // 반환값 변수
        int cnt = 0;

        // 1. 커넥션 꺼내기
        con = db.getCON();

        // 2. 질의명령 꺼내오기
        String sql = jSQL.getSQL(jSQL.DEL_JEMP_D30);

        // 3. 명령전달도구 꺼내오기
        stmt = db.getSTMT(con);


        try {
            // 4. 질의명령 보내고 결과 받기
            cnt = stmt.executeUpdate(sql);

            System.out.println("### 30번부서 사원정보 삭제 성공 ###");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(stmt);
            db.close(con);
        }

        return cnt;
    }

}

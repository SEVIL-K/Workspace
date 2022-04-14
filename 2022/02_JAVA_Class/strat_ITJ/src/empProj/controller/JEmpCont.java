package empProj.controller;
/*
    Created by HG on 2022-04-13
    
*/

import empProj.dao.JEmpDao;
import empProj.vo.EmpVO;

public class JEmpCont {
    private JEmpDao jDao;

    public JEmpCont() {
        jDao = new JEmpDao();

        // jemp 테이블이 없는 경우에는 테이블을 생성하고 이미 있는 경우에는 건너뛰자.

        int cnt = jDao.tabCnt();

        if (cnt == 0) {
            addTable();
        } else if (cnt == 1) {
            System.out.println("### 이미 생성된 테이블입니다. ###");
        }



        // 데이터를 추가해보자. 이름, 직급, 부서번호
        String name = "JENNIE";
        String job = "MANAGER";
        int dno = 40;

        // vo 만들기
        EmpVO eVo = new EmpVO();

        // 데이터 채우기
        eVo.setEname(name);
        eVo.setJob(job);
        eVo.setDno(dno);

        // 데이터베이스 작업 함수 호출
        int result = jDao.insertJemp(eVo);
        if (result == 1) {
            System.out.println("### " + name + " 사원의 데이터 입력 성공 ###");
        } else {
            System.out.println("### " + name + " 사원 데이터 입력을 실패했습니다 ###");
        }


        // 추가된 사원의 정보를 조회해서 출력하세요. -- MAX empno 조회하면 될듯
    }

    // emp 테이블을 복사해서 jemp 테이블을 반드세요
    public void addTable() {
        // 할 일
        // 1. dao 의 함수 호출만 해주면 된다.
        jDao.addJEmp();
    }

    public static void main(String[] args) {
        new JEmpCont();
    }
}

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

        delD30();

    }


    /*
        테이블의 데이터 삭제는 원칙적으로 트리거가 처리하는 것이 원칙이다.

        여기서는 질의명령으로 수동으로 처리하기로 해보자.

        순서는
        삭제명령의 경우
        먼저 데이터를 백업테이블에 백업한 후

        해당 테이블에서 삭제해야 한다.

        따라서 데이터베이스 작업이 두 번 실행되어야 하고
        결과적으로 질의명령이 두개가 작성되어야 한다.

        여기서는 jemp 테이블의 30번 부서 사원들을 삭제해보자.

     */

    public void delD30() {
        // 백업 먼저 하고
        int cnt = jDao.backupDno30();

        // 결과 출력
        System.out.println(30 + "번 부서 " + cnt + " 명의 데이터를 백업했습니다.");

        // 삭제
        int result = jDao.delDno30();

        // 결과 출력
        System.out.println(30 + "번 부서 " + result + " 명의 데이터를 삭제했습니다.");


    }


    // 데이터 입력 전용 함수
    public void addJennie(){
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
    }


    // 추가된 사원의 정보를 조회해서 출력하는 함수 -- MAX empno 조회하면 될듯
    public void printLast(){
        // 데이터 받기
        EmpVO evo = jDao.getLast();
        System.out.println();
        System.out.println("### 마지막 입사한 사원 정보 ###");
        System.out.printf("사원번호 : %4d\n사원이름 : %10s\n사원직급 : %10s\n입 사 일 : %20s\n부서번호 : %2d",evo.getEno(), evo.getEname(), evo.getJob(), evo.getSdate(), evo.getDno());

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

package interdb.controller;

import interdb.dao.MemberDao;
import interdb.vo.MemberVO;

import java.util.Scanner;

public class MemberInfo {
    private MemberDao mDao;
    private MemberVO mvo;

    public MemberInfo() {
        mDao = new MemberDao();
        mvo = new MemberVO();
        Scanner sc = new Scanner(System.in);

        while (true) {
            // 메세지 출력하고
            System.out.print("조회하고자 하는 회원번호를 입력해주세요 \n종료하시려면 0번을 입력해주세요\n:");
            int mno = sc.nextInt();
            System.out.println();

            if(mno == 0){
                System.out.println("### 프로그램을 종료합니다 ###");
                return;
            }
            mvo = mDao.getMember(mno);
            System.out.println("*** " + mno + "번 사원 정보조회");
            System.out.println("==============================================");
            System.out.println("|  아이디  |  회원이름  |       이메일       |");
            System.out.println("----------------------------------------------");

            System.out.printf("|%7s   | %8s | %18s |\n", mvo.getId(), mvo.getName(), mvo.getMail());

            System.out.println("==============================================");
            System.out.println();
        }
    }

    public static void main(String[] args) {
        new MemberInfo();
    }
}


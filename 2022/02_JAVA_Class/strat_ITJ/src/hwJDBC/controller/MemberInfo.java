package hwJDBC.controller;
/*
    Created by HG on 2022-05-01
    
*/

import hwJDBC.dao.MemberDao;
import hwJDBC.vo.MemberVO;

import java.util.Scanner;


public class MemberInfo {

    private MemberDao mDao;
    private MemberVO mvo;

    public MemberInfo() {
        mDao = new MemberDao();
        mvo = new MemberVO();
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.print("조회할 회원번호를 입력하세요. \n종료하려면 0을 입력하세요.\n:");
            int mno = sc.nextInt();
            System.out.println();

            if(mno == 0){
                System.out.println("@@@@@@@ 프로그램을 종료합니다 @@@@@@@");
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

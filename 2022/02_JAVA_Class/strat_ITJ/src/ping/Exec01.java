package ping;
/*
    Created by HG on 2022-03-28
    
*/

import java.util.Scanner;

public class Exec01 {
    public Exec01() {
        boolean bool = true;
        Scanner sc = new Scanner(System.in);

        // 메세지 출력

        PingServer02 t1 = new PingServer02();

        System.out.println("*** 핑서버 프로그램 *** \n서버기동 : START\n서버중단 : quit\n명령을 입력하세요.");
        String str = sc.nextLine();

        switch (str) {
            case "start":
                break;
            case "quit":
                // 할일 없음..
                break;
        }
    }
}

package day19;

/*
    클라이언트가 접속하면 접속을 받고 클라이언트가 준 데이터를 받아보고
    적당한 내용으로 응답하는 서버를 만들어보자
 */

import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.StandardCharsets;

public class PingServer01 {

    public PingServer01() {
        // 대표전화(접속만 받는 전화기)를 만들어놓는다.

        ServerSocket server = null;

        try {
            server = new ServerSocket(7777);        // 7777번 포트로 접속을 요청하는 것을 받을준비
            System.out.println("서버 접속 대기...");

            Socket socket = server.accept();
            /*
                이 함수는 blocking 함수이다.
                특정한 조건이 만족되지 않으면 실행되지 않는 함수라는 뜻.

                우리가 사용했던 함수 중
                    System.in.read()
                    sc.nextLine() 도 blocking 함수.

                accept() 는 누군가 접속을 요청해야만 실행되는 함수.
                따라서 이 함수가 실행되었다는 것은 누군가 접속을 요청했다는 것이 되고
                그러면 서버에서는 담당자 전화기를 배정해 주어야 한다.
             */

            // 즉 반환값으로 실제로 통신할 전화기를 배정해주어야 한다.

            System.out.println("서버 접속 완료..");

            /*
                여기까지 실행되었다는 것은 누군가 접속했다는 것이 되고
                그리고 그 사람과 통신할 전화기도 배정이 된 상태.
                그러면 그 전화기를 이용해서 상대방과 통신이 가능할 것이고
                우리는 자바로 만들기 때문에 스트림 방식으로 통신해야 한다.
             */

            InputStream in = socket.getInputStream();
            OutputStream out = socket.getOutputStream();

            // 먼저 데이터를 받아본다.
            byte[] buff = new byte[1024];
            int len = in.read(buff);

            String msg = new String(buff, 0, len);

            // 출력
            System.out.println("받은 메세지 : " + msg);

            // 적당한 메세지로 응답
            msg = msg + " <<== 잘 받았습니다.";
            buff = msg.getBytes(StandardCharsets.UTF_8);

            // 스트림에 보낸다.
            out.write(buff);



        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        new PingServer01();
    }
}

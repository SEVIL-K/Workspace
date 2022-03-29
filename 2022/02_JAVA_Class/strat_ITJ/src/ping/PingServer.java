package ping;
/*
    Created by HG on 2022-03-28
    
*/

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.StandardCharsets;

public class PingServer {
    ServerSocket server;


    public PingServer() {
        try {
            server = new ServerSocket(7777);        // 클라이언트가 서버와 통신할 수 있도록 관리하는 소켓

            while (true) {
                System.out.println("서버 접속 대기");

                // 접속해오는 클라이언트에게 접속허용
                Socket socket = server.accept();        // 소켓 생성
                String ip = socket.getInetAddress().getHostAddress();
                System.out.println("### " + ip + " ] 접속 완료");

                // 데이터 입출력 준비
                InputStream in = socket.getInputStream();
                OutputStream out = socket.getOutputStream();

                // 데이터 받기
                byte[] buff = new byte[10240];
                int len = in.read(buff);
                // 문자열 변환
                String msg = new String(buff, 0, len);
                // 출력
                System.out.println(ip + " : " + msg);

                // 응답 메세지
                // 데이터 만들고
                String remsg = msg + " - server";
                // 서버메세지 전송
                byte[] buff1 = remsg.getBytes(StandardCharsets.UTF_8);
                out.write(buff1);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

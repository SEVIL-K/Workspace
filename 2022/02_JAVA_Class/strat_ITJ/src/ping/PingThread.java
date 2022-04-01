package ping;
/*
    Created by HG on 2022-04-01
    
*/

import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;

public class PingThread extends Thread {
    private boolean isStart = true;
    private ServerSocket server;
    private Socket socket;
    private InputStream in;
    private OutputStream out;

    public boolean isStart() {
        return isStart;
    }

    public void setStart(boolean isStart) {
        this.isStart = isStart;
    }

    public ServerSocket getServer() {
        return server;
    }

    public void setServer(ServerSocket server) {
        this.server = server;
    }

    public Socket getSocket() {
        return socket;
    }

    public void setSocket(Socket socket) {
        this.socket = socket;
    }

    public InputStream getIn() {
        return in;
    }

    public void setIn(InputStream in) {
        this.in = in;
    }

    public OutputStream getOut() {
        return out;
    }

    public void setOut(OutputStream out) {
        this.out = out;
    }

    // 1-1
    @Override
    public void run() {
        try {
            // 1-2
            server = new ServerSocket(7777);
            System.out.println("@@ 서버 시작 @@");
            doResponse();
        } catch (SocketException e) {
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            allClose();
            System.out.println();
            System.out.println("-------------------");
            System.out.println("| @@ 서버 종료 @@ |");
            System.out.println("-------------------");
        }
    }

    // 1-3
    // 클라이언트가 접속하면 메세지 받아서 응답해주는 함수
    public void doResponse() throws SocketException, Exception {
        while (isStart) {
            socket = server.accept();

            String ip = socket.getInetAddress().getHostAddress();
            System.out.println("\n" + ip + " - 연결됨..");

            in = socket.getInputStream();
            out = socket.getOutputStream();

            byte[] buff = new byte[10240];
            int len = in.read(buff);
            String msg = new String(buff, 0, len);
            System.out.println(ip + " : " + msg);

            buff = new String("다음 메세지를 성공적으로 받았습니다. ] " + msg).getBytes();
            out.write(buff);
        }
    }


    // 열려있는 자원 모두 반환해주는 함수
    public void allClose() {
        close(out);
        close(in);
        close(socket);
        close(server);
    }

    // 1-4
    // 사용하지 않는 자원 반환해주는 함수
    public void close(Object o) {
        try {
            if (o instanceof Socket) {
                ((Socket) o).close();
            } else if (o instanceof ServerSocket) {
                ((ServerSocket) o).close();
            } else if (o instanceof InputStream) {
                ((InputStream) o).close();
            } else if (o instanceof OutputStream) {
                ((OutputStream) o).close();
            }
        } catch (Exception e) {
        }
    }
}
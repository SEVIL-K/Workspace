package day19;

import java.net.DatagramPacket;
import java.net.InetAddress;

/*
    Created by HG on 2022-03-24
    
*/
public class ReceiveThread extends Thread {
    Jjokji main;
    public ReceiveThread(Jjokji main) {
        this.main = main;
    }

    @Override
    public void run() {
        super.run();
        // 받아야 할 쪽지가 있는지 반복해서 확인하는 작업이 필요하다.

        try {
            while (true) {
                // 할 일
                // 패킷으로 도착한 쪽지를 받아야 한다.
                // 따라서 반드시 패킷을 준비해서 받아야 한다.
                byte[] buff = new byte[1024];
                DatagramPacket pack = new DatagramPacket(buff, 0, 1024);

                main.rSocket.receive(pack);     // receive() 함수 역시 blocking 함수이다. 패킷이 도착했을 때 실행되는 함수.

                // 도착한 패킷을 대화상자를 이요해서 출력한다.
                receiveProc(pack);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 쪽지를 받으면 받은 쪽지를 처리해주는 함수
    public void receiveProc(DatagramPacket pack) {
        // 할 일
        // 1. 포장을 뜯어서 내용물 확인

        // 보낸 데이터 확인
        byte[] buff = pack.getData();
        String msg = new String(buff, 0, buff.length);

        // 보낸사람 정보 확인
        InetAddress addr = pack.getAddress();
        String ip = addr.getHostAddress();

        // 아이피에 해당하는 보낸사람 이름 꺼내오기
        String name = main.ipToName.getProperty(ip);

        ReceiveDlg dlg = new ReceiveDlg(main);
        dlg.field.setText(name);
        dlg.area.setText(msg);
    }
}

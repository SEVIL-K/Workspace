package day19;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.DatagramSocket;
import java.net.SocketException;
import java.util.Vector;
import java.util.Properties;
import java.util.Set;

/*
    강의실에 오신분들은 자기 컴퓨터의 아이피와 이름을 카톡으로 주세요.

    192.168.0.2=윤한기
 */
public class Jjokji {
    // 이름을 알려주면 주소를 찾아내는 Map
    // 주소를 알려주면 이름을 찾아내는 Map
    Properties nameToIp, ipToName;

    JList list;
    JButton sendB;
    JFrame frame;

    DatagramSocket sSocket, rSocket;
    /*
        sSocket은 쪽지를 보내기 위한 소켓
        rSocket은 쪽지를 받기 위한 소켓

        반드시 두개를 만들어야 하는 것은 아니고, 소켓 하나만 가지고 있어도 보내기와 받기를 동시에 쓸 수 있다.

        다만 하나를 공유하는 경우는 보내는 도중에는 받을수 없다.

        따라서 안전한 통신을 위해서 보내는 소켓과 받는 소켓을 구분해서 처리하는 것이 좋다.
     */
    public Jjokji() {
        setMap();

        // UI 제작
        frame = new JFrame("쪽지 프로그램");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // 목록 상자에 친구 이름을 기록해서 넣자.
        // Map에서 친구이름만 찾아서 넣어보자.
        Set set = nameToIp.keySet();
        Vector<String> nameList = new Vector<String>(set);

        list = new JList(nameList);

        JScrollPane sp = new JScrollPane(list);


        // 버튼
        sendB = new JButton("쪽지 쓰기");

        Jjokji j = this;
        sendB.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String name = (String) list.getSelectedValue();
                frame.setVisible(false);
                MsgWrite msg = new MsgWrite(j);
                msg.field.setText(name);
            }
        });

        frame.add(sp, BorderLayout.CENTER);
        frame.add(sendB, BorderLayout.SOUTH);


        frame.setSize(600, 500);
        frame.setVisible(true);
        frame.setResizable(false);


        /*
            이제 프로그램이 시작되었으므로 네트워크 구성을 할 차례이다.
            여기서는 UDP 통신을 해야 하므로 DatagramSocket을 이용해서 네트워크 구성을 해야한다.
         */

        try {
            sSocket = new DatagramSocket();
            rSocket = new DatagramSocket(7777);
            /*
                이렇게하면 누군가에게 접속한 것이 아니고 네트워크 회선에만 접속한 상태.
                    ==> 통신이 가능하도록 설정해주는 것.
             */

            // 이제 네트워크 구성이 완료되었으므로 쪽지를 보내고 받을수 있다.
            // 받는 프로그램을 시작하자.
            // 받는 프로그램은 다른 프로그램들과 병행해서 처리가 되어야하므로 스레드로 구성한다.

            ReceiveThread t = new ReceiveThread(this);      // new born 상태

            // Runnable 상태로 전위시키기
            t.start();


        } catch (SocketException e) {
            // 위 작업이 예외가 발생한 것은 이 프로그램이 더이상 제기능을 하지 못하므로 열린 소켓을 닫아준다.
            close();
            e.printStackTrace();
        }

    }

    // 자원 반환해주는 함수
    public void close() {
        try {
            sSocket.close();
            rSocket.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //  맵을 파일의 내용으로 세팅해주는 함수
    public void setMap(){
        nameToIp = new Properties();
        ipToName = new Properties();

        FileInputStream fin1 = null;
        FileInputStream fin2 = null;


        try {
            fin1 = new FileInputStream("src\\day19\\nameIp_ko.properties");
            fin2 = new FileInputStream("src\\day19\\ipName_ko.properties");

            nameToIp.load(fin1);
            ipToName.load(fin2);


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                fin1.close();
                fin2.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    public static void main(String[] args) {
        new Jjokji();
    }

}

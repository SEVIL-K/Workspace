package day19;

import java.net.InetAddress;
import java.net.UnknownHostException;

/*
    네트워크에서 가장 중요한 요소는 IP주소이다
    자바는 IP주소의 정보를 관리하는 클래스를 제공하고 있다.
        ==>> InetAddress

    1. 내 컴퓨터의 IP주소를 알아보자.
    2. 네이버 서버의 IP 주소를 알아보자.
 */
public class Test01 {

    public Test01(){
        /*
            방법
                getByName(String host)  ==>> 지정한 주소를 이용해서 IP주소를 관리

                getLocalHost()  ==>> 현재 시스템의 IP주소를 알려준다

            참고 ]
                localhost : 현재시스템 127.0.0.1
         */

        InetAddress inet = null;

        try {
            inet = InetAddress.getLocalHost();

            /*
                InetAddress 클래스는 정보를 관리하는 클래스이므로
                정보를 꺼내는 함수가 중요함수가 된다.

                1. IP주소를 꺼내는 함수
                    getHostAddress()

                2. 도메인 주소를 꺼내는 함수
                    getHostName()

             */

            String ip = inet.getHostAddress();
            String dmain = inet.getHostName();

            System.out.println(inet);
            System.out.println(ip);
            System.out.println(dmain);
            System.out.println();

            // 네이버의 정보를 출력해보자
            inet = InetAddress.getByName("www.naver.com");

            // 만들어진 객체에서 정보를 꺼내보자
            String naverIp = inet.getHostAddress();
            String naverDmain = inet.getHostName();

            System.out.println(naverIp);
            System.out.println(naverDmain);

        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        new Test01();
    }
}

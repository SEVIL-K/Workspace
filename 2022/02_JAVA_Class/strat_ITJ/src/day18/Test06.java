package day18;


import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;

/*
    정보를 Friend 클래스를 이용해서 저장해보자

    ObjectOutputStream 을 이용해서 저장

 */
public class Test06 {

    public Test06(){

        // 기본스트림
        FileOutputStream fout = null;

        // 보조스트림
        ObjectOutputStream oout = null;

        // 데이터 생성
        Friend info = new Friend();
        info.setName("HG");
        info.setTel("010-0000-0000");
        info.setMail("HG@naver.com");
        info.setAddr("서울 성동구");
        info.setBlood("A");
        info.setAge(30);
        info.setHeight(174.3f);
        info.setGen('M');
        info.setRh(true);

        try {
            // 스트림 연결
            fout = new FileOutputStream("src\\day18\\result\\info_hg.txt");
            // 필터스트림 연결
            oout = new ObjectOutputStream(fout);

            // 준비된 데이터를 쓴다.
            oout.writeObject(info);

            System.out.println("완료");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                oout.close();
                fout.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    public static void main(String[] args) {
        new Test06();
    }
}

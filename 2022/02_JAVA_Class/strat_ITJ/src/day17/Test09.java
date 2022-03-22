package day17;

/*
    파일에 친구의 정보를 저장해보자
    
    정보
        이름      String
        나이      int
        신장      float
        성별      char
        전화      string
        메일      string
        혈액형    char
        RH        boolean
 */

import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class Test09 {

    public Test09() {

        // 스트림 준비
        FileOutputStream fout = null;

        // 보조스트림
        DataOutputStream dout = null;

        try {
            fout = new FileOutputStream("src\\day17\\result\\dataouput.txt");
            dout = new DataOutputStream(fout);

            // 데이터 준비
            String name = "HG";
            int age = 30;
            float height = 174.2f;
            char gen = 'M';
            String tel = "010-0000-0000";
            String mail = "HG@naver.com";
            char blood = 'A';
            boolean rh = true;      // rh+ = true
            
            // DataInput/OutputStream 의 특징은 자바의 데이터를 변환없이 사용할 수 있다.
            dout.writeUTF(name);
            dout.writeInt(age);
            dout.writeFloat(height);
            dout.writeChar(gen);
            dout.writeUTF(tel);
            dout.writeUTF(mail);
            dout.writeChar(blood);
            dout.writeBoolean(rh);

            System.out.println("저장 성공");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                dout.close();
                fout.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        new Test09();
    }

}

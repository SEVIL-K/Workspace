package day17;

/*
    이미지 파일 복사해보기.
 */


import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class Test03 {

    public Test03(){

        // 할 일
        // 스트림은 단방향.
        // 복사라는 작업은 한 곳에서 읽어서 다른곳에 쓰는 작업이다.
        // 따라서 읽는 스트림 쓰는 스트림 두개 준비되어야 한다.

        // 스트림 준비
        FileInputStream fin = null;
        FileOutputStream fout = null;


        try {
            // 스트림 만들기
            fin = new FileInputStream("src\\day17\\iu.jpg");
            fout = new FileOutputStream("src\\day17\\result\\iu.jpg");
            // 읽은것 그대로 쓴다.
            // 몇 번 읽어야 할 지 모르므로
            while (true) {
                byte[] buff = new byte[1024];
                int len = fin.read(buff);
                if (len == -1) {
                    // 더 이상 읽은 데이터가 없으므로
                    break;
                }
                
                fout.write(buff,0,len);
                
            }

            System.out.println("파일 복사 완료");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                fout.close();
                fin.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        new Test03();
    }
}

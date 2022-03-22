package day17;

/*
    이전 예저에서 만든 파일(FileTest01.txt)을 읽어보자
 */


import java.io.FileInputStream;
import java.io.IOException;

public class Test02 {

    public Test02(){
        // 작업순서
        // 1. 파일로 연결된 스트림을 준비한다.
        FileInputStream fin = null;
        FileInputStream fin_1 = null;

        try {
            // 스트림 연결
            fin = new FileInputStream("src\\day17\\result\\FileTest01.txt");
            fin_1 = new FileInputStream("src\\day17\\Test01.java");

            // 2. 한글자만 읽는다.
            int ch = fin.read();

            // 3. 출력한다.
            System.out.println("읽은 문자 : " + (char)ch);

            // 4. 여러글자 읽는다.
            byte[] buff = new byte[10];
            int len = fin.read(buff);

            // byte 배열을 문자열로 변환한다.
            String str = new String(buff, 0, len);
            System.out.println("읽은 내용 : " + str);


            // Test01.java 파일을 읽어서 출력한다.
            // 몇글자를 읽어야 할 지 모르므로 반복해서 처리한다.
            // 더이상 읽을 내용이 없을 때까지 반복해서 처리.
            // 더 읽을 내용이 없는 경우는
            //  int read(byte[] b)  함수의 반환값이 -1 을 반환한다.
            // 따라서 함수 실행읠 반환값이 -1 이 될 때까지 반복해서 처리하면 된다.

            while (true) {
                // byte 배열 준비
                byte[] buff_1 = new byte[1024];
                // 데이터를 읽고
                int len_1 = fin_1.read(buff_1);
                if (len_1 == -1) {
                    // 이 경우는 더이상 데이터가 없는 경우이므로 반복실행을 즉시 종료한다.
                    break;
                }

                // 읽은 byte 배열을 문자열로 변환해서 출력한다.
                String str_1 = new String(buff_1, 0, len_1);
                // 출력
                System.out.printf(str_1);
            }



        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                fin.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        new Test02();
    }
}

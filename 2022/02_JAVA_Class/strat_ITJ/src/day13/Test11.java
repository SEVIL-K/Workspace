package day13;

/*
    poem.txt 파일을 읽어서 출력해보자
 */

import java.io.FileInputStream;

public class Test11 {

    public Test11(){
        FileInputStream fis = null;

        try {
            fis = new FileInputStream("src/day13/poem.txt");

            byte[] buff = new byte[1024];
            int len = fis.read(buff);
            String str = new String(buff, 0, len);
            System.out.println(str);

        }catch (Exception e){
            System.out.println("예외발생");
        }

    }

    public static void main(String[] args) {
        new Test11();
    }
}

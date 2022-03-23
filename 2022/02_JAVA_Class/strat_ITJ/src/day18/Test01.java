package day18;

import java.io.FileWriter;
import java.io.IOException;

public class Test01 {

    /*
        char 단위로 파일에 데이터를 저장하는 프로그램을 작성하시오.
     */


    public Test01(){
        // 타겟 스트림(기본스트림) 을 준비
        FileWriter fw = null;

        try {
            fw = new FileWriter("src\\day18\\result\\gasa.txt");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                fw.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        new Test01();

    }
}

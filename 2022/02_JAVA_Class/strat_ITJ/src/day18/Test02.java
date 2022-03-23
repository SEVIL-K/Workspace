package day18;

/*
    result 폴더에 있는 .txt파일을 읽어보자
 */



import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Test02 {

    public Test02(){


        FileReader fr = null;;

        try {
//            fr = new FileReader("src\\\day18\\result\\gasa.txt");


            // 1. 한글자만 읽어보기
            int ch = fr.read();
            //출력
            System.out.println("읽은 문자 : " + (char) ch);     // 코드값으로 반환된 숫자를 문자로 강제 형변환


            // 2. 여러 글자 읽어보기
            char[]buff = new char[1024];
            int len = fr.read(buff);        // 읽은 데이터를 입력한 배열에 채워준다. 반환값은 읽은 문자

            // 읽은 데이터를 문자열로 변환
            String str = new String(buff, 0, len);

            System.out.println(str);

            // 3. 문서 전체를 읽어보자
            // 문자 배열 준비

            char[] buff__all = new char[1024];
            while (true) {
                int len_all = fr.read(buff__all);

                if (len_all == -1) {
                    // 이 경우는 문자가 없는 경우
                    break;
                }

                // 이 행을 실행하는 경우는 읽어온 만자가 있는 경우
                String str_all = new String(buff__all, 0, len_all);

                // 출력

                System.out.printf(str_all);


            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                fr.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    public static void main(String[] args) {
        new Test02();
    }

}

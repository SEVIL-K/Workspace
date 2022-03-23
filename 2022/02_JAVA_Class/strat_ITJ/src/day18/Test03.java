package day18;


/*
    이미지 파일을 문자단위 스트림으로 복사
    result / iu.jpg -> iu_copy.jpg

    원칙은 문자단위 스트림으로 주고받으면 안된다.
    바이트코드가 역순이 될 수 있기 때문에

    결과는 복사된 이미지 파일이 안보이는 것이 정상이다.


 */
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Test03 {

    public Test03(){
        // 기본스트림이 두개 필요

        FileReader fr = null;
        FileWriter fw = null;


        try {
            fr = new FileReader("src\\day18\\result\\iu.jpg");
            fw = new FileWriter("src\\day18\\result\\iu_copy.jpg");

            // 몇 번 반복할지 모르는 상태
            char[] buff = new char[1024];
            while (true) {
                // 읽어서 배열에 채워주기
                int len = fr.read(buff);

                // 읽은 데이터가 없는 경우
                if (len == -1) {
                    break;
                }

                // 읽은 데이터 쓰기
                fw.write(buff, 0, len);
            }

            // 결과 출력
            System.out.println("완료");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                fr.close();
                fw.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        new Test03();
    }
}

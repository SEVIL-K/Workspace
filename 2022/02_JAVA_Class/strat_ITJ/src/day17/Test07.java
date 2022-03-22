package day17;

/*
    키보드를 이용해서 문자를 입력받아보자.
 */

import java.util.Arrays;

public class Test07 {

    public Test07() {
        /*
            참고 ]
                키보드 역시 입력장치로 외부장치이다.
                자주 사용하는 외부장치이므로 이미 스트림을 준비한 변수가 존재한다.

                System.in
         */

        System.out.print("입력해주세요 : ");
        int ch = 0;

        try {
            /*
            // 1. 한글자만
            ch = System.in.read();
            // 출력
            System.out.println("입력한 문자는 : " + (char)ch);


            // 2. 문장을 입력해서 읽어보자
            // 여러 문자를 기억할 변수를 준비한다.

            byte[] buff = new byte[256];        // 배열을 만들 때 입력한 숫자가 한번에 읽을 수 있는 데이터의 양을 결정한다.
            int len = System.in.read(buff);     // len : 읽은 문자의 갯수를 반환

            // 읽은 데이터를 문자로 변환해서 출력
            String str = new String(buff, 0, len);

            // 출력
            System.out.println("입력받은 문장 : " + str);
*/

            // 3. 주로 네트워크 처리를 할 때 많이 사용하는 방법
            byte[] buff_2 = new byte[256];

            // 배열에 기본값을 'A'로 채워보자.
            Arrays.fill(buff_2, (byte) 'A');        // 배열 전체를 'A'로 채워넣는다.
            int len_2 = System.in.read(buff_2, 10, 100);  // 준비된 배열인 buff_2의 11번째 부터 최대 100개까지 읽은 내용을 기억하세요.
            String str_2 = new String(buff_2, 0, len_2 + 10);
            System.out.println("입력한 내용 : " + str_2);

        } catch (Exception e){

        }
    }

    public static void main(String[] args) {
        new Test07();
    }
}
